<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Volunteer_dashboard.aspx.cs" Inherits="Techo_form.Scripts.Volunteer_dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <style>
      .myMain{
    font-family: Garamond, serif; 
}
</style>
    <link href="DashboardActiv.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container" style="padding-top:5%">
        <div class="row g-4">
            <div class="col-md-10 ">
                <asp:Label ID="lbl_title_db" runat="server" Text="Panel de Voluntarios" Font-Size="XX-Large"></asp:Label>
            </div>
            <div class="col-md-2">
                <img src="https://i.ibb.co/GP2G194/Logo-PNG-en-negativo-1.png" alt="Techo Logo" />
            </div>
            <div class="col-md-12">
                <asp:Label ID="lbl_leaveblankfilter" runat="server" Text="Dejar en blanco para mostrar todos los Voluntarios"></asp:Label><br />
            </div>
            <div class="col-md-4">
                <asp:Label ID="lbl_filter_volunteer" runat="server" Text="Nombre de Voluntario"></asp:Label>
                <asp:TextBox Cssclass="form-control" ID="tb_filter_volunteer" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <asp:Label ID="lbl_city_filter" runat="server" Text="Municipio"></asp:Label>
                <asp:DropDownList CssClass="form-control" ID="DDL_City" runat="server" DataSourceID="ds_Cities" DataTextField="City_Name" DataValueField="Id_City" AppendDataBoundItems="True">
                    <asp:ListItem Selected="True" Value="-1">SELECCIONE UNO</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource runat="server" ID="ds_Cities" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT * FROM [CITIES] ORDER BY [City_Name]"></asp:SqlDataSource>
            </div>
            <div class="col-md-3">
                <asp:Label ID="lbl_State_filter" runat="server" Text="Departamento"></asp:Label>
                <asp:DropDownList Cssclass="form-control" ID="DDL_State" runat="server" DataSourceID="ds_States" DataTextField="State_Name" DataValueField="Id_State" AppendDataBoundItems="True">
                    <asp:ListItem Selected="True" Value="-1">SELECCIONE UNO</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource runat="server" ID="ds_States" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT * FROM [STATES] ORDER BY [State_Name]"></asp:SqlDataSource>
            </div>
            <div class="col-md-2 g-5">
                <asp:Button CssClass="form-control" ID="bt_apply_filter" runat="server" Text="Aplicar Filtros" OnClick="bt_apply_filter_Click" />
            </div>
        </div>
        <br />

        <div class="row">
            <div class="col-md-12">
                <asp:GridView CssClass="PanelActivCS table table-condensed table-hover" ID="GV_Volunteers" runat="server" AutoGenerateColumns="False" DataKeyNames="Id_People" DataSourceID="ds_voluntarios" OnSelectedIndexChanged="GV_Volunteers_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Nombre de Voluntario" SortExpression="FirstName"></asp:BoundField>
                        <asp:BoundField DataField="City_Name" HeaderText="Municipio" SortExpression="Id_City"></asp:BoundField>
                        <asp:BoundField DataField="State_Name" HeaderText="Departamento" SortExpression="Id_State"></asp:BoundField>
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
                        <asp:BoundField DataField="Cellphone" HeaderText="Telefono" SortExpression="Cellphone"></asp:BoundField>
                        <asp:CommandField SelectText="Ver Detalle" ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource runat="server" ID="ds_voluntarios" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT Id_People, ([FirstName] + ' ' + [LastName]) as Name, [Email], [Cellphone], c.City_Name, s.State_Name FROM [PEOPLE] p inner join CITIES c on c.Id_City=p.Id_City inner join STATES s on s.Id_State=p.Id_State"></asp:SqlDataSource>
            </div>

        </div>
    </div>
</asp:Content>
