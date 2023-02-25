<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Techo_form.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="product.css" rel="stylesheet" />

    <style>
      .myMain{
    font-family: Garamond, serif; 
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <main class="myMain" id="myMain">  
    <div 
         class="bg-image p-5 text-center shadow-1-strong rounded mb-5 text-white"
  style="background-image: url('https://mdbcdn.b-cdn.net/img/new/slides/003.webp');">
    <div class="col-md-5 p-lg-5 mx-auto my-5"></div>
        <h1 class="mb-3 h2">Techo.org</h1>
        <p>
            Yo
        </p>
  </div>
    <div class="container">
        <div class="row">
            <div class="col-4"></div>
            <div class="col-4 text-center">
                <asp:Label ID="lbl_Username" runat="server" Text="Mail"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="tb_Username" runat="server"></asp:TextBox>
            </div>
            <div class="col-4"></div>
        </div>
        <div class="row">
            <div class="col-4"></div>
            <div class="col-4 text-center">
                <asp:Label ID="lbl_Password" runat="server" Text="Contraseña"></asp:Label>
                <asp:TextBox CssClass="form-control" ID="tb_Password" runat="server"></asp:TextBox>
            </div>
            <div class="col-4"></div>
        </div>
    </div>



</asp:Content>

