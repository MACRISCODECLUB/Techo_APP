<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DashboardActiv.aspx.cs" Inherits="Techo_form.DashboardActiv" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="DashboardActiv.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="padding-top:8%;">    
    <div class="row">
        <div class="col-md-10">
           <h1>Panel de Actividades</h1> 
        </div>
        <div class="col-md-2 align-content-end float-end">
            <img src="https://actividades.techo.org/img/logo_large.png" alt="Techo Logo" />  
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <!--TODO FINISH FILTERS AND FILTER BUTTON -->
            <asp:TextBox ID="tb_startdate_Filter" runat="server"></asp:TextBox>
           <ajaxToolkit:CalendarExtender ID="startdatePanel" runat="server" />
        </div>
    </div>
    <div class="row">
        <!-- Filter Button-->
    </div>

   <div class="row">
       <div class="col-md-11">
       <asp:GridView ID="PanelActiv" CssClass="PanelActivCS" runat="server" AutoGenerateColumns="False" DataSourceID="ds_ActivityPanel">
           <Columns>
               <asp:BoundField DataField="Activ_Name" HeaderText="Nombre de la Actividad" SortExpression="Activ_Name"></asp:BoundField>
               <asp:BoundField DataField="Starts" HeaderText="Fecha de Inicio" SortExpression="Starts"></asp:BoundField>
               <asp:BoundField DataField="Ends" HeaderText="Fecha de Finalizacion" SortExpression="Ends"></asp:BoundField>
               <asp:CheckBoxField DataField="Status" HeaderText="Estado" SortExpression="Status"></asp:CheckBoxField>
           </Columns>
       </asp:GridView>
       <asp:SqlDataSource runat="server" ID="ds_ActivityPanel" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT [Activ_Name], [Starts], [Ends], [Status] FROM [ACTIVITIES]"></asp:SqlDataSource>
      </div>
           
    <br />
    
       <div class="row">

       </div>
   </div>
    
</div>
</asp:Content>
