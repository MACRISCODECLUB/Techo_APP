<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RegisteredActiv.aspx.cs" Inherits="Techo_form.WebForm1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="DashboardActiv.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main" style="padding-top:5%">
        <div class="row">
            <div class="col-md-10">
                <asp:ScriptManager ID="mainScriptManager" runat="server"></asp:ScriptManager>
                <h1>Registrados en actividades</h1>
            </div>
            <div class="col-md-2 align-content-end float-end">
                 <img src="https://i.ibb.co/GP2G194/Logo-PNG-en-negativo-1.png" alt="Techo Logo" />  
            </div>
        </div>
    <div class="row">
        <div class="col-md-3">
            
            <asp:Label ID="lbl_startdate_Filter" runat="server" Text="Fecha Inicial"></asp:Label>
            <asp:TextBox ID="tb_startdate_Filter" CssClass="form-control" runat="server"></asp:TextBox>
            <ajaxToolkit:CalendarExtender ID="AJAX_calend_startdate_filter" runat="server"
        BehaviorID="textbox1_CalendarExtender" Format="dd/MM/yyyy" TargetControlID="tb_startdate_Filter" />
        </div>
        <div class="col-md-3">
            <asp:Label ID="lbl_Enddate_Filter" runat="server" Text="Fecha Final"></asp:Label>
            <asp:TextBox ID="tb_Enddate_Filter" CssClass="form-control" runat="server"></asp:TextBox>
            <ajaxToolkit:CalendarExtender ID="Ajax_calend_enddate_filter" runat="server"
            BehaviorID="textbox2_CalendarExtender" Format="dd/MM/yyyy" TargetControlID="tb_Enddate_Filter" />
        </div>
        <div class="col-md-1.5">
            <br />
            <asp:Button ID="btn_Applyfilters" CssClass="btnApplyFilter form-control align-content" runat="server" Text="Aplicar Filtros" Width="175px" />
            <br />
            <asp:DropDownList ID="ddl_Profiles" runat="server" DataSourceID="ds_Profiles" DataTextField="Profile_Name" DataValueField="Id_profile" Visible="False">
            </asp:DropDownList>
            <asp:SqlDataSource ID="ds_Profiles" runat="server" ConnectionString="<%$ ConnectionStrings:CODECLUBConnectionString %>" SelectCommand="SELECT * FROM [PROFILES]"></asp:SqlDataSource>
             <asp:Button ID="btn_RemoveFilter" CssClass="btnApplyFilter form-control align-content" runat="server" Text="Quitar Filtros" Width="125px"/>
        </div>
    </div>
   <br />

        <asp:GridView ID="RegistrantsGrid" runat="server"</asp:GridView>
        
    </div>
</asp:Content>
