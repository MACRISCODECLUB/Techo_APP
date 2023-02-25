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
                    <div class="dropdwn">
                        <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Seleccionar Categoria
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Actividades de Asentamiento</a></li>
                            <li><a class="dropdown-item" href="#">Actividades de Oficina y Formacion</a></li>
                            <li><a class="dropdown-item" href="#">Eventos Especiales</a></li>
                            <li><a class="dropdown-item" href="#">Virtual</a></li>
                        </ul>
                    </div>
                </div>
            

                <div class="dropdown_type col-md-6">
                    <asp:Label ID="lbl_typeactiv" runat="server" Text="Tipo"></asp:Label>
                    <!--Dropwdown selecct Type-->
                    <asp:DropDownList CssClass="dropdown-toggle" ID="ddl_ActivityType"
                        runat="server" DataSourceID="ds_TypeActivities" DataTextField="Type_name" DataValueField="Id_Type" AppendDataBoundItems="True">
                        <asp:ListItem Selected="True" Value="-1">Seleccione Tipo</asp:ListItem>
                    </asp:DropDownList>

                    <asp:SqlDataSource runat="server" ID="ds_TypeActivities" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT * FROM [TYPE] ORDER BY [Type_name]"></asp:SqlDataSource>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="dropdown_type col-md-6">
                    <asp:Label ID="lbl_countryactiv" runat="server" Text="País"></asp:Label>
                    <!--Dropwdown select Country-->
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Seleccionar País
                        </button>

                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#" data-source-id="id_country">Pais</a></li>
                        </ul>
                    </div>
                </div>

                <div class="dropdown_type col-md-6">
                    <asp:Label ID="lbl_stateactiv" runat="server" Text="Departamento"></asp:Label>
                    <!--Dropwdown select Country-->
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Seleccionar Departamento
                        </button>

                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#" data-source-id="id_State">Departamento</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="dropdown_type col-md-6">
                    <asp:Label ID="lbl_officeactiv" runat="server" Text="Oficina"></asp:Label>
                    <!--Dropwdown select Office-->
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Seleccionar Oficina
                        </button>

                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Oficina Tegucigalpa</a></li>
                            <li><a class="dropdown-item" href="#">Oficina San Pedro Sula</a></li>
                        </ul>
                    </div>
                </div>

                <div class="dropdown_type col-md-6">
                    <asp:Label ID="lbl_statusactiv" runat="server" Text="Estado"></asp:Label>
                    <!--Dropwdown select Status-->
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Seleccionar Oficina
                        </button>

                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Abierta</a></li>
                            <li><a class="dropdown-item" href="#">Cerrada</a></li>
                        </ul>
                    </div>
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
