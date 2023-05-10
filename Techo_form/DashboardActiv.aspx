<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DashboardActiv.aspx.cs" Inherits="Techo_form.DashboardActiv" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="DashboardActiv.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-top:10%;"> 
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
        <div class="col-md-3">
            <!--TODO FINISH FILTERS AND FILTER BUTTON -->
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
        <div class="col-md-3">
             <asp:Label ID="lbl_visibilityactiv" runat="server" Text="Visibilidad"></asp:Label>
            <asp:DropDownList CssClass="form-control dp_big"  ID="ddl_visibility" runat="server" DataSourceID="ds_visibilityactiv" DataTextField="Visibility" DataValueField="Id_Visibility">
            </asp:DropDownList>
         <asp:SqlDataSource ID="ds_visibilityactiv" runat="server" ConnectionString="<%$ ConnectionStrings:CODECLUBConnectionString %>" SelectCommand="SELECT [Visibility], [id_visibility] FROM [VISIBILITY]"></asp:SqlDataSource>
        </div>
        <div class="col-md-1.5">
            <br />
            <asp:Button ID="btn_Applyfilters" CssClass="btnApplyFilter form-control align-content" runat="server" Text="Aplicar Filtros" Width="175px" OnClick="btn_Applyfilters_Click" />
            <br />
            <asp:DropDownList ID="ddl_Profiles" runat="server" DataSourceID="ds_Profiles" DataTextField="Profile_Name" DataValueField="Id_profile" Visible="False">
            </asp:DropDownList>
            <asp:SqlDataSource ID="ds_Profiles" runat="server" ConnectionString="<%$ ConnectionStrings:CODECLUBConnectionString %>" SelectCommand="SELECT * FROM [PROFILES]"></asp:SqlDataSource>
             <asp:Button ID="btn_RemoveFilter" CssClass="btnApplyFilter form-control align-content" runat="server" Text="Quitar Filtros" Width="125px"/>
        </div>
    </div>
   <br />

   <div class="row">
       <div class="col-md-10">
           <!--Expr1 = Start Date -->
           <!--Expr2 = End Date -->
       <asp:GridView ID="PanelActiv" CssClass="PanelActivCS table table-condensed table-hover" runat="server" 
           AutoGenerateColumns="False" DataSourceID="" DataKeyNames="Id_Activity" OnSelectedIndexChanged="PanelActiv_SelectedIndexChanged">
           <Columns>
               <asp:BoundField DataField="Activ_Name" HeaderText="Nombre de Actividad" SortExpression="Activ_Name"></asp:BoundField>               
               <asp:BoundField DataField="Starts" HeaderText="Fecha de Inicio" SortExpression="Starts" ReadOnly="True"></asp:BoundField>
               <asp:BoundField DataField="Ends" HeaderText="Fecha de Finalizacion" SortExpression="Ends" ReadOnly="True"></asp:BoundField>
               <asp:CheckBoxField DataField="Visibility" HeaderText="Visibilidad" SortExpression="Visibility"></asp:CheckBoxField>
               
               <asp:CommandField ShowSelectButton="True" HeaderText="Detalle de la Actividad" SelectText="Seleccionar" />
               
           </Columns>
       </asp:GridView>
           <br />
           <asp:SqlDataSource runat="server" ID="ds_ActivityPanel" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT Activ_Name, CONVERT (varchar(10), Starts, 111) AS Starts, CONVERT (varchar(10), Ends, 111) AS Ends, Visibility, Id_Activity FROM ACTIVITIES"></asp:SqlDataSource>
      </div>
           
    <br />
   </div>
    
</div>
     </div>
</asp:Content>
