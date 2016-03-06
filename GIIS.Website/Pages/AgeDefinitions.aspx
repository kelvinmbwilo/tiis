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
<%@ Page Title="Age Definitions" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="AgeDefinitions.aspx.cs" Inherits="_AgeDefinitions" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 <!--   <div class="row">
        <div class="col-md-12 col-xs-12 col-sm-12 col-lg-12 clearfix">
            <ol class="breadcrumb">
                <li><a href="Default.aspx">Home</a></li>
               <li><a href="#">Vaccination Schedule</a></li>
                <li class="active">
                    <asp:Label ID="lblTitle" runat="server" Text="AgeDefinitions" /></li>
            </ol>
        </div>
    </div>  -->

    <!-- Here is the Age Definition Card -->

    <div>
       <div class="row">
           <div class="card" style="margin-left: 30px !important; margin-right: 30px !important">
              <div class="card-content">
                 <span class="card-title">Age Definition</span>
                  <div class="row row-sm">
                      <div class="col m12">
                          <div class="col m3">
                               <asp:Label ID="lblName" runat="server" Text="Name" />
                                 <span style="color: Red">*</span>
                               <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                          </div>
                          <div class="col m3 offset-s3">
                              <asp:Label ID="lblDays" runat="server" Text="Days" />
                                <span style="color: Red">*</span>
                               <asp:TextBox ID="txtDays" runat="server" CssClass="form-control" />
                          </div>
                                  <div class="col-md-5 col-xs-5 col-sm-5 col-lg-5 clearfix">
                   <%--            <asp:RequiredFieldValidator ID="rfvDays" runat="server" ErrorMessage="Days must be filled!" ControlToValidate="txtDays" ValidationGroup="saveAgeDefinitions" Display="Dynamic" CssClass="label label-warning" Font-Size ="Small" ForeColor="White" />--%>
                                   <asp:RegularExpressionValidator ID="revDays" runat="server"
                                    ErrorMessage=" Days should be only numbers!"
                                    ControlToValidate="txtDays" Display="Dynamic" 
                                    ValidationExpression="^[0-9]+$" CssClass="label label-danger" Font-Size ="Small" ForeColor="White" />
                                 </div>
                          <div class="col m3 offset-s3">
                               <asp:Label ID="lblNotes" runat="server" Text="Notes" />
                               <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control" />
                          </div>
                          <div class="col m3 offset-s3">
                              <asp:Label ID="Label1" runat="server" Text="IsActive" />
                              <asp:RadioButtonList ID="rblIsActive" runat="server" RepeatDirection="Horizontal">
                                  <asp:ListItem Selected="True" Value="True" Text="Yes&nbsp;&nbsp;&nbsp;"></asp:ListItem>
                                  <asp:ListItem Value="False" Text="No"></asp:ListItem>
                              </asp:RadioButtonList>
                          </div>
                          <div class="row col offset s12">
                               <asp:CustomValidator ID="cvAgeDefinition" runat="server" ErrorMessage="All fields marked with * must be filled!" ClientValidationFunction="cvAgeDefinition_Validate" Display="Dynamic" ValidationGroup="saveAgeDefinitions" CssClass="label label-warning" Font-Size="Small" ForeColor="White" ></asp:CustomValidator>
                              <asp:Button ID="btnAdd" runat="server" Text="Save" CssClass="btn btn-primary btn-raised" OnClick="btnAdd_Click" ValidationGroup="saveAgeDefinitions" />
                              <asp:Button ID="btnEdit" runat="server" Text="Save" CssClass="btn btn-primary btn-raised" OnClick="btnEdit_Click" ValidationGroup="saveAgeDefinitions" />
                              <asp:Button ID="btnRemove" runat="server" Text="Remove" CssClass="btn btn-raised btn-warning" OnClick="btnRemove_Click" />
                          </div>

                          <div class="col m3 offset-s3 clearfix">
                          <asp:Label ID="lblSuccess" runat="server" Text="Success" CssClass="label label-success" Font-Size="Small"  Visible="false" />
                         <asp:Label ID="lblWarning" runat="server" CssClass="label label-warning" Font-Size="Small" Text="Warning" Visible="false" />
                         <asp:Label ID="lblError" runat="server" CssClass="label label-error" Font-Size="Small" Text="Error" Visible="false" />
                         </div>
                      </div>
                  </div>
              </div>
           </div>
       </div>
    </div>
  <!--  <div class="row">
        <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1 clearfix"></div>
        <div class="col-md-2 col-xs-2 col-sm-2 col-lg-2 clearfix">
           
           
        </div>
        <div class="col-md-3 col-xs-3 col-sm-3 col-lg-3 clearfix">
            <div class="form-group">
                
            </div>
        </div>
        <div class="col-md-5 col-xs-5 col-sm-5 col-lg-5 clearfix">
<%--            <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name must be filled!" ControlToValidate="txtName" ValidationGroup="saveAgeDefinitions" Display="Dynamic" CssClass="label label-warning" Font-Size ="Small" ForeColor="White"/>--%>
        </div>
    </div>
    <div class="row">
        <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1 clearfix"></div>
        <div class="col-md-2 col-xs-2 col-sm-2 col-lg-2 clearfix">
            
           
        </div>
        <div class="col-md-3 col-xs-3 col-sm-3 col-lg-3 clearfix">
            <div class="form-group">
               
            </div>
        </div>

    </div>
  <!--  <div class="row">
        <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1 clearfix"></div>
        <div class="col-md-2 col-xs-2 col-sm-2 col-lg-2 clearfix">
            
        </div>
        <div class="col-md-3 col-xs-3 col-sm-3 col-lg-3 clearfix">
            <div class="form-group">
                
            </div>
        </div>
        <div class="col-md-5 col-xs-5 col-sm-5 col-lg-5 clearfix">
        </div>
    </div>
    <div class="row">
        <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1 clearfix"></div>
        <div class="col-md-2 col-xs-2 col-sm-2 col-lg-2 clearfix">
          <!--  <asp:Label ID="lblIsActive" runat="server" Text="IsActive" /> -->
     <!--   </div>
        <div class="col-md-3 col-xs-3 col-sm-3 col-lg-3 clearfix">
            <div class="form-group">
                
            </div>
        </div>
        <div class="col-md-5 col-xs-5 col-sm-5 col-lg-5 clearfix">
        </div>
    </div>
    <div class="row">
        <div class="col-md-3 col-xs-3 col-sm-3 col-lg-3 clearfix"></div>
        <div class="col-md-7 col-xs-7 col-sm-7 col-lg-7 clearfix">
           
        </div>
    </div>
  
    <div class="row">
        <div class="col-md-3 col-xs-3 col-sm-3 col-lg-3 clearfix">&nbsp;</div>
        <div class="col-md-2 col-xs-2 col-sm-2 col-lg-2 clearfix">
            
        </div>
        <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1 clearfix">&nbsp;</div>
        <div class="col-md-2 col-xs-2 col-sm-2 col-lg-2 clearfix">
            
        </div>
        <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1 clearfix">&nbsp;</div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-3 col-xs-3 col-sm-3 col-lg-3 clearfix"></div>
        
    </div> -->
    <br />

             <!-- Place to enter grid information for AgeDefinition -->

    <div class="card" style="margin-left: 30px !important; margin-right: 30px !important;">
        <div class="card-content">
            <span class="card-title">Scheduled Vaccination </span>
            <div class="table-responsive">
                 <asp:GridView ID="gvAgeDefinitions" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover table-responsive" AllowPaging="True" DataSourceID="odsAgeDefinitions" OnPageIndexChanging="gvAgeDefinitions_PageIndexChanging">
                <PagerSettings Position="Top" Mode="NumericFirstLast"  />
                <PagerStyle CssClass="pagination" HorizontalAlign="Left" VerticalAlign="Top" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="False" />
                    <%--<asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />--%>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlName" runat="server" NavigateUrl='<%# Eval("Id", "AgeDefinitions.aspx?id={0}") %>'
                                Text='<%# Eval("Name", "{0}") %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Days" HeaderText="Days" SortExpression="Days" />
                    <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                    <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" SortExpression="IsActive" />
                    
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="odsAgeDefinitions" runat="server" EnablePaging="true" SelectMethod="GetPagedAgeDefinitionsList" TypeName="GIIS.DataLayer.AgeDefinitions" SelectCountMethod="GetCountAgeDefinitionsList">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1 = 1" Name="where" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 col-xs-12 col-sm-12 col-lg-12 clearfix">
           
        </div>
        </div> 
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
      <script type="text/javaScript">
          function cvAgeDefinition_Validate(sender, args) {
              var text = (document.getElementById('<%=txtName.ClientID%>').value == '') || (document.getElementById('<%=txtDays.ClientID%>').value == '');
            if (text) {
                args.IsValid = false;
                return;
            }
            args.IsValid = true;
        }
    </script>
</asp:Content>

