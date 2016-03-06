﻿<%-- 
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
<%@ Page Title="Find Duplications" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="FindDuplications.aspx.cs" Inherits="Pages_FindDuplications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
      <!--  <div class="col-md-12 col-xs-12 col-sm-12 col-lg-12 clearfix">
            <ol class="breadcrumb">
                <li><a href="Default.aspx">Home</a></li>
                <li><a href="#">Child</a></li>
                <li class="active">
                    <asp:Label ID="lblTitle" runat="server" Text="Find Duplications" /></li>
            </ol>
        </div> -->
    </div>

    <!-- Page ya materialize Duplicates inaanzia Hapa! -->
    <div class="box-row">
        <div class="row">
            <div class="col l12 m12 s12">
                <div class="card" style="margin-left: 30px !important; margin-left: 30px !important;">
                    <div class="card-content">
                        <span class="card-title"> Find Duplicates </span>
                        <br /> <br />
                           <div class="row">
                              <div class="col m1 x1 s1 l1 clearfix"></div>
                              <div class="col s12 clearfix">
                              <asp:CheckBox ID="chbLastnamemain" runat="server" CssClass="col s2" Text="Lastname" Checked="True" Enabled="False" />
                              <asp:CheckBox ID="chbFirstnamemain" runat="server" Text="Firstname" CssClass="col s2 " />
                              <asp:CheckBox ID="chbBirthdatemain" runat="server" Text="Birthdate" CssClass="col s2 "/>
                              <asp:CheckBox ID="chbGendermain" runat="server" Text="Gender" CssClass="col s2" />
                              <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary btn-sm btn-raised " OnClick="btnSearch_Click"  />
                              </div>
                              <div class="col-md-4 col-xs-4 col-sm-4 col-lg-4 clearfix">
                            

                             <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1 clearfix"></div>
                             <div class="col-md-3 col-xs-3 col-sm-3 col-lg-3 clearfix">
                             
                             </div>
                            <div class="col-md-3 col-xs-3 col-sm-3 col-lg-3 clearfix">
                            
                            </div>

                     </div>
                 </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


  <!--  <div class="row">
        <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1 clearfix"></div>
        <div class="col-md-3 col-xs-3 col-sm-3 col-lg-3 clearfix">
            <asp:CheckBox ID="chbLastname" runat="server" Text="Lastname" Checked="True" Enabled="False" />
        </div>
        <div class="col-md-4 col-xs-4 col-sm-4 col-lg-4 clearfix">
            <asp:CheckBox ID="chbFirstname" runat="server" Text="Firstname" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1 clearfix"></div>
        <div class="col-md-3 col-xs-3 col-sm-3 col-lg-3 clearfix">
            <asp:CheckBox ID="chbBirthdate" runat="server" Text="Birthdate" />
        </div>
        <div class="col-md-3 col-xs-3 col-sm-3 col-lg-3 clearfix">
            <asp:CheckBox ID="chbGender" runat="server" Text="Gender" />
        </div>
    </div>
    <br /> -->
    <div class="row">
        <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1 clearfix"></div>
        <div class="col-md-8 col-xs-8 col-sm-8 col-lg-8 clearfix">
            <asp:Label ID="lblWarning" runat="server" CssClass="label label-warning" Font-Size="Small"
                Text="You should choose at least two search criteria" Visible="false"></asp:Label>
        </div>
    </div>
    
    <div class="row">
        <div class="col-md-2 col-xs-2 col-sm-2 col-lg-2 clearfix"></div>
        <div class="col-md-2 col-xs-2 col-sm-2 col-lg-2 clearfix">
            <br />
            
        </div>
    </div>
    <br />
    <div class="row">
       <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1 clearfix"></div>
        <div class="col-md-7 col-xs-7 col-sm-7 col-lg-7 clearfix">
            <asp:Label ID="lblWarningText" runat="server" Text="There are no children that match your search criteria!" CssClass="label label-warning" Font-Size="Small" Visible="false" />
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-12 col-xs-12 col-sm-12 col-lg-12 clearfix" style="overflow:auto">
            <asp:GridView ID="gvChild" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover table-responsive" OnDataBinding="gvChild_DataBinding" OnDataBound="gvChild_DataBound">
                <PagerSettings Position="Top" Mode="NumericFirstLast" />
                <PagerStyle CssClass="pagination" HorizontalAlign="Left" VerticalAlign="Top" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="False" />
                    <asp:TemplateField HeaderText="SystemID">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlSystemId" runat="server" NavigateUrl='<%# Eval("Id", "Child.aspx?id={0}") %>'
                                Text='<%# Eval("SystemId", "{0}") %>' ToolTip='<%# Eval("Notes", "{0}") %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--  <asp:BoundField DataField="SystemId" HeaderText="SystemId" SortExpression="SystemId" />--%>
                    <asp:BoundField DataField="Firstname1" HeaderText="Firstname1" SortExpression="Firstname1" />
                    <asp:BoundField DataField="Firstname2" HeaderText="Firstname2" SortExpression="Firstname2" />
                    <asp:BoundField DataField="Lastname1" HeaderText="Lastname1" SortExpression="Lastname1" />
                    <asp:BoundField DataField="Lastname2" HeaderText="Lastname2" SortExpression="Lastname2" />
                    <asp:BoundField DataField="Birthdate" HeaderText="Birthdate" SortExpression="Birthdate" />
                    <asp:TemplateField HeaderText="Gender">
                        <ItemTemplate>
                            <%# (bool)Eval("Gender") == true? "M" : "F" %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%-- <asp:CheckBoxField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />--%>
                    <asp:TemplateField HeaderText="Health Center">
                        <ItemTemplate>
                            <%#Eval("Healthcenter.Name")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Birthplace">
                        <ItemTemplate>
                            <%#Eval("Birthplace.Name")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <%#Eval("Status.Name")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="MotherFirstname" HeaderText="MotherFirstname" SortExpression="MotherFirstname" />
                    <asp:BoundField DataField="MotherLastname" HeaderText="MotherLastname" SortExpression="MotherLastname" />
                    <asp:BoundField DataField="FatherFirstname" HeaderText="FatherFirstname" SortExpression="FatherFirstname" />
                    <asp:BoundField DataField="FatherLastname" HeaderText="FatherLastname" SortExpression="FatherLastname" />
                    <asp:BoundField DataField="IdentificationNo1" HeaderText="IdentificationNo1" SortExpression="IdentificationNo1" />
                    <asp:BoundField DataField="IdentificationNo2" HeaderText="IdentificationNo2" SortExpression="IdentificationNo2" />
                    <asp:BoundField DataField="IdentificationNo3" HeaderText="IdentificationNo3" SortExpression="IdentificationNo3" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="odsChild" runat="server" SelectMethod="GetDuplications" TypeName="GIIS.DataLayer.Child">
                <SelectParameters>
                    <asp:Parameter Name="birthdateFlag" Type="Boolean" />
                    <asp:Parameter Name="firstnameFlag" Type="Boolean" />
                    <asp:Parameter Name="genderFlag" Type="Boolean" />
                    <asp:Parameter Name="healthFacilityId" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
    <br />
     <div class="row">
        <div class="col-md-10 col-xs-10 col-sm-10 col-lg-10 clearfix">
        </div>
        <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1 clearfix">
            <asp:Button ID="btnExcel" runat="server" Text="Excel" Visible="false" CssClass="btn btn-success btn-raised" OnClick="btnExcel_Click" />
        </div>
        <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1 clearfix"></div>
    </div>

</asp:Content>

