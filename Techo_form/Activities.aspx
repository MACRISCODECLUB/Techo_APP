<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Activities.aspx.cs" Inherits="Techo_form.actividades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="product.css" rel="stylesheet" />
    <link href="activstyle.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="mainActiv" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container py-4 bg-light shadow marginTop">
        <%--marginTop--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="row">
            <div id="cont_logo">
                <!-- Dont remove this text-center p-3 p-md-5 neither m-md-3, you will break it -->
                <div class="container position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center">
                    <div class="row">
                        <div class="col-2" style="background-color:#367fa9">  
                            <asp:Button ID="btn_Back" runat="server" Text="Regresar" CssClass="btn btn-default" ForeColor="White" OnClick="btn_Back_Click" />
                        </div>
                        <div class="col-lg-10" id="logo_cont">
                            <img src="https://i.ibb.co/GP2G194/Logo-PNG-en-negativo-1.png" alt="Techo Logo" />
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <%--style="margin: 3%;"--%>
            <h2>Actividades</h2>
            <div class="row">
                <div class="col-md-12">
                    <!--Activity Name-->
                    <div class="form-group">
                        <asp:Label ID="lbl_Nameactiv" runat="server" Text="Nombre"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="tb_nameactiv" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="dropdown col-md-6">
                    <asp:Label ID="lbl_categoryactiv" runat="server" Text="Categoria"></asp:Label>
                    <!--Dropdown select Category-->
                    <asp:DropDownList Width="100%" CssClass="form-control dp_big" ID="ddl_CategoryActiv" runat="server" DataSourceID="ds_CategoryActiv" DataTextField="Category" DataValueField="Id_Category" AutoPostBack="True" OnSelectedIndexChanged="ddl_CategoryActiv_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="ds_CategoryActiv" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT [Id_Category], [Category] FROM [CATEGORIES]"></asp:SqlDataSource>
                </div>
                <div class="dropdown_type col-md-6">
                    <asp:Label ID="lbl_typeactiv" runat="server" Text="Tipo"></asp:Label>
                    <!--Dropwdown selecct Type-->
                    <asp:DropDownList Width="100%" CssClass="form-control dp_big" ID="ddl_ActivityType"
                        runat="server" DataSourceID="ds_TypeActivities" DataTextField="Type_name" DataValueField="Id_Type" AutoPostBack="True">
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
                <div class="dropdown_type col-md-4">
                    <asp:Label ID="lbl_countryactiv" runat="server" Text="País"></asp:Label>
                    <!--Dropwdown select Country-->
                    <asp:DropDownList Width="100%" CssClass="form-control dp_big" ID="ddl_CountryActiv" runat="server" DataSourceID="ds_CountryActiv" DataTextField="Country_Name" DataValueField="Id_Country" AutoPostBack="True" OnSelectedIndexChanged="ddl_CountryActiv_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="-1">Seleccione Pais</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="ds_CountryActiv" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT [Id_Country], [Country_Name] FROM [COUNTRIES]"></asp:SqlDataSource>
                </div>
                <div class="dropdown_type col-md-4">
                    <asp:Label ID="lbl_stateactiv" runat="server" Text="Departamento"></asp:Label>
                    <!--Dropwdown select Country-->
                    <asp:DropDownList Width="100%" ID="ddl_StateActiv" CssClass="form-control dp_big" runat="server" DataSourceID="ds_StateActiv" DataTextField="State_Name" DataValueField="Id_State" AutoPostBack="True">
                        <asp:ListItem Selected="True">Seleccione Departamento</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="ds_StateActiv" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT [State_Name], [Id_State] FROM [STATES] WHERE ([Id_Country] = @Id_Country)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddl_CountryActiv" PropertyName="SelectedValue" Name="Id_Country" Type="Int32" DefaultValue="1"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lbl_Cityactiv" runat="server" Text="Municipio"></asp:Label>
                    <asp:DropDownList Width="100%" ID="ddl_Cityactiv" CssClass="form-control dp_big" runat="server" DataSourceID="ds_Cityactiv" DataTextField="City_Name" DataValueField="Id_City"></asp:DropDownList>

                    <asp:SqlDataSource runat="server" ID="ds_Cityactiv" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT [City_Name], [Id_State], [Id_City] FROM [CITIES] WHERE ([Id_State] = @Id_State)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddl_StateActiv" Name="Id_State" PropertyName="SelectedValue" Type="Int32" DefaultValue="1" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="dropdown_type col-md-6">
                    <asp:Label ID="lbl_officeactiv" runat="server" Text="Punto de Encuentro"></asp:Label>
                    <!--Dropwdown select Office-->
                    <asp:DropDownList Width="100%" CssClass="form-control dp_big" 
                        ID="ddl_officeactiv" runat="server" DataSourceID="ds_OfficeActiv" 
                        DataTextField="Office" DataValueField="Id_Office"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="ds_OfficeActiv" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT [Office], [Id_Office] FROM [OFFICE]"></asp:SqlDataSource>
                </div>
                <div class="dropdown_type col-md-6">
                    <asp:Label ID="lbl_statusactiv" runat="server" Text="Estado"></asp:Label>
                    <!--Dropwdown select Status-->
                    <asp:DropDownList Width="100%" ID="ddl_status" CssClass="form-control dp_big" runat="server" DataSourceID="ds_statusactiv2" DataTextField="STATUS" DataValueField="id_status">
                        <asp:ListItem Selected="True" Value="-1">Escorger Estado</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="ds_statusactiv2" runat="server" ConnectionString="<%$ ConnectionStrings:CODECLUBConnectionString %>" SelectCommand="SELECT [STATUS], [id_status] FROM [STATUS]"></asp:SqlDataSource>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-6">
                    <!--Visibility-->
                    <asp:Label ID="lbl_visibilityactiv" runat="server" Text="Visibilidad"></asp:Label>
                    <asp:DropDownList Width="100%" CssClass="form-control dp_big" ss="form-control dp_big" ID="ddl_visibility" runat="server" DataSourceID="ds_visibilityactiv" DataTextField="Visibility" DataValueField="Id_Visibility">
                        <asp:ListItem Selected="True" Value="-1">Configurar Visibilidad</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="ds_visibilityactiv" runat="server" ConnectionString="<%$ ConnectionStrings:CODECLUBConnectionString %>" SelectCommand="SELECT [Visibility], [id_visibility] FROM [VISIBILITY]"></asp:SqlDataSource>
                </div>

                <div class="col-md-6">
                    <asp:Label ID="lbl_adminconfirm" runat="server" Text="Confirmacion  Administrativa"></asp:Label>
                    <asp:DropDownList Width="100%" CssClass="form-control dp_big" ID="ddl_adminconfirm" runat="server">
                        <asp:ListItem Selected="True" Value="0"> No</asp:ListItem>
                        <asp:ListItem Value="1">Si</asp:ListItem>
                    </asp:DropDownList>
                </div>

            </div>
            <br />
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lbl_startdate" runat="server" Text="Fecha de Inicio"></asp:Label>
                    <br />
                    <asp:TextBox CssClass="form-control" Width="100%" ID="tb_startdate" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="AJAX_calend_startdate" runat="server"
                        BehaviorID="textbox1_CalendarExtender" Format="MM dd, yyyy" TargetControlID="tb_startdate" />
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lbl_endate" runat="server" Text="Fecha de Finalizacion"></asp:Label>
                    <br />
                    <asp:TextBox CssClass="form-control" Width="100%" ID="tb_enddate" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="Ajax_calend_enddate" runat="server"
                        BehaviorID="TextBox2_CalendarExtender" Format="MM dd, yyyy" TargetControlID="tb_enddate" />
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lbl_Cost" runat="server" Text="Costo de Inscripcion"></asp:Label>
                    <asp:TextBox ID="tb_Cost" Text="0.05" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-12">
                    <div class="form-group">
                        <asp:Label ID="lbl_descripactiv" runat="server" Text="Descipcion"></asp:Label>
                        <asp:TextBox ID="DescriptionActiv" TextMode="MultiLine" Rows="3" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-3">
                    <asp:Label ID="lbl_capacityactiv" runat="server" Text="Cupos"></asp:Label>
                    <br />
                    <asp:TextBox CssClass="form-control" ID="tb_capacityactiv" Style="width: 100%;" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="lbl_Coordinatoractiv" runat="server" Text="Coordinador a Cargo"></asp:Label>
                    <br />
                    <asp:DropDownList Width="100%" ID="ddl_Coordinatoractiv" runat="server" DataSourceID="ds_cordinatoractiv" DataTextField="Name" DataValueField="Id_People" CssClass="form-control dp_big"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="ds_cordinatoractiv" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT Id_People, (FirstName + ' ' + LastName) as Name FROM USERS u INNER JOIN PEOPLE p on p.Id_User = u.Id_User WHERE Id_Profile < 4 ORDER BY FirstName ASC, LastName ASC"></asp:SqlDataSource>
                </div>
                <div class="col-md-3">
                    <asp:Label ID="lbl_Workhours" runat="server" Text="Horas de Trabajo"></asp:Label>
                    <br />
                    <asp:TextBox Width="100%" CssClass="form-control" ID="tb_Workhours" Text="0.00" runat="server"></asp:TextBox>

                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-4">
                    <asp:Button CssClass="btn btn-primary" BackColor="#367fa9" BorderColor="#367fa9" ID="btn_Submit" runat="server" Text="Crear Actividad" OnClick="btn_Submit_Click" />
                                                                                                                                               <!--Add OnClick function --> 
                    <%--<asp:Button CssClass="btn btn-primary" BackColor="#367fa9" BorderColor="#367fa9" ID="btn_UpdateActivity" runat="server" Text="Actualizar actividad" OnClick="btn_Submit_Click" />--%>
                </div>
                <div class="col-md-4">
                    <asp:Label Style="font: bolder 12 px Halvetica; color: black;" ID="lbl_output_Form" runat="server" Text="Output Label" Visible="False"></asp:Label>
                </div>
            </div>
        </div>
        <%--Style="background-color: #367fa9; color: white; padding: 0.5em;" --%>
    </div>
</asp:Content>
