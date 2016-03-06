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
<%@ Page Title="Configuration" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="Configuration.aspx.cs" Inherits="_Configuration" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <!-- <div class="row">
        <div class="col-md-12 col-xs-12 col-sm-12 col-lg-12 clearfix">
            <ol class="breadcrumb">
                <li><a href="Default.aspx">Home</a></li>
                <li><a href="#">Configuration</a></li>
                <li class="active">
                    <asp:Label ID="lblTitle" runat="server" Text="Configuration" /></li>
            </ol>
        </div>
    </div> -->

    <!-- This is Configuration Div Card -->

    <div class="row">
       <div class="card" style="margin-left: 13px !important; margin-right: 30px !important;">
           <div class="card-content">
             <span class="card-title" style="padding-left:25px">Configuration</span>
               <div class="row row-sm">
                  <div class="col m12">
                      <div class="col m3">
                          <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label>
                          <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control" DataSourceID="odsCountry" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
                <asp:ObjectDataSource ID="odsCountry" runat="server" SelectMethod="GetCountryList" TypeName="GIIS.DataLayer.Country"></asp:ObjectDataSource>
                      </div>
                      <div class="col m3 offset-s3">
                          <asp:Label ID="lblLanguage" runat="server" Text="Language"></asp:Label>
                           <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="form-control" DataSourceID="odsLanguage" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
                          <asp:ObjectDataSource ID="odsLanguage" runat="server" SelectMethod="GetLanguageList" TypeName="GIIS.DataLayer.Language"></asp:ObjectDataSource>
                      </div>
                      <div class="col m3 offset-s3">
                           <asp:Label ID="lblDateFormat" runat="server" Text="Date Format"></asp:Label>
                           <asp:DropDownList ID="ddlDateFormat" runat="server" CssClass="form-control" DataSourceID="odsDateFormat" DataTextField="DateFormat" DataValueField="Id"></asp:DropDownList>
                         <asp:ObjectDataSource ID="odsDateFormat" runat="server" SelectMethod="GetConfigurationDateList" TypeName="GIIS.DataLayer.ConfigurationDate"></asp:ObjectDataSource>
                      </div>
                      <div class="col m3 offset-s3">
                          <asp:Label ID="lblCurrency" runat="server" Text="Currency"></asp:Label>
                          <asp:TextBox ID="txtCurrency" runat="server" CssClass="form-control"></asp:TextBox>
                      </div>
                      <div class="col m3 offset-s3">
                         <asp:Label ID="lblSupplyChain" runat="server" Text="Supply Chain Levels"></asp:Label>
                          <asp:TextBox ID="txtSupplyChain" runat="server" CssClass="form-control"></asp:TextBox>
                      </div>
                      <div class="col m3 offset-s3">
                          <asp:Label ID="lblWarningDays" runat="server" Text="Default Warning Days"></asp:Label>
                          <asp:TextBox ID="txtWarningDays" runat="server" CssClass="form-control"></asp:TextBox>
                      </div>
                      <div class="col m3 offset-s3">
                          <asp:Label ID="lblHomePageText" runat="server" Text="Home Page Text"></asp:Label>
                          <asp:TextBox ID="txtHomePageText" runat="server" CssClass="form-control"></asp:TextBox>
                      </div>
                      <div class="col m3 offset-s3">
                         <asp:Label ID="lblLink" runat="server" Text="Link Immunization And Stock"></asp:Label>
                          <asp:RadioButtonList ID="rblLink" runat="server" RepeatDirection="Horizontal">
                           <asp:ListItem Selected="True" Value="True" Text="Yes&nbsp;&nbsp;&nbsp;"></asp:ListItem>
                           <asp:ListItem Value="False" Text="No"></asp:ListItem>
                        </asp:RadioButtonList>
                      </div>
                      <div class="col m3 offset-s3">
                         <asp:Label ID="lblDefaulters" runat="server" Text="Consider defaulter after (days)"></asp:Label>
                          <asp:TextBox ID="txtDefaulters" runat="server" CssClass="form-control"></asp:TextBox>
                      </div>
                      <div class="col m3 offset-s3">
                          <asp:Label ID="lblEligible" runat="server" Text="Make Child Eligible for Vaccination, before due date (days)"></asp:Label>
                           <asp:TextBox ID="txtEligible" runat="server" CssClass="form-control"></asp:TextBox>
                      </div>
                      <div class="col m3 offset-s3">
                           <asp:RegularExpressionValidator ID="revCurrency" runat="server"
                ErrorMessage=" Currency should be 3 characters long and should not contain numbers!"
                ControlToValidate="txtCurrency" Display="Dynamic" CssClass="label label-warning" Font-Size="Small" ForeColor="White"
                ValidationExpression="^[a-zA-Z]{3}$" />
            <asp:RegularExpressionValidator ID="revWarningDays" runat="server"
                ErrorMessage=" Warning Days should be only numbers!"
                ControlToValidate="txtWarningDays" Display="Dynamic" CssClass="label label-warning" Font-Size="Small" ForeColor="White"
                ValidationExpression="^[0-9]+$" />
            <asp:RegularExpressionValidator ID="revSupplyChainLevels" runat="server"
                ErrorMessage=" Supply Chain levels should be only numbers!"
                ControlToValidate="txtSupplyChain" Display="Dynamic" CssClass="label label-warning" Font-Size="Small" ForeColor="White"
                ValidationExpression="^[0-9]+$" />

                      </div>
                      <div class="col m3 offset-s5">
                            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-raised btn-primary" OnClick="btnSave_Click" ValidationGroup="saveConfiguration" />
                            <asp:Label ID="lblSuccess" runat="server" Text="Success" CssClass="label label-success" Font-Size="Small" Visible="false" />
                            <asp:Label ID="lblWarning" runat="server" Text="Warning" CssClass="label label-warning" Font-Size="Small" Visible="false" />
                            <asp:Label ID="lblError" runat="server" Text="Error" CssClass="label label-danger" Font-Size="Small" Visible="false" />
                      </div>
                  </div>
               </div>
           </div>
       </div>
    </div>
   
     <div class="row">
       
        <div class="col-md-3 col-xs-3 col-sm-3 col-lg-3 clearfix">
            
        </div>
        <div class="col-md-3 col-xs-3 col-sm-3 col-lg-3 clearfix">
            <div class="form-group">
               
            </div>
        </div>
            <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1 clearfix"></div>
        <div class="col-md-2 col-xs-2 col-sm-2 col-lg-2 clearfix">
        </div>
        <div class="col-md-3 col-xs-3 col-sm-3 col-lg-3 clearfix">
            <div class="form-group">
                
            </div>
        </div>
         </div> 
    <div class="row">
        <div class="col-md-4 col-xs-4 col-sm-4 col-lg-4 clearfix">
        </div>
        <div class="col-md-8 col-xs-8 col-sm-8 col-lg-8 clearfix">
                   </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-6 col-xs-6 col-sm-6 col-lg-6 clearfix">
        </div>
        <div class="col-md-2 col-xs-2 col-sm-2 col-lg-2 clearfix">
           
        </div>
    </div>
    <br />
  <div class="row">
        <div class="col-md-3 col-xs-3 col-sm-3 col-lg-3 clearfix"></div>
        <div class="col-md-5 col-xs-5 col-sm-5 col-lg-5 clearfix">
           
        </div>
    </div>

    <br />

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

