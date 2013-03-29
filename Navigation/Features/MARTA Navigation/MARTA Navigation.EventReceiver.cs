using System;
using System.Runtime.InteropServices;
using System.Security.Permissions;
using Microsoft.SharePoint;
using Microsoft.SharePoint.Publishing.Navigation;
using Microsoft.SharePoint.Taxonomy;

namespace Navigation.Features.MARTA_Navigation
{
    /// <summary>
    /// This class handles events raised during feature activation, deactivation, installation, uninstallation, and upgrade.
    /// </summary>
    /// <remarks>
    /// The GUID attached to this class may be used during packaging and should not be modified.
    /// </remarks>

    [Guid("66be5091-ebd7-48a5-ad6c-4ac609202b2a")]
    public class MARTA_NavigationEventReceiver : SPFeatureReceiver
    {
        // Uncomment the method below to handle the event raised after a feature has been activated.
        const string termStorePropertyKey = "MetadataNavTermStore";
        const string globalTermSetIDPropertyKey = "MetadataNavGlobalTermSetID";
        const string localTermSetIDPropertyKey = "MetadataNavLocalTermSetID";

        public override void FeatureActivated(SPFeatureReceiverProperties properties)
        {
            //Set the master page to be our CustomMaster page.
            SPWeb currentWeb = properties.Feature.Parent as SPWeb;
            currentWeb.AllowUnsafeUpdates = true;

            string masterURL = currentWeb.Site.RootWeb.ServerRelativeUrl + "/_catalogs/masterpage/CustomMaster.master";
            string customMasterURL = currentWeb.Site.RootWeb.ServerRelativeUrl + "/_catalogs/masterpage/CustomMaster.master";
            currentWeb.MasterUrl = masterURL;
            currentWeb.CustomMasterUrl = customMasterURL;
            currentWeb.Update();

            
            //Some templates might have subsites from start.
            foreach (SPWeb subWeb in currentWeb.Site.RootWeb.GetSubwebsForCurrentUser())
            {
                ChangeMasterPage(subWeb, masterURL, customMasterURL);
            }

            TaxonomySession taxonomySession = new TaxonomySession(currentWeb.Site, updateCache: true);

            //Use the first Termstore object to see if Taxonomy Service is offline or missing.
            if (taxonomySession.TermStores.Count == 0)
                throw new InvalidOperationException("The Taxonomy Service is offline or missing.");

            string termStoreName = "Navigation"; //Default Value
            string globalTermSetID = string.Empty;
            string localTermSetID = string.Empty;
            //Check property bag for TermSetID key and value. If it doesn't exist create it.
            if (!currentWeb.AllProperties.ContainsKey(termStorePropertyKey))
                currentWeb.Properties.Add(termStorePropertyKey, termStoreName);
            else
                termStoreName = currentWeb.Properties[termStorePropertyKey];

            if (!currentWeb.AllProperties.ContainsKey(globalTermSetIDPropertyKey))
                currentWeb.Properties.Add(globalTermSetIDPropertyKey, globalTermSetID);
            else
                globalTermSetID = currentWeb.Properties[globalTermSetIDPropertyKey];

            if (!currentWeb.AllProperties.ContainsKey(localTermSetIDPropertyKey))
                currentWeb.Properties.Add(localTermSetIDPropertyKey, localTermSetID);
            else
                localTermSetID = currentWeb.Properties[localTermSetIDPropertyKey];



            if (termStoreName != string.Empty)
            {
                TermStore termStore = taxonomySession.TermStores[termStoreName];

                if (globalTermSetID != string.Empty)
                {
                    TermSet termSet = termStore.GetTermSet(new Guid(globalTermSetID));
                    if (termSet == null)
                    {
                        CreateTermSet(termStore, globalTermSetID, currentWeb);
                    }
                }
                else
                {
                    string newTermSetID = Guid.NewGuid().ToString(); //Create a new GUID and that will also be stored in the property bag.
                    CreateTermSet(termStore, newTermSetID, currentWeb); 
                    currentWeb.Properties[globalTermSetIDPropertyKey] = newTermSetID;
                    globalTermSetID = newTermSetID;
                }

                if (localTermSetID != string.Empty)
                {
                    TermSet termSet = termStore.GetTermSet(new Guid(localTermSetID));
                    if (termSet == null)
                    {
                        CreateTermSet(termStore, localTermSetID, currentWeb);
                    }
                }
                else
                {
                    string newTermSetID = Guid.NewGuid().ToString(); //Create a new GUID and that will also be stored in the property bag.
                    CreateTermSet(termStore, newTermSetID, currentWeb); 
                    currentWeb.Properties[localTermSetIDPropertyKey] = newTermSetID;
                    localTermSetID = newTermSetID;
                }
                //Once TermSet has been created. Set the correct properties
                WebNavigationSettings webNavigationSettings = new WebNavigationSettings(currentWeb);
                webNavigationSettings.GlobalNavigation.Source = StandardNavigationSource.TaxonomyProvider;
                webNavigationSettings.CurrentNavigation.Source = StandardNavigationSource.TaxonomyProvider;

                webNavigationSettings.GlobalNavigation.TermStoreId = termStore.Id;
                webNavigationSettings.GlobalNavigation.TermSetId = new Guid(globalTermSetID);

                webNavigationSettings.CurrentNavigation.TermStoreId = termStore.Id;
                webNavigationSettings.CurrentNavigation.TermStoreId = new Guid(localTermSetID);

                webNavigationSettings.AddNewPagesToNavigation = false;
                webNavigationSettings.CreateFriendlyUrlsForNewPages = true;

                

            } //if (termStoreName != string.Empty)
            
        }

        private void CreateTermSet(TermStore termStore, string termSetID, SPWeb currentWeb)
        {
            //termSet is null. Create new termSet, and set the property in the property bag.
            Group siteCollectionGroup = termStore.GetSiteCollectionGroup(currentWeb.Site);
            TermSet newTermSet = siteCollectionGroup.CreateTermSet(termSetID, new Guid(termSetID));

            NavigationTermSet navTermSet = NavigationTermSet.GetAsResolvedByWeb(newTermSet, currentWeb, StandardNavigationProviderNames.GlobalNavigationTaxonomyProvider);

            navTermSet.IsNavigationTermSet = true;
            navTermSet.CatalogTargetUrlForChildTerms.Value = "~site/Pages/Topics/Topic.aspx";

            NavigationTerm term1 = navTermSet.CreateTerm("Term 1", NavigationLinkType.SimpleLink);
            term1.SimpleLinkUrl = "http://www.bing.com/";

            Guid term2Guid = new Guid("87FAA433-4E3E-4500-AA5B-E04330B12ACD");
            NavigationTerm term2 = navTermSet.CreateTerm("Term 2", NavigationLinkType.FriendlyUrl,
                term2Guid);

            NavigationTerm childTerm = term2.CreateTerm("Term 2 child", NavigationLinkType.FriendlyUrl);

            /// Commit changes.
            childTerm.GetTaxonomyTerm().TermStore.CommitAll();

            //Add this to the property bag of the web as well.
        }

        private void ChangeMasterPage(SPWeb web, string masterURL, string customURL)
        {
            web.MasterUrl = masterURL;
            web.CustomMasterUrl = customURL;
            web.Update();
            web.Dispose();
        }


        // Uncomment the method below to handle the event raised before a feature is deactivated.

        //public override void FeatureDeactivating(SPFeatureReceiverProperties properties)
        //{
        //}


        // Uncomment the method below to handle the event raised after a feature has been installed.

        //public override void FeatureInstalled(SPFeatureReceiverProperties properties)
        //{
        //}


        // Uncomment the method below to handle the event raised before a feature is uninstalled.

        //public override void FeatureUninstalling(SPFeatureReceiverProperties properties)
        //{
        //}

        // Uncomment the method below to handle the event raised when a feature is upgrading.

        //public override void FeatureUpgrading(SPFeatureReceiverProperties properties, string upgradeActionName, System.Collections.Generic.IDictionary<string, string> parameters)
        //{
        //}
    }
}