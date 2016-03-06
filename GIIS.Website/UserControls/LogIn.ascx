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
<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LogIn.ascx.cs" Inherits="UserControls_LogIn" %>
<asp:Panel ID="pnlLogin" runat="server">
   <div class="log-in">
        <div class="row">&nbsp;</div>
        <div class="row">
            <div class="col-md-12 col-xs-12 col-sm-12 col-lg-12 clearfix">
                <div class="form-group">
                    <div class="input-group">
                        &nbsp;&nbsp;
                        <span class="input-group-addon">
                            <i class="material-icons">perm_identity</i>

                        </span>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Username" />
                    </div>
                </div>
            </div>
        </div> 
        <%--<div class="row">
    <div class="col-md-2 col-xs-2 col-sm-2 col-lg-2 clearfix">
    </div>
    <div class="col-md-10 col-xs-10 col-sm-10 col-lg-10 clearfix">
        <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername"
            Display="Dynamic" ValidationGroup="login" ErrorMessage="Username is required!" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
</div>--%>

        <div class="row">
                    <div class="col-m1 col-s1 col-s-1 col-l1 clearfix">
                    </div>
                    <div class="col-m12 col-s12 col-s12 col-l12 clearfix">
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="material-icons">&nbsp;lock</i>
                                </span>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password" />
                            </div>
                        </div>
                    </div>
            <div class="col-m1 col-s1 col-s1 col-l1 clearfix">
            </div>
        </div>
        <%--<div class="row">
    <div class="col-md-2 col-xs-2 col-sm-2 col-lg-2 clearfix">
    </div>
    <div class="col-md-10 col-xs-10 col-sm-10 col-lg-10 clearfix">
        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
            Display="Dynamic" ValidationGroup="login" ErrorMessage="Password is required!" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
</div>--%>
        <div class="row">
            <div class="col m1 x1 s1 l1 clearfix">
                &nbsp;&nbsp;</div>
            <div class="form-group col s12">
             <asp:Label ID="lblLanguages" runat="server" Text=" Select Language"></asp:Label>
                <br />
                <div class="select-dropdown" >

                    <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="select-dropdown" DataSourceID="odsLanguages" DataTextField="Name" DataValueField="Id" OnSelectedIndexChanged="ddlLanguages_SelectedIndexChanged"></asp:DropDownList>
                    <asp:ObjectDataSource ID="odsLanguages" runat="server" SelectMethod="GetLanguageList" TypeName="GIIS.DataLayer.Language"></asp:ObjectDataSource>
                </div>
            </div>
            <div class="col m1 x1 m1 l1 clearfix">
            </div>

        </div>
        <div class="row">
               <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1 clearfix">
            </div>
            <div class="col m12 x12 s12 l12 clearfix">
                <asp:Button ID="btnLogIn" runat="server" Text="Log In" CssClass="btn btn-block btn-sm btn-primary" ValidationGroup="login" OnClick="LoginButton_Click" />
            </div>
         
            <div class="col-md-6 col-xs-6 col-sm-6 col-lg-6 clearfix">
               <%-- <asp:Button ID="btnForgotPassword" runat="server" Text="Forgot Password" CssClass="btn btn-block btn-sm btn-info" OnClick="btnForgotPassword_Click" />--%>

            </div>
               <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1 clearfix">
            </div>
        </div>

        <div class="row">
            <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1 clearfix">
            </div>
            <div class="col-md-11 col-xs-11 col-sm-11 col-lg-11 clearfix">
                <asp:Label ID="lblWrongPassword" ForeColor="red" runat="server" Visible="false" Text="Username or Password is incorrect!"></asp:Label>

            </div>
        </div>
    </div> 


           <!-- Materialize css Login Page Inaanza hapa! 
        <div id="login-page" class="row">
            <div class="col s12 z-depth-6 card-panel">
                <form class="login-form">
                    <div class="row ">
                        <div class="input-field col s12 center">
                            <p class="center login-form-text">Wizara ya Afya na Ustawi wa Jamii</p>
                        </div>
                    </div>
                    <div class="row margin">
                        <div class="input-field col s12">
                            <i class="mdi-social-person-outline prefix"></i>
                        </div>
                    </div>
                </form>
            </div>
        </div> -->
</asp:Panel>
