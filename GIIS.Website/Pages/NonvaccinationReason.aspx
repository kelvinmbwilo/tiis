<%-- 
*******************************************************************************
  Copyright 2015 TIIS - Tanzania Immunization Information System

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
 ******************************************************************************
--%>
<%@ Page Title="Non Vaccination Reason" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="NonvaccinationReason.aspx.cs" Inherits="_NonvaccinationReason" EnableEventValidation="false" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <!--  <div class="row">
        <div class="col-md-12 col-xs-12 col-sm-12 col-lg-12 clearfix">
            <ol class="breadcrumb">
                <li><a href="Default.aspx">Home</a></li>
                <li><a href="#">Vaccination Schedule</a></li>
                <li class="active">
                    <asp:Label ID="lblTitle" runat="server" Text="Non Vaccination Reasons" /></li>
            </ol>
        </div>
    </div>    -->

    <!-- This is the Card for NonvaccinationReason -->
    <div>
        <div class="row">
            <div class="card" style="margin-left: 30px !important; margin-right: 30px !important">
                <div class="card-content">
                    <span class="card-title">Non Vaccination Reason</span>
                    <div class="row row-sm">
                        <div class="col m12">
                            <div class="col m3">
                                 <asp:Label ID="lblName" runat="server" Text="Name" />
                                  <span style="color: Red">*</span>
                                 <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name must be filled!" ControlToValidate="txtName" ValidationGroup="saveNonvaccinationReason" Display="Dynamic" CssClass="label label-warning" Font-Size="Small" ForeColor="White" />
                            </div>
                            <div class="col m3 offset-s3">
                                <asp:Label ID="lblCode" runat="server" Text="Code" />
                               <asp:TextBox ID="txtCode" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col m3 offset-s5">
                                <asp:Label ID="lblKeepChildDue" runat="server" Text="Keep Child Due" />
                                <asp:RadioButtonList ID="rblKeepChildDue" runat="server" RepeatDirection="Horizontal">
                                     <asp:ListItem Selected="True" Value="True" Text="Yes"></asp:ListItem>
                                     <asp:ListItem Value="False" Text="No"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                            <div class="col m3 offset-s3">
                                <asp:Label ID="lblNotes" runat="server" Text="Notes" />
                                <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col m3">
                                <asp:Label ID="lblIsActive" runat="server" Text="IsActive" />
                                <asp:RadioButtonList ID="rblIsActive" runat="server" RepeatDirection="Horizontal">
                                   <asp:ListItem Selected="True" Value="True" Text="Yes"></asp:ListItem>
                                    <asp:ListItem Value="False" Text="No"></asp:ListItem>
                                 </asp:RadioButtonList>
                            </div>
                            <div class="col m3 offset-s8">
                                 <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary btn-raised" OnClick="btnAdd_Click" ValidationGroup="saveNonvaccinationReason" />
          
                                 <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-primary btn-raised" OnClick="btnEdit_Click" ValidationGroup="saveNonvaccinationReason" />

                                 <asp:Button ID="btnRemove" runat="server" Text="Remove" CssClass="btn btn-raised btn-warning" OnClick="btnRemove_Click" />
                            </div>
                            <div class="col m3">
                                 <asp:Label ID="lblSuccess" runat="server" Text="Success" CssClass="label label-success" Font-Size="Small" Visible="false" />
                                 <asp:Label ID="lblWarning" runat="server" Text="Warning" CssClass="label label-warning" Font-Size="Small" Visible="false" />
                                 <asp:Label ID="lblError" runat="server" Text="Error" CssClass="label label-danger" Font-Size="Small" Visible="false" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

 
          <!--This Card is for Grid Table for NonVaccinationReason -->

       <div class="card" style="margin-left: 30px !important; margin-right: 30px !important;">
           <div class="card-content">
               <span class="card-title">Scheduled Vaccination List</span>
               <div class="table-responsive">
                     <asp:GridView ID="gvNonvaccinationReason" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover table-responsive" AllowPaging="True" DataSourceID="odsNonvaccinationReason" OnDataBound="gvNonvaccinationReason_DataBound" OnPageIndexChanging="gvNonvaccinationReason_PageIndexChanging" EnableModelValidation="True">
            <PagerSettings Position="Top" Mode="NumericFirstLast" />
            <PagerStyle CssClass="pagination" HorizontalAlign="Left" VerticalAlign="Top" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="False" />
                <%--<asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ApplyFormatInEditMode="True" /> --%>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:HyperLink ID="hlName" runat="server" NavigateUrl='<%# Eval("Id", "NonvaccinationReason.aspx?id={0}") %>'
                            Text='<%# Eval("Name", "{0}") %>' ToolTip='<%# Eval("Notes", "{0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
                 <asp:CheckBoxField DataField="KeepChildDue" HeaderText="Keep Child Due" SortExpression="KeepChildDue" />
                <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" SortExpression="IsActive" />
                <asp:BoundField DataField="ModifiedOn" HeaderText="ModifiedOn" SortExpression="ModifiedOn" Visible="False" />
                <asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" SortExpression="ModifiedBy" Visible="False" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="odsNonvaccinationReason" runat="server" EnablePaging="true" SelectMethod="GetPagedNonvaccinationReasonList" TypeName="GIIS.DataLayer.NonvaccinationReason" SelectCountMethod="GetCountNonvaccinationReasonList">
            <SelectParameters>
                <asp:Parameter DefaultValue="1 = 1" Name="where" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

                   <div class="col-md-10 col-xs-10 col-sm-10 col-lg-10 clearfix">
                    </div>
                      <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1 clearfix">
            <asp:Button ID="btnExcel" runat="server" Text="Excel" Visible="false" CssClass="btn btn-success btn-raised" OnClick="btnExcel_Click" />
                </div>
           <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1 clearfix"></div>
           </div>
               </div>
           </div>
        
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

