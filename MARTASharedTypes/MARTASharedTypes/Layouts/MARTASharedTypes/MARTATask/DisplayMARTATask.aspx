﻿<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisplayMARTATask.aspx.cs" Inherits="MARTASharedTypes.Layouts.MARTASharedTypes.MARTATask.DisplayMARTATask" DynamicMasterPageFile="~masterurl/default.master" %>

<asp:Content ID="PageHead" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">

</asp:Content>

<asp:Content ID="Main" ContentPlaceHolderID="PlaceHolderMain" runat="server">

<table id="agendaFormTable"  border="0"  width="100%"> 
                     <tr> 
                         <td  class="ms-toolbar"  nowrap="nowrap"> 
                            <SharePoint:FormToolBar ID="FormToolBar1"  runat="server"  ControlMode="Display"  /> 
                         </td> 
                     </tr> 
                     <tr> 
                         <td> 
                                 <table  border="0"  cellspacing="0"  width="100%"> 
                                    
                                     <tr> 
                                         <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                             <h3  class="ms-standardheader"> 
                                                 <nobr> Title</nobr> 
                                             </h3> 
                                         </td> 
                                         <td  width="400px"  valign="top"  class="ms-formbody"> 
                                             <SharePoint:FormField  runat="server"  ID="field_Title"  ControlMode="Display"  FieldName="Title"  /> 
                                             <SharePoint:FieldDescription  runat="server"  ID="field_Title_Description"  FieldName="Title" 
                                                 ControlMode="Display" /> 
                                              
                                         </td> 
                                     </tr>
                                      <tr> 
                                         <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                             <h3  class="ms-standardheader"> 
                                                 <nobr> Predecessors</nobr> 
                                             </h3> 
                                         </td> 
                                         <td  width="400px"  valign="top"  class="ms-formbody"> 
                                             <SharePoint:FormField  runat="server"  ID="field_Predecessors"  ControlMode="Display"  FieldName="Predecessors"  /> 
                                             <SharePoint:FieldDescription  runat="server"  ID="field_Predecessors_Description"  FieldName="Predecessors" 
                                                 ControlMode="Display" /> 
                                              
                                         </td> 
                                     </tr>
                                     
                                     <tr> 
                                         <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                             <h3  class="ms-standardheader"> 
                                                 <nobr> Priority</nobr> 
                                             </h3> 
                                         </td> 
                                         <td  width="400px"  valign="top"  class="ms-formbody"> 
                                             <SharePoint:FormField  runat="server"  ID="field_Priority"  ControlMode="Display"  FieldName="Priority"  /> 
                                             <SharePoint:FieldDescription  runat="server"  ID="field_Priority_Description"  FieldName="Priority" 
                                                 ControlMode="Display"  /> 
                                         </td> 
                                     </tr> 
                                     
                                     <tr> 
                                         <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                             <h3  class="ms-standardheader"> 
                                                 <nobr> Status</nobr> 
                                             </h3> 
                                         </td> 
                                         <td  width="400px"  valign="top"  class="ms-formbody"> 
                                             <SharePoint:FormField  runat="server"  ID="field_Status"  ControlMode="Display"  FieldName="Status"  /> 
                                             <SharePoint:FieldDescription  runat="server"  ID="field_Status_Description"  FieldName="Status" 
                                                 ControlMode="Display"  /> 
                                            
                                         </td> 
                                     </tr>

                                     <tr> 
                                         <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                             <h3  class="ms-standardheader"> 
                                                 <nobr> % Complete</nobr> 
                                             </h3> 
                                         </td> 
                                         <td  width="400px"  valign="top"  class="ms-formbody"> 
                                             <SharePoint:FormField  runat="server"  ID="field_PercentComplete"  ControlMode="Display"  FieldName="PercentComplete"  /> 
                                             <SharePoint:FieldDescription  runat="server"  ID="field_PercentComplete_Description"  FieldName="PercentComplete" 
                                                 ControlMode="Display"  /> 
                                         </td> 
                                     </tr>

                                     <tr class="invisible"> 
                                         <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                             <h3  class="ms-standardheader"> 
                                                 <nobr> Assigned To </nobr> 
                                            </h3> 
                                         </td> 
                                         <td  width="400px"  valign="top"  class="ms-formbody"> 
                                              <SharePoint:UserField id="originalAssignee" runat="server" FieldName="AssignedTo" ControlMode="Display"/> 
                                             <SharePoint:FieldDescription  runat="server"  ID="field_AssignedTo_Description"  FieldName="AssignedTo" 
                                                 ControlMode="Display"  /> 
                                         </td> 
                                     </tr>

                                     

                                     <tr> 
                                         <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                             <h3  class="ms-standardheader"> 
                                                 <nobr> Description </nobr> 
                                            </h3> 
                                         </td> 
                                         <td  width="400px"  valign="top"  class="ms-formbody"> 
                                             <SharePoint:FormField  runat="server"  ID="field_Description"  ControlMode="Display"  FieldName="Description"  /> 
                                             <SharePoint:FieldDescription  runat="server"  ID="field_Description_Description"  FieldName="Description" 
                                                 ControlMode="Display" /> 
                                         </td> 
                                     </tr>

                                     <tr> 
                                         <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                             <h3  class="ms-standardheader"> 
                                                 <nobr> Start Date </nobr> 
                                            </h3> 
                                         </td> 
                                         <td  width="400px"  valign="top"  class="ms-formbody"> 
                                           <SharePoint:FormField  runat="server"  ID="field_StartDate"  ControlMode="Display"  FieldName="StartDate"  /> 
                                             <SharePoint:FieldDescription  runat="server"  ID="field_StartDate_Description"  FieldName="StartDate" 
                                                 ControlMode="Display" /> 
                                         </td> 
                                     </tr>
                                    
                                    <tr> 
                                         <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                             <h3  class="ms-standardheader"> 
                                                 <nobr> Due Date </nobr> 
                                            </h3> 
                                         </td> 
                                         <td  width="400px"  valign="top"  class="ms-formbody"> 
                                           <SharePoint:FormField  runat="server"  ID="field_DueDate"  ControlMode="Display"  FieldName="DueDate"  /> 
                                             <SharePoint:FieldDescription  runat="server"  ID="field_DueDate_Description"  FieldName="DueDate" 
                                                 ControlMode="Display" /> 
                                         </td> 
                                     </tr>

                                     <tr>
                                        <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                             <h3  class="ms-standardheader"> 
                                                 <nobr> Task Source </nobr> 
                                            </h3> 
                                         </td> 
                                         <td  width="400px"  valign="top"  class="ms-formbody"> 
                                           <SharePoint:FormField  runat="server"  ID="fieldTaskSource"  ControlMode="Display"  FieldName="TaskSource"  /> 
                                             <SharePoint:FieldDescription  runat="server"  ID="field_TaskSource_Description"  FieldName="TaskSource" 
                                                 ControlMode="Display" /> 
                                         </td>
                                        
                                     </tr>

                                     <tr>
                                        <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                             <h3  class="ms-standardheader"> 
                                                 <nobr> Action Owed </nobr> 
                                            </h3> 
                                         </td> 
                                         <td  width="400px"  valign="top"  class="ms-formbody"> 
                                           <SharePoint:FormField  runat="server"  ID="fieldActionOwed"  ControlMode="Display"  FieldName="ActionOwed"  /> 
                                             <SharePoint:FieldDescription  runat="server"  ID="fieldActionOwedDescription"  FieldName="ActionOwed" 
                                                 ControlMode="Display" /> 
                                         </td>
                                        
                                     </tr>

                                      <tr>
                                        <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                             <h3  class="ms-standardheader"> 
                                                 <nobr> Related Information </nobr> 
                                            </h3> 
                                         </td> 
                                         <td  width="400px"  valign="top"  class="ms-formbody"> 
                                           <SharePoint:FormField  runat="server"  ID="fieldRelatedInfo"  ControlMode="Display"  FieldName="RelatedInfo"  /> 
                                             <SharePoint:FieldDescription  runat="server"  ID="fieldRelatedInfoDescription"  FieldName="RelatedInfo" 
                                                 ControlMode="Display" /> 
                                         </td>
                                        
                                     </tr>

                                     <!-- Delegate Task Begin -->
                                      <tr>
                                     <td class="ms-formlabel" valign="top" nowrap="true" width="25%">
                                        <b><asp:Label ID="lblDelegateTask" runat="server"> Delegate Task: </asp:Label></b>
                                     </td>
                                     <td class="ms-formbody" valign="top" width="75%">
                                       <asp:CheckBox runat="server" ID="chkDelegateTask" AutoPostBack="true" OnCheckChanged="chkDelegate_Checked" Text="Delegate Task" />
                                       <asp:Button Text="Re-assign to owner" runat="server" ID="btnReassignToOwner" />
                                     </td>
                                 </tr>

                                 <asp:Panel ID="pnlDelegateTask" runat="server" visible="false">
                                  <tr>
                                     <td class="ms-formlabel" valign="top" nowrap="true" width="25%">
                                        <b> Delegate To:</b>
                                     </td>
                                     <td class="ms-formbody" valign="top" width="75%">
                                         <SharePoint:UserField id="delegateTo" runat="server" FieldName="AssignedTo" ControlMode="Edit"/>
                                     </td>
                                 </tr>
                                
                                 <tr>
                                     <td class="ms-formlabel" valign="top" nowrap="true" width="25%">
                                        <b> Due Date:</b>
                                     </td>
                                     <td class="ms-formbody" valign="top" width="75%">
                                         <SharePoint:DateTimeControl id="delegateDueDate" runat="server" DateOnly="true" />
                                     </td>
                                 </tr>
                                 
                                 <tr>
                                     <td class="ms-formlabel" valign="top" nowrap="true" width="25%">
                                        <b></b>
                                     </td>
                                     <td class="ms-formbody" valign="top" width="75%">
                                       <asp:Button Text="Delegate Task" runat="server" ID="btnDelegateTask" />
                                     </td>
                                 </tr>
                                
                                 </asp:Panel>

                                 <!-- Delegate Task End -->
                                <tr>
                                <td></td>

                                <td>
                                    <table  width="100%"  border="0"  cellspacing="0"> 
                                         <tr> 
                                             <td  width="99%"  class="ms-toolbar"  nowrap="nowrap"> 
                                                 <img  src="/_layouts/images/blank.gif"  width="1"  height="18"  /> 
                                             </td> 
                                             <td  class="ms-toolbar"  nowrap="nowrap"> 
                                                 <SharePoint:SaveButton  runat="server"  ControlMode="Display"  ID="savebutton"  /> 
                                            </td> 
                                             <td  class="ms-separator"> 
                                             </td> 
                                             <td  class="ms-toolbar"  nowrap="nowrap"  align="right"> 
                                                 <SharePoint:GoBackButton  runat="server"  ControlMode="Display"  ID="gobackbutton"  /> 
                                             </td> 
                                         </tr> 
                                     </table> 
                                </td>
                             
                             </tr>
                             <SharePoint:ItemHiddenVersion ID="ItemHiddenVersion1"  runat="server"   /> 
                         </td> 
                     </tr> 
                 </table> 

</asp:Content>

<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
MARTA Task Page
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server" >
MARTA Task
</asp:Content>
