<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Techo_form.Account.register" %>

<asp:Content runat="server" ContentPlaceHolderID="Head">
    <link rel="stylesheet" type="text/css" href='<%# ResolveUrl("~/Content/SignInRegister.css") %>' />
    <script type="text/javascript" src='<%# ResolveUrl("~/Content/SignInRegister.js") %>'></script>
    <link rel="stylesheet" type="text/css" href="../Content/Content.css" />
    <link rel="stylesheet" type="text/css" href="../Content/Layout.css" />
    <style>
        .formgroupmargin{
            margin-top: 10px;
        }
        
    </style>
</asp:Content>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    
    <div class="row">
        <div class="col-4">
            &nbsp;
        </div>
        <div class="col-4">
            <div class="container py-4 bg-light shadow marginTop">
                <div class="container g-4">
                    <div class="formLayout-verticalAlign">
                        <div class="formLayout-container">
                            <div class="row">
                                <div class="col text-center">
                                    <h3>Registrar voluntario como usuario TECHO</h3>
                                    <hr />
                                </div>
                            </div>
                            <div class="form-group formgroupmargin">
                                <label for="Voluntario">Voluntario</label>
                                <asp:DropDownList CssClass="form-control" ID="ddl_Voluntarios_People" runat="server" DataSourceID="ds_Voluntarios" DataTextField="Name" DataValueField="Id_User" AutoPostBack="True" OnSelectedIndexChanged="ddl_Voluntarios_People_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="ds_Voluntarios" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT PEOPLE.FirstName + '  ' + PEOPLE.LastName AS Name, PEOPLE.Id_People, USERS.Id_User FROM PEOPLE INNER JOIN USERS ON PEOPLE.Id_User = USERS.Id_User"></asp:SqlDataSource>
                            </div>
                            <div class="form-group formgroupmargin">
                                <label for="exampleInputPerfil">Perfil</label>
                                <asp:DropDownList CssClass="form-control" ID="ddl_Perfiles" runat="server" DataSourceID="ds_Perfiles" DataTextField="Profile_Name" DataValueField="Id_profile"></asp:DropDownList>
                                <%--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                                <asp:SqlDataSource runat="server" ID="ds_Perfiles" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT * FROM [PROFILES]"></asp:SqlDataSource>
                            </div>
                            <asp:Button ID="btn_Register" CssClass="btn btn-primary formgroupmargin" runat="server" Text="Actualizar perfil de usuario" OnClick="btn_Register_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-4">
            &nbsp;
        </div>
    </div>
        
    
    

</asp:Content>
