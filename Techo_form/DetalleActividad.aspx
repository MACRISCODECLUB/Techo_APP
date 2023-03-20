<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DetalleActividad.aspx.cs" Inherits="Techo_form.DetalleActividad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    .<div CssClass="container" style="padding-top:10%">
        <!--If Activ is used in the ID of a lable, it refers to the parameter, if not it refers to the label for parameter -->
        <div class="row">
            <div class="col-md-4">
                <asp:Label ID="lbl_Name" CssClass="tb_Name" runat="server" Text="Nombre de la Actividad"></asp:Label>
                <asp:Label ID="lbl_ActivName" CssClass="tb_Detail" runat="server" Text="Nada Wey"></asp:Label>
            </div>
            <div class="col-md-4">
                <asp:Label ID="lbl_City" runat="server" Text="Ciudad"></asp:Label>
                <asp:Label ID="lbl_ActivCity" runat="server" Text="Nada wey"></asp:Label>
            </div>
            <div class="col-md-4">
                <asp:Label ID="lbl_Coordinator" runat="server" Text="Coordinador a Cargo"></asp:Label>
                <asp:Label ID="lbl_CoordinatorActiv" runat="server" Text="Nada wey"></asp:Label>
            </div>
        </div> 
     </div>
    <!--<asp:Label ID="lbl_Idactividad" runat="server" Text="Nada wey"></asp:Label>-->
</asp:Content>
