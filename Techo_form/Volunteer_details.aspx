<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Volunteer_details.aspx.cs" Inherits="Techo_form.Volunteer_details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <br />
    <br />
    <br />
    <br />
    <br />
    <ajaxToolkit:TabContainer runat="server" Width=100% ActiveTabIndex="1" ID="TC_Details">
        <ajaxToolkit:TabPanel runat="server" HeaderText="Informacion General" ID="TP_General"> 
            <ContentTemplate>
                <div class="container py-4 bg-light shadow marginTop">
        <div class="container g-4">
            <div class="row">
                <div class="col-md-6">
                    <asp:Label ID="lbl_First_Name" runat="server" Text="Primer Nombre"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="tb_First_Name" runat="server"></asp:TextBox><br />
                </div>
                <div class="col-md-6">
                    <asp:Label ID="lbl_Last_Name" runat="server" Text="Apellido"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="tb_Last_Name" runat="server"></asp:TextBox><br />
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lbl_DOB" runat="server" Text="Fecha de Nacimiento"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="tb_DOB" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="lbl_RNP" runat="server" Text="Número de identidad"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="tb_RNP" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="lbl_Country" runat="server" Text="País"></asp:Label>
                    <asp:DropDownList CssClass="form-control" ID="DDL_Country" runat="server" DataSourceID="ds_Country" DataTextField="Country_Name" DataValueField="Id_Country" AutoPostBack="True">
                        <asp:ListItem Selected="True" Value="-1">SELECCIONE UNO</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="ds_Country" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT * FROM [COUNTRIES] ORDER BY [Country_Name]"></asp:SqlDataSource>
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lbl_Cellphone" runat="server" Text="Número de celular"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="tb_Cellphone" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="lbl_Email" runat="server" Text="Correo Electrónico"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="tb_Email" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="lbl_State" runat="server" Text="Departamento"></asp:Label>
                    <asp:DropDownList CssClass="form-control" ID="DDL_State" runat="server" DataSourceID="ds_States" DataTextField="State_Name" DataValueField="Id_State" AutoPostBack="True">
                        <asp:ListItem Selected="True" Value="-1">SELECCIONE UNO</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="ds_States" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT Id_State, State_Name, Id_Country FROM STATES WHERE (Id_Country = @idc) ORDER BY State_Name">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDL_Country" Name="idc" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="col-md-4">
                    <div style="margin-top: -6px">
                        <asp:Label ID="lbl_gender" runat="server" Text="Género"></asp:Label>
                        <asp:RadioButtonList CssClass="form-check-input" ID="rbl_Gender" runat="server" RepeatDirection="Horizontal" Width="100%" DataSourceID="ds_gender" DataTextField="Gender" DataValueField="Id_Gender" CellSpacing="0" CellPadding="8"></asp:RadioButtonList><br />
                        <asp:SqlDataSource runat="server" ID="ds_gender" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT * FROM [GENDER]"></asp:SqlDataSource>
                    </div>
                    <div style="margin-top: -4px">
                        <asp:Label ID="lbl_City" runat="server" Text="Municipio"></asp:Label>
                        <asp:DropDownList CssClass="form-control" ID="DDL_City" runat="server" DataSourceID="ds_Cities" DataTextField="City_Name" DataValueField="Id_City">
                            <asp:ListItem Selected="True" Value="-1">SELECCIONE UNO</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="ds_Cities" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT Id_City, City_Name, Id_State FROM CITIES WHERE (Id_State = @ids) ORDER BY City_Name">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDL_State" Name="ids" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
            <br />
            <br />
            <div class="col-md-12">
                <asp:Label ID="lbl_error" runat="server" Text="" Visible="false"></asp:Label>
            </div>
            <div class="col-md-12">
                <center>
                    <asp:Button CssClass="btn btn-primary" ID="bt_Update" runat="server" Text="Actualizar Información General" OnClick="bt_Update_Informacion_General_Click" />
                </center>
            </div>
        </div>
    </div>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>

        <ajaxToolkit:TabPanel runat="server" HeaderText="Ficha Medica" ID="TP_Medica">
            <ContentTemplate>

                <div class="container py-4 bg-light shadow marginTop">
        <div class="container g-4">
                <div class="row">
                    <div class="col-md-6">
                        <asp:Label ID="lbl_Nom_Cobertura_Med" runat="server" Text="Nombre de Cobertura Medica"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="tb_Nom_Cobertura_Med" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lbl_Num_Cobertura_Med" runat="server" Text="Numero de Cobertura Medica"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="tb_Num_Cobertura_Med" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lbl_Nom_Contacto_ER" runat="server" Text="Nombre de Contacto de Emergencia"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="tb_Nom_Contacto_ER" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lbl_Tel_Contacto_ER" runat="server" Text="Telefono de Contacto de Emergencia"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="tb_Tel_Contacto_ER" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lbl_Rel_Contacto_ER" runat="server" Text="Relacion de Contacto de Emergencia"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="tb_Rel_Contacto_ER" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lbl_Blood_Type" runat="server" Text="Tipo de Sangre"></asp:Label>
                        <asp:DropDownList CssClass="form-control" ID="DDL_Blood_Type" runat="server" DataSourceID="SqlDataSource1" DataTextField="Blood_Type" DataValueField="Id_Blood_Type" AppendDataBoundItems="True">
                            <asp:ListItem Selected="True" Value="-1">SELECCIONE UNO</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT [Blood_Type], [Id_Blood_Type] FROM [Blood Type]"></asp:SqlDataSource>
                    </div>
                    <br />
                    <br />
                    <div class="col-md-12">
                        <asp:Label ID="lbl_error_ficha" runat="server" Text="Label" Visible="false"></asp:Label>
                    </div>
                    <br />
                    <br />
                    <div class="col-md-12">
                        <center>
                            <asp:Button CssClass="btn btn-primary" ID="bt_Update_ficha" runat="server" Text="Actualizar Ficha Medica" OnClick="bt_Update_Ficha_Medica_Click" />
                        </center>
                    </div>
                </div>
        </div>
     </div>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel runat="server" HeaderText="Mis Actividades" ID="TP_Actividades">
            <ContentTemplate>
                <div class="row">
                    <div class="col-md-12">
                        <asp:Label CssClass="form-control" ID="lbl_Todo" runat="server" Text="Actividades Pendientes" ></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="co-md-12">
                        <asp:GridView CssClass="PanelActivCS table table-condensed table-hover" ID="GV_Actividades_todo" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                            <Columns>
                                <asp:BoundField DataField="Activ_Name" HeaderText="Actividad" SortExpression="Activ_Name"></asp:BoundField>
                                <asp:BoundField DataField="Work_Hours" HeaderText="Horas" SortExpression="Work_Hours"></asp:BoundField>
                                <asp:CheckBoxField DataField="Status" HeaderText="Estado" SortExpression="Status"></asp:CheckBoxField>
                                <asp:BoundField DataField="Starts" HeaderText="Comienza" SortExpression="Starts"></asp:BoundField>
                                <asp:BoundField DataField="Ends" HeaderText="Termina" SortExpression="Ends"></asp:BoundField>
                                <asp:BoundField DataField="Cost" HeaderText="Costo" SortExpression="Cost"></asp:BoundField>
                                <asp:BoundField DataField="Name" HeaderText="Nombre de Coordinador" SortExpression="FirstName"></asp:BoundField>
                                <asp:BoundField DataField="City_Name" HeaderText="Municipio" SortExpression="City_Name"></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT Id_User, Id_Activity, Activ_Name, Id_Coordinator, Work_Hours, Status, CONVERT(varchar(10),Starts,111)AS Starts, CONVERT(varchar(10),Ends,111)AS Ends, adminconfirm, Id_Office, Cost, Name, City_Name, username FROM vw_Volunteer_Activities_Dashboard WHERE (Id_People = @Id_People)
AND Status = 1">
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="idv" Name="Id_People"></asp:QueryStringParameter>

                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                <div class="row gy-4">
                    <div class="col-md-12">
                        <asp:Label CssClass="form-control" ID="lbl_Done" runat="server" Text="Actividades Completas"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:GridView Style="margin-top:20px" CssClass="PanelActivCS table table-condensed table-hover" ID="GV_Actividades_done" runat="server" AutoGenerateColumns="False" DataSourceID="Activities_done">
                            <Columns>
                                <asp:BoundField DataField="Activ_Name" HeaderText="Actividad" SortExpression="Activ_Name"></asp:BoundField>
                                <asp:BoundField DataField="Work_Hours" HeaderText="Horas" SortExpression="Work_Hours"></asp:BoundField>
                                <asp:CheckBoxField DataField="Status" HeaderText="Estado" SortExpression="Status"></asp:CheckBoxField>
                                <asp:BoundField DataField="Starts" HeaderText="Comienza" SortExpression="Starts"></asp:BoundField>
                                <asp:BoundField DataField="Ends" HeaderText="Termina" SortExpression="Ends"></asp:BoundField>
                                <asp:BoundField DataField="Cost" HeaderText="Costo" SortExpression="Cost"></asp:BoundField>
                                <asp:BoundField DataField="Name" HeaderText="Nombre de Coordinador" SortExpression="FirstName"></asp:BoundField>
                                <asp:BoundField DataField="City_Name" HeaderText="Municipio" SortExpression="City_Name"></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource runat="server" ID="Activities_done" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT Id_User, Id_Activity, Activ_Name, Id_Coordinator, Work_Hours, Status, CONVERT (varchar(10), Starts, 111) AS Starts, CONVERT (varchar(10), Ends, 111) AS Ends, adminconfirm, Id_Office, Cost, Name, City_Name, username FROM vw_Volunteer_Activities_Dashboard WHERE (Id_People = @Id_People) AND (Status = 0)">
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="idv" Name="Id_People"></asp:QueryStringParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
                </div>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
    </ajaxToolkit:TabContainer>
    
</asp:Content>
