<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Techo_form.Account.register" %>

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
                                    <h3>Crear usuario</h3>
                                    <hr />
                                </div>
                            </div>
                            <div class="form-group formgroupmargin">
                                <label for="exampleInputPerfil">Perfil</label>
                                <asp:DropDownList CssClass="form-control" ID="ddl_Perfiles" runat="server"></asp:DropDownList>
                                <%--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                            </div>
                            <div class="form-group formgroupmargin">
                                <label for="Email">Correo electrónico</label>
                                <asp:TextBox CssClass="form-control" ID="tb_Email" runat="server"></asp:TextBox>
                                <%--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                            </div>
                            <div class="form-group formgroupmargin">
                                <label for="nombre">Nombre</label>
                                <asp:TextBox CssClass="form-control" ID="tb_Nombre" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group formgroupmargin">
                                <label for="apellido">Apellido</label>
                                <asp:TextBox CssClass="form-control" ID="tb_Apellido" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group formgroupmargin">
                                <label for="exampleInputPassword1">Contraseña</label>
                                <asp:TextBox CssClass="form-control" ID="tb_Password" TextMode="Password" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group formgroupmargin">
                                <label for="comnfPassword">Confirmar Contraseña</label>
                                <asp:TextBox CssClass="form-control" ID="tb_ConfPassword" TextMode="Password" runat="server"></asp:TextBox>
                            </div>

                            <asp:Button ID="btn_Register" CssClass="btn btn-primary" runat="server" Text="Crear Usuario" />
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
