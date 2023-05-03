<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Techo_form.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="product.css" rel="stylesheet" />

    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container" style="margin-top: 100px">
        <br />
        <br />
        <br />
        <div class="row">
            <div class="col-4">
            </div>
            <div class="col-4">
                <div class="container py-4 bg-light shadow marginTop">
                    <div class="container">
                        <div class="row g-2">
                            <div class="col-12"></div>
                            <div class="col-12 text-center">
                                <asp:Label ID="lbl_Username" runat="server" Text="Correo Electronico"></asp:Label>
                                <asp:TextBox CssClass="form-control" ID="tb_Username" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-3"></div>
                        </div>
                        <div class="row g-2">
                            <div class="col-12"></div>
                            <div class="col-12 text-center">
                                <asp:Label ID="lbl_Password" runat="server" Text="Contraseña"></asp:Label>
                                <asp:TextBox CssClass="form-control" ID="tb_Password" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="col-4"></div>
                        </div>
                        <br />
                        <div class="row g-2">
                            <div class="col-12"></div>
                            <div class="col-12 text-center">
                                <asp:Button ID="bt_login" runat="server" Text="Ingresar" Width="90px" CssClass="btn btn-success" OnClick="bt_login_Click" />
                                <br />
                                <br />
                            </div>
                            <div class="col-4"></div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-4">
            </div>
        </div>


    </div>

        


    

</asp:Content>

