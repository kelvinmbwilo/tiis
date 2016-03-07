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
<%@ Page Title="Place" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="Birthplace.aspx.cs" Inherits="_Birthplace" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 <!--   <div class="row">
        <div class="col-md-12 col-xs-12 col-sm-12 col-lg-12 clearfix">
            <ol class="breadcrumb">
                <li><a href="Default.aspx">Home</a></li>
                <li><a href="#">Setup</a></li>
                <li class="active">
                    <asp:Label ID="lblTitle" runat="server" Text="Birthplace" /></li>
            </ol>
        </div>
    </div> -->

    <div class="row">
        <div class="card" style="margin-left: 13px !important; margin-right: 30px !important;">
            <div class="card-content">
                <span class="card-title" style="padding-left: 25px">BirthPlace</span>
                <div class="row row-sm">
                    <div class="col m12">
                        <div class="col m4">
                              <asp:Label ID="lblName" runat="server" Text="Name" />
                              <span style="color: Red">*</span>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                        </div>
                        <div class="col m4 offset-m2">
                             <asp:Label ID="lblNotes" runat="server" Text="Notes" />
                             <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control" />
                        </div>
                        <div class="col m3 offset m4">
                            <asp:Label ID="lblIsActive" runat="server" Text="IsActive" />
                             <asp:RadioButtonList ID="rblIsActive" runat="server" RepeatDirection="Horizontal">
                               <asp:ListItem Selected="True" Value="True" Text="Yes&nbsp;&nbsp;&nbsp;"></asp:ListItem>
                               <asp:ListItem Value="False" Text="No"></asp:ListItem>
                             </asp:RadioButtonList>
                        </div>
                        <div class="col m4 offset-m8">
                              <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary btn-raised" OnClick="btnAdd_Click"
                              ValidationGroup="saveBirthplace" />
                              <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-primary btn-raised" OnClick="btnEdit_Click"
                              ValidationGroup="saveBirthplace" />
                             <asp:Button ID="btnRemove" runat="server" Text="Remove" CssClass="btn btn-raised btn-warning" OnClick="btnRemove_Click" />
                        </div>


                           <div class="row">
                       <div class="col-md-4 col-xs-4 col-sm-4 col-lg-4 clearfix">&nbsp;</div>
                       <div class="col-md-8 col-xs-8 col-sm-8 col-lg-8 clearfix">
                      <asp:CustomValidator ID="cvBirthplace" runat="server" ErrorMessage=" All fields marked with * must be filled!"
                ClientValidationFunction="cvBirthplace_Validate" CssClass="label label-warning" Font-Size="Small" ForeColor="White" Display="Dynamic"
                ValidationGroup="saveBirthplace"></asp:CustomValidator>
            <asp:RegularExpressionValidator ID="revName" runat="server" ErrorMessage=" Name should be at least 2 characters and not contain numbers."
                ControlToValidate="txtName" Display="Dynamic" CssClass="label label-danger" Font-Size="Small" ForeColor="White" ValidationGroup="saveBirthplace"
                ValidationExpression="^[^0-9_\|°¬!#\$%/\()\?¡¿+{}[\]:.\,;@ª^\*<>=&-]{2,50}$" />
        </div>
    </div>

                        <div class="col m3 offset-s3">
                             <asp:Label ID="lblSuccess" runat="server" Text="Success" CssClass="label label-success" Font-Size="Small" Visible="false" />
            <asp:Label ID="lblWarning" runat="server" Text="Warning" CssClass="label label-warning" Font-Size="Small" Visible="false" />
            <asp:Label ID="lblError" runat="server" Text="Error" CssClass="label label-danger" Font-Size="Small" Visible="false" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <br />
    <!-- This is for pagination for BirthPlace information  -->
     <div class="row">
        <div class="card" style="margin-left: 13px !important; margin-right: 30px !important;">
            <div class="card-content">
                <div class="card-title">
                    <span style="padding-left: 25px">BirthPlace List</span>
                </div> 
                <div class="table-responsive">
                      <asp:GridView ID="gvBirthplace" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover table-responsive"
                AllowPaging="True" OnPageIndexChanging="gvBirthplace_PageIndexChanging" DataSourceID="odsBirthplace">
                <PagerSettings Position="Top" Mode="NumericFirstLast" />
                <PagerStyle CssClass="pagination" HorizontalAlign="Left" VerticalAlign="Top" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="False" />
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlName" runat="server" NavigateUrl='<%# Eval("Id", "Birthplace.aspx?id={0}") %>'
                                Text='<%# Eval("Name", "{0}") %>' ToolTip='<%# Eval("Notes", "{0}") %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                    <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" SortExpression="IsActive" />
                    <asp:BoundField DataField="ModifiedOn" HeaderText="ModifiedOn" SortExpression="ModifiedOn" Visible="False" />
                    <asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" SortExpression="ModifiedBy" Visible="False" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="odsBirthplace" runat="server" SelectMethod="GetBirthplaceList" TypeName="GIIS.DataLayer.Birthplace">
              <%--  <SelectParameters>
                    <asp:Parameter Name="i" Type="Int32" />
                </SelectParameters>--%>
            </asp:ObjectDataSource>
                </div>
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
        function cvBirthplace_Validate(sender, args) {
            var text = (document.getElementById('<%=txtName.ClientID%>').value == '');
            if (text) {
                args.IsValid = false;
                return;
            }
            args.IsValid = true;
        }

    </script>
</asp:Content>

