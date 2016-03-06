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
<%@ Page Title="Health Facility List" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="HealthFacilityList.aspx.cs" Inherits="Pages_HealthFacilityList" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <!--   <div class="row">
        <div class="col-md-12 col-xs-12 col-sm-12 col-lg-12 clearfix">
            <ol class="breadcrumb">
                <li><a href="Default.aspx">Home</a></li>
                <li><a href="#">Setup</a></li>
                <li class="active">
                    <asp:Label ID="lblTitle" runat="server" Text="Health Facility List" /></li>
            </ol>
        </div>
    </div> --> 

    <!-- The card that capture HealthFacilityList -->
    <div class="row">
       <div class="card" style="margin-left: 13px !important; margin-right: 30px !important;">
           <div class="card-content">
               <span class="card-title">Health Facility List</span>
               <div class="row row-sm">
                   <div class="col m12">
                       <div class="col m3">
                            <asp:Label ID="lblName" runat="server" Text="Name" />
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                       </div>
                       <div class="col m3 offset-s3">
                           <asp:Label ID="lblCode" runat="server" Text="Code" />
                            <asp:TextBox ID="txtCode" runat="server" CssClass="form-control" />
                       </div>
                       <div class="col m3 offset-m4">
                           <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary btn-raised" OnClick="btnSearch_Click" />
                       </div>
                       <div class="col m3 offset-s2">
                           <asp:Label ID="lblWarning" runat="server" Text="There are no health facilities that match your search criteria!" CssClass="label label-warning" Font-Size="Small" Visible="false" />
                             <asp:Button ID="btnAddNew" runat="server" Text="Add New" CssClass="btn btn-material-bluegrey btn-raised btn-sm" OnClick="btnAddNew_Click" />
                       </div>
                   </div>
               </div>
           </div>
       </div>
    </div>


    <!-- This Pagination is for the display information for Health Facility List using materializecss -->
    <div class="row">
        <div class="card" style="margin-left: 13px !important; margin-right: 30px !important;">
            <div class="card-content">
                <div class="card-title">
                    <span style="padding-left: 25px">Health Facility List</span>
                </div>

                <div class="table-responsive">
                    <table class="table table-bodered">
                         <asp:GridView ID="gvHealthFacility" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover table-responsive" AllowPaging="True" OnDataBound="gvHealthFacility_DataBound" OnPageIndexChanging="gvHealthFacility_PageIndexChanging">
            <PagerSettings Position="Top" Mode="NumericFirstLast" />
            <PagerStyle CssClass="pagination" HorizontalAlign="Left" VerticalAlign="Top" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="False" />
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:HyperLink ID="hlName" runat="server" NavigateUrl='<%# Eval("Id", "HealthFacility.aspx?id={0}") %>'
                            Text='<%# Eval("Name", "{0}") %>' ToolTip='<%# Eval("Notes", "{0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" Visible ="false"  />
                <asp:TemplateField HeaderText="ParentId">
                    <ItemTemplate>
                        <%#Eval("Parent.Name")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CheckBoxField DataField="TopLevel" HeaderText="TopLevel" SortExpression="TopLevel" />
                <asp:CheckBoxField DataField="Leaf" HeaderText="Leaf" SortExpression="Leaf" />
                <asp:CheckBoxField DataField="VaccinationPoint" HeaderText="VaccinationPoint" SortExpression="VaccinationPoint" />
                <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" Visible="false" />
                <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" SortExpression="IsActive" />
                <asp:BoundField DataField="ModifiedOn" HeaderText="ModifiedOn" SortExpression="ModifiedOn" Visible="False" />
                <asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" SortExpression="ModifiedBy" Visible="False" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" Visible="false" />
                <asp:BoundField DataField="Population" HeaderText="Population" SortExpression="Population" Visible="false" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="odsHealthFacility" runat="server" EnablePaging="true" SelectMethod="GetPagedHealthFacilityList" TypeName="GIIS.DataLayer.HealthFacility" SelectCountMethod="GetCountHealthFacilityList">
            <SelectParameters>
                <asp:Parameter Name="name" Type="String" />
                 <asp:Parameter Name="code" Type="String" />
                 <asp:Parameter Name="hfid" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

                        <!--This is Excel Button for downloading Health Facility List-->

                    </table>
                </div>
                <div class="row" style="overflow: auto">
                    <asp:Button ID="btnExcel" runat="server" Text="Excel" Visible="false" CssClass="btn btn-success btn-raised" OnClick="btnExcel_Click" />
                     <asp:GridView ID="gvExport" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover table-responsive" OnDataBinding="gvHealthFacility_DataBound" Visible="false">
            <RowStyle CssClass="gridviewRow" />
            <HeaderStyle CssClass="gridviewHeader" />
            <AlternatingRowStyle CssClass="gridviewRowAlt" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="False" />
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <%#Eval("Name")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
                <asp:TemplateField HeaderText="ParentId">
                    <ItemTemplate>
                        <%#Eval("Parent.Name")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CheckBoxField DataField="TopLevel" HeaderText="TopLevel" SortExpression="TopLevel" />
                <asp:CheckBoxField DataField="Leaf" HeaderText="Leaf" SortExpression="Leaf" />
                <asp:CheckBoxField DataField="VaccinationPoint" HeaderText="VaccinationPoint" SortExpression="VaccinationPoint" />
                <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" Visible="false" />
                <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" SortExpression="IsActive" />
                <asp:BoundField DataField="ModifiedOn" HeaderText="ModifiedOn" SortExpression="ModifiedOn" Visible="False" />
                <asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" SortExpression="ModifiedBy" Visible="False" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" Visible="false" />
                <asp:BoundField DataField="Population" HeaderText="Population" SortExpression="Population" Visible="false" />
            </Columns>
        </asp:GridView>
                </div>
            </div>
        </div>
    </div> 
        

</asp:Content>

