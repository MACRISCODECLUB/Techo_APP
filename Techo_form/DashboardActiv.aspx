﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DashboardActiv.aspx.cs" Inherits="Techo_form.DashboardActiv" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="DashboardActiv.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="padding-top:8%;"> 
    <div class="container">

   
    <div class="row">
        <div class="col-md-10">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
           <h1>Panel de Actividades</h1> 
        </div>
        <div class="col-md-2 align-content-end float-end">
            <img src="https://actividades.techo.org/img/logo_large.png" alt="Techo Logo" />  
        </div>
    </div>
        <br />
    <div class="row">
        <div class="col-md-4">
            <!--TODO FINISH FILTERS AND FILTER BUTTON -->
            <asp:Label ID="lbl_startdate_Filter" runat="server" Text="Inicio de Actividad"></asp:Label>
            <asp:TextBox ID="tb_startdate_Filter" runat="server"></asp:TextBox>
            <ajaxToolkit:CalendarExtender ID="AJAX_calend_startdate_filter" runat="server"
            BehaviorID="textbox1_CalendarExtender" Format="MMMM d, yyyy" TargetControlID="tb_startdate_Filter" />
        </div>
        <div class="col-md-4">
            <asp:Label ID="lbl_Enddate_Filter" runat="server" Text="Fin de Actividad"></asp:Label>
            <asp:TextBox ID="tb_Enddate_Filter" runat="server"></asp:TextBox>
            <ajaxToolkit:CalendarExtender ID="Ajax_calend_enddate_filter" runat="server"
            BehaviorID="textbox1_CalendarExtender" Format="MMMM d, yyyy" TargetControlID="tb_Enddate_Filter" />
        </div>
        <div class="col-md-4">
            <asp:Button ID="btn_Applyfilters" CssClass="btnApplyFilter" runat="server" Text="Aplicar Filtros" />
        </div>
    </div>
   <br />

   <div class="row">
       <div class="col-md-10">
           <!--Expr1 = Start Date -->
           <!--Expr2 = End Date -->
       <asp:GridView ID="PanelActiv" CssClass="PanelActivCS table table-condensed table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="ds_ActivityPanel" DataKeyNames="Id_Activity" OnSelectedIndexChanged="PanelActiv_SelectedIndexChanged">
           <Columns>
               <asp:CommandField ShowSelectButton="True" />
               <asp:BoundField DataField="Activ_Name" HeaderText="Nombre de Actividad" SortExpression="Activ_Name"></asp:BoundField>               
               <asp:BoundField DataField="Expr1" HeaderText="Fecha de Inicio" SortExpression="Expr1" ReadOnly="True"></asp:BoundField>
               <asp:BoundField DataField="Expr2" HeaderText="Fecha de Finalizacion" SortExpression="Expr2" ReadOnly="True"></asp:BoundField>
               <asp:CheckBoxField DataField="Visibility" HeaderText="Visibilidad" SortExpression="Visibility"></asp:CheckBoxField>
               
           </Columns>
       </asp:GridView>
           <br />
           <asp:SqlDataSource runat="server" ID="ds_ActivityPanel" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT Activ_Name, CONVERT (varchar(10), Starts, 111) AS Expr1, CONVERT (varchar(10), Ends, 111) AS Expr2, Visibility, Id_Activity FROM ACTIVITIES"></asp:SqlDataSource>
      </div>
           
    <br />
    
       <div class="row">

       </div>
   </div>
    
</div>
     </div>
</asp:Content>
