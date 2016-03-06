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
<%@ Page Title="Place List" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="PlaceList.aspx.cs" Inherits="_PlaceList" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <!--  <div class="row">
        <div class="col-md-12 col-xs-12 col-sm-12 col-lg-12 clearfix">
            <ol class="breadcrumb">
                <li><a href="Default.aspx">Home</a></li>
                <li><a href="#">Setup</a></li>
                <li class="active">
                    <asp:Label ID="lblTitle" runat="server" Text="Place List" /></li>
            </ol>
        </div>
    </div> -->

    <!-- This card is for Placelist input setup -->
    
    <div class="row">
        <div class="card" style="margin-left: 13px !important; margin-right: 30px !important;">
            <div class="card-content">
                <span class="card-title" style="padding-left: 25px">Place List</span>
                <div class="row row-sm">
                <div class="col m12">
                    <div class="col m4">
                        <asp:Label ID="lblName" runat="server" Text="Name" />
                         <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                    </div>
                    <div class="col m4 offset-s12">
                          <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary btn-raised btn-sm" OnClick="btnSearch_Click" />
                    </div>
                    <div class="col m4 offset-s8">
                         <asp:Label ID="lblWarning" runat="server" Text="There are no places that match your search criteria!" CssClass="label label-warning" Font-Size="Small" Visible="false" />
                          <asp:Button ID="btnAddNew" runat="server" Text="Add New" CssClass="btn btn-material-bluegrey btn-raised btn-sm" OnClick="btnAddNew_Click" />
                    </div>
                </div>
              </div>
            </div>
        </div>
    </div>

    <br />

   <!-- This card display Place List information for the setup -->
        <div class="row">
            <div class="card" style="margin-left: 13px !important; margin-right: 30px !important;">
                <div class="card-content">
                    <div class="card-title">
                     <span>Place List Pagination</span>
                    </div>

                    <!--Mambo ya Pagination sasa Yeleuwiii-->
                    <div class="table-responsive">
                         <asp:GridView ID="gvPlace" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover table-responsive" AllowPaging="True" DataSourceID="odsPlace" OnDataBound="gvPlace_DataBound" OnPageIndexChanging="gvPlace_PageIndexChanging">
            <PagerSettings Position="Top" Mode="NumericFirstLast" />
            <PagerStyle CssClass="pagination" HorizontalAlign="Left" VerticalAlign="Top" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="False" />
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:HyperLink ID="hlName" runat="server" NavigateUrl='<%# Eval("Id", "Place.aspx?id={0}") %>'
                            Text='<%# Eval("Name", "{0}") %>' ToolTip='<%# Eval("Notes", "{0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ParentId">
                    <ItemTemplate>
                        <%#Eval("Parent.Name")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CheckBoxField DataField="Leaf" HeaderText="Leaf" SortExpression="Leaf" />
                <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" SortExpression="IsActive" />
                <asp:BoundField DataField="ModifiedOn" HeaderText="ModifiedOn" SortExpression="ModifiedOn" Visible="False" />
                <asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" SortExpression="ModifiedBy" Visible="False" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="odsPlace" runat="server" EnablePaging="true" SelectMethod="GetPagedPlaceList" TypeName="GIIS.DataLayer.Place" SelectCountMethod="GetCountPlaceList">
            <SelectParameters>
                <asp:Parameter Name="name" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

                        <!--Excel Button will follow below -->
                        <asp:Button ID="btnExcel" runat="server" Text="Excel" Visible="false" CssClass="btn btn-success btn-raised" OnClick="btnExcel_Click" />
                    </div>
                </div>
            </div>
        </div>
        
    <div class="row" style="overflow: auto">
        <asp:GridView ID="gvExport" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover table-responsive" OnDataBinding="gvPlace_DataBound" Visible="false">
            <RowStyle CssClass="gridviewRow" />
            <HeaderStyle CssClass="gridviewHeader" />
            <AlternatingRowStyle CssClass="gridviewRowAlt" />
                       <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="False" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:TemplateField HeaderText="ParentId">
                    <ItemTemplate>
                        <%#Eval("Parent.Name")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CheckBoxField DataField="Leaf" HeaderText="Leaf" SortExpression="Leaf" />
                <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" SortExpression="IsActive" />
                <asp:BoundField DataField="ModifiedOn" HeaderText="ModifiedOn" SortExpression="ModifiedOn" Visible="False" />
                <asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" SortExpression="ModifiedBy" Visible="False" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>


