<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Activities.aspx.cs" Inherits="Techo_form.actividades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="product.css" rel="stylesheet" />
    <link href="activstyle.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="mainActiv" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="row">
            <div id="cont_logo">
        <div class="container position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center">
            <div class="row">
                <div class="col-lg-12" id="logo_cont">
                    <img src="https://actividades.techo.org/img/logo_large.png" alt="XD" />         
                </div>
            </div>
        </div>
            </div>
        </div>
<div style="margin:3%;">
    <h1>Actividades</h1>
    <div class="row">
        <div class="col-md-12">
            <!--Activity Name-->
            <div class="form-group">
                <asp:Label ID="lbl_Nameactiv" runat="server" Text="Nombre"></asp:Label>
                <input class="form-control input-group-sm" type="text" value="" id="tb_nameactiv" />
            </div>    

        </div>
    </div>
            <div class="row">
                <div class="dropdown col-md-6">
                    <asp:Label ID="lbl_categoryactiv" runat="server" Text="Categoria"></asp:Label>
                    <!--Dropdown select Category-->
                    <asp:DropDownList CssClass="form-control dp_big" ID="ddl_CategoryActiv" runat="server" DataSourceID="ds_CategoryActiv" DataTextField="Category" DataValueField="Id_Category" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddl_CategoryActiv_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="-1">Seleccione una Categoria</asp:ListItem>
                    </asp:DropDownList>


                    <asp:SqlDataSource runat="server" ID="ds_CategoryActiv" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT [Id_Category], [Category] FROM [CATEGORY]"></asp:SqlDataSource>
                </div>
            

                <div class="dropdown_type col-md-6">
                    <asp:Label ID="lbl_typeactiv" runat="server" Text="Tipo"></asp:Label>
                    <!--Dropwdown selecct Type-->
                    <asp:DropDownList CssClass="form-control dp_big" ID="ddl_ActivityType"
                        runat="server" DataSourceID="ds_TypeActivities" DataTextField="Type_name" DataValueField="Id_Type" AppendDataBoundItems="True" AutoPostBack="True">
                        <asp:ListItem Selected="True" Value="-1">Escoja una Categoria</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="ds_TypeActivities" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT [Id_Type], [Type_name] FROM [TYPE] WHERE ([Id_Category] = @Id_Category)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddl_CategoryActiv" PropertyName="SelectedValue" DefaultValue="" Name="Id_Category" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="dropdown_type col-md-6">
                    <asp:Label ID="lbl_countryactiv" runat="server" Text="País"></asp:Label>
                    <!--Dropwdown select Country-->
                    <asp:DropDownList CssClass="form-control dp_1" ID="ddl_CountryActiv" runat="server" DataSourceID="ds_CountryActiv" DataTextField="Country_Name" DataValueField="Id_Country" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddl_CountryActiv_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="-1">Seleccione Pais</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="ds_CountryActiv" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT [Id_Country], [Country_Name] FROM [COUNTRIES]"></asp:SqlDataSource>
                </div>

                <div class="dropdown_type col-md-6">
                    <asp:Label ID="lbl_stateactiv" runat="server" Text="Departamento"></asp:Label>
                    <!--Dropwdown select Country-->
                    <asp:DropDownList ID="ddl_StateActiv" CssClass="form-control dp_big" runat="server" DataSourceID="ds_StateActiv" DataTextField="State_Name" DataValueField="Id_State" AppendDataBoundItems="True" AutoPostBack="True">
                        <asp:ListItem Selected="True">Seleccione Departamento</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="ds_StateActiv" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT [State_Name], [Id_State] FROM [STATES] WHERE ([Id_Country] = @Id_Country)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddl_CountryActiv" PropertyName="SelectedValue" Name="Id_Country" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="dropdown_type col-md-6">
                    <asp:Label ID="lbl_officeactiv" runat="server" Text="Oficina"></asp:Label>
                    <!--Dropwdown select Office-->
                    <asp:DropDownList CssClass="form-control dp_big" ID="ddl_officeactiv" runat="server" DataSourceID="ds_OfficeActiv" DataTextField="Office" DataValueField="Id_Office"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="ds_OfficeActiv" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT [Office], [Id_Office] FROM [OFFICE]"></asp:SqlDataSource>
                </div>

                <div class="dropdown_type col-md-6">
                    <asp:Label ID="lbl_statusactiv" runat="server" Text="Estado"></asp:Label>
                    <!--Dropwdown select Status-->
                    <asp:DropDownList ID="ddl_status" runat="server" DataSourceID="dsStatusActiv" DataTextField="Status" DataValueField="Id_Status" AppendDataBoundItems="True">
                        <asp:ListItem>Escorger Estatus</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="dsStatusActiv" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT [Id_Status], [Status] FROM [STATUS]"></asp:SqlDataSource>
                </div>
            </div>
            <br />
    <div class="row">
        <div class="col-md-6">
            <!--Visibility-->
            <asp:Label ID="lbl_visibilityactiv" runat="server" Text="Visibilidad"></asp:Label>
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Visibilidad
                </button>

                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">Pública</a></li>
                    <li><a class="dropdown-item" href="#">Cerrada</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-6">
            <asp:Label ID="lbl_adminconfirmation" runat="server" Text="Confirmacion  Administrativa"></asp:Label>
            <div class="dropdown">
                 <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Confirmacion de Admin
                </button>

                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">Activada</a></li>
                    <li><a class="dropdown-item" href="#">Desactivada</a></li>
                </ul>
            </div>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-6">
                   <asp:Label ID="lbl_startdate" runat="server" Text="Fecha de Inicio"></asp:Label>
                    <br />
                   <asp:TextBox ID="tb_startdate" runat="server"></asp:TextBox>
                   <ajaxToolkit:CalendarExtender ID="AJAX_calend_startdate" runat="server"
                     BehaviorID="textbox1_CalendarExtender" Format="MMMM d, yyyy" TargetControlID="tb_startdate" />
                </div>
                <div class="col-md-6">
                    <asp:Label ID="lbl_endate" runat="server" Text="Fecha de Finalizacion"></asp:Label>
                    <br />
                    <asp:TextBox ID="tb_enddate" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="Ajax_calend_enddate" runat="server"
                    BehaviorID="TextBox2_CalendarExtender" Format="MMMM d, yyyy" TargetControlID="tb_enddate" />
                </div>
    </div>
    <br />
    <div class="row">
        <div class="form-group">
            <asp:Label ID="lbl_descripactiv" runat="server" Text="Descipcion"></asp:Label>
            <textarea class="form-control" id="DescriptionActiv" rows="3"></textarea>
        </div>
    </div>
    <div class="row">
        <asp:Label ID="lbl_capacityactiv" runat="server" Text="Cupos"></asp:Label>
        <input type="number" name="capacityactiv" value="" /> 
    </div>

</div>
    </main>
</asp:Content>
