<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DetalleActividad.aspx.cs" Inherits="Techo_form.DetalleActividad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
     <link href="DetalleActividad.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top: 100px">
        <div class="container py-4 bg-light shadow marginTop">
            <h1>Información de la Actividad</h1>
            <asp:HyperLink ID="hl_VerTodas" runat="server" NavigateUrl="~/DashboardActiv.aspx">Ver todas las actividades</asp:HyperLink>
            <div class="container" style="padding-top: 5%">
                <!--If Activ is used in the ID of a lable, it refers to the parameter, if not it refers to the label for parameter -->
                <div class="row">
                    <div class="col-md-4">
                        <asp:Label ID="lbl_Name" CssClass="tb_Name" runat="server" Text="Nombre de la Actividad"></asp:Label>
                        <asp:Label ID="lbl_ActivName" CssClass="tb_Detail" runat="server" Text="Nada Wey"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <asp:Label ID="lbl_City" CssClass="tb_Name" runat="server" Text="Ciudad"></asp:Label>
                        <asp:Label ID="lbl_ActivCity" CssClass="tb_Detail" runat="server" Text="Nada wey"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <asp:Label ID="lbl_Coordinator" CssClass="tb_Name" runat="server" Text="Coordinador a Cargo"></asp:Label>
                        <asp:Label ID="lbl_CoordinatorActiv" CssClass="tb_Detail" runat="server" Text="Nada wey"></asp:Label>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4">
                        <asp:Label ID="lbl_WorkHours" CssClass="tb_Name" runat="server" Text="Horas de Trabajo"></asp:Label>
                        <asp:Label ID="lbl_WorkHoursActiv" CssClass="tb_Detail" runat="server" Text="Nada wey"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <asp:Label ID="lbl_Visibility" CssClass="tb_Name" runat="server" Text="Visibilidad de la Actividad"></asp:Label>
                        <asp:Label ID="lbl_VisibilityActiv" CssClass="tb_Detail" runat="server" Text="Nada wey"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <asp:Label ID="lbl_Status" CssClass="tb_Name" runat="server" Text="Estatus de la Actividad"></asp:Label>
                        <asp:Label ID="lbl_StatusActiv" CssClass="tb_Detail" runat="server" Text="Nada wey"></asp:Label>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4">
                        <asp:Label ID="lbl_StarDate" CssClass="tb_Name" runat="server" Text="Fecha de Inicio"></asp:Label>
                        <asp:Label ID="lbl_StartDateActiv" CssClass="tb_Detail" runat="server" Text="Nada Wey"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <asp:Label ID="lbl_EndDate" CssClass="tb_Name" runat="server" Text="Fecha de Finalizacion"></asp:Label>
                        <asp:Label ID="lbl_EndDateActiv" CssClass="tb_Detail" runat="server" Text="Nada Wey"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <asp:Label ID="lbl_Capacity" CssClass="tb_Name" runat="server" Text="Cupos"></asp:Label>
                        <asp:Label ID="lbl_CapacityActiv" CssClass="tb_Detail" runat="server" Text="Nada Wey"></asp:Label>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6">
                        <asp:Label ID="lbl_AdminConfirm" CssClass="tb_Name" runat="server" Text="Confirmacion de Administrador"></asp:Label>
                        <asp:Label ID="lbl_AdminConfirmActiv" CssClass="tb_Detail" runat="server" Text="Nada Wey"></asp:Label>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lbl_VacantSlots" CssClass="tb_Name" runat="server" Text="Cupos Disponibles"></asp:Label>
                        <!--TODO Function to count registered volunteer and compute available slots-->
                        <asp:Label ID="lbl_VacantSlotsActiv" CssClass="tb_Detail" runat="server" Text="Nada Wey"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <br />
                        <asp:Label ID="lbl_Description" CssClass="tb_Name" runat="server" Text="Descripción de la Actividad"></asp:Label>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <asp:Label CssClass="tb_Detail" ID="lbl_DescriptionActiv" runat="server" Text="Nada Wey"></asp:Label>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-9">
                        <asp:Label ID="lbl_Cost" CssClass="tb_Name" runat="server" Text="Costo de Inscripcion"></asp:Label>
                        <asp:Label ID="lbl_CostActiv" CssClass="tb_Detail" runat="server" Text="Nada wey"></asp:Label>
                    </div>
                    <div class="col-md-3">
                            <asp:Button ID="btn_Register" runat="server" Text="Registrate en la Actividad" OnClick="btn_Register_Click" />
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-12">
                        <asp:Label ID="lbl_RegisterOutput" runat="server" Text="Nada wey" Visible="False"></asp:Label>
                    </div>
                </div>


            </div>
            <asp:Label ID="lbl_Idactividad" runat="server" Text="Nada wey"></asp:Label>
        </div>
    </div>
</asp:Content>
