<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Volunteer.aspx.cs" Inherits="Techo_form._default" %>
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
            Waza
        </p>
  </div>
      <div class="container">
        <div class="row gy-3">
            <div class="col-md-6">
                <asp:Label ID="lbl_FirstName" runat="server" Text="NOMBRE" Font-Bold="true"></asp:Label> <br />
                <asp:TextBox ID="tb_FirstName" runat="server" placeholder="Juan"></asp:TextBox> <br />
            </div>
            <div class="col-md-6">
                <asp:Label ID="lbl_LastName" runat="server" Text="APELLIDO" Font-Bold="true"></asp:Label> <br />
                <asp:TextBox ID="tb_LastName" runat="server" placeholder="Perez"></asp:TextBox>
            </div>
            <div class="col-md-6">
               <asp:Label ID="lbl_Gender" runat="server" Text="GENERO" Font-Bold="true"></asp:Label>
               <asp:RadioButtonList ID="rbl_Gender" runat="server" RepeatDirection="Horizontal" Width="130px">
                   <asp:ListItem>Fem</asp:ListItem>
                   <asp:ListItem>Masc</asp:ListItem>
                   <asp:ListItem>Otrx</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="col-md-6">
                <asp:Label ID="lbl_DOB" runat="server" Text="FECHA DE NACIMIENTO" Font-Bold="true"></asp:Label> 
                <asp:Label ID="lbl_EjDOB" runat="server" Text="Ej: 21/06/2023" ForeColor="#808080"></asp:Label> <br />
                <asp:TextBox ID="tb_DOB" runat="server" placeholder="dd/mm/yyyy"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <asp:Label ID="lbl_RNP_Number" runat="server" Text="NUMERO DE DOCUMENTO / PASAPORTE" Font-Bold="true"></asp:Label>
                <asp:TextBox ID="tb_RNP_Number" runat="server" placeholder="0801200016916"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <asp:Label ID="lbl_Cellphone" runat="server" Text="TELEFONO" Font-Bold="true"></asp:Label> <br />
                <asp:TextBox ID="tb_Cellphone" runat="server" placeholder="+504 9988-7766"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <asp:Label ID="lbl_Country" runat="server" Text="PAIS ACTUAL" Font-Bold="true"></asp:Label> <br />
                <asp:TextBox ID="TextBox1" runat="server" placeholder="Honduras"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <asp:Label ID="lbl_State" runat="server" Text="ESTADO ACTUAL" Font-Bold="true"></asp:Label> <br />
                <asp:TextBox ID="tb_State" runat="server" placeholder="Francisco Morazan"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <asp:Label ID="lbl_City" runat="server" Text="CIUDAD ACTUAL" Font-Bold="true"></asp:Label> <br />
                <asp:TextBox ID="TextBox2" runat="server" placeholder="Tegucigalpa"></asp:TextBox> 
            </div>
            <div class="row g-1">
            <div class="col-md-6">
                <asp:CheckBox ID="cb_Politica_Privacidad" runat="server" Text="Acepto la Politica de Privacidad" Font-Bold="true" /></div>
            <div class="col-md-16">
                <asp:CheckBox ID="cb_confirmacion" runat="server" Text="Acepto que TECHO se contacte conmigo para notificarme de eventos y campañas" Font-Bold="true" />
            </div>
            <div class="col-md-3">
                <asp:Button ID="bt_volver" runat="server" Text="Volver" />
            </div>
            <div class="col-md-3">
                <asp:Button ID="bt_siguiente" runat="server" Text="Siguiente" />
            </div>
            </div>
        </div>
      </div>
      
</main>


</asp:Content>
