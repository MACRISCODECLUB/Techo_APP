<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Volunteer_details.aspx.cs" Inherits="Techo_form.Volunteer_details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
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
                    <asp:Label ID="Label1" runat="server" Text="Fecha de Nacimiento"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="tb_DOB" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Número de identidad"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="tb_RNP" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label8" runat="server" Text="País"></asp:Label>
                    <asp:DropDownList CssClass="form-control" ID="DDL_Country" runat="server" DataSourceID="ds_Country" DataTextField="Country_Name" DataValueField="Id_Country" AutoPostBack="True">
                        <asp:ListItem Selected="True" Value="-1">SELECCIONE UNO</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="ds_Country" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT * FROM [COUNTRIES] ORDER BY [Country_Name]"></asp:SqlDataSource>
                </div>
                <div class="col-md-4">
                    <asp:Label ID="Label3" runat="server" Text="Número de celular"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="tb_Cellphone" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="Correo Electrónico"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="tb_Email" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="Estado"></asp:Label>
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
                        <asp:Label ID="Label6" runat="server" Text="Género"></asp:Label>
                        <asp:RadioButtonList CssClass="form-check-input" ID="rbl_Gender" runat="server" RepeatDirection="Horizontal" Width="100%" DataSourceID="ds_gender" DataTextField="Gender" DataValueField="Id_Gender" CellSpacing="0" CellPadding="8"></asp:RadioButtonList><br />
                        <asp:SqlDataSource runat="server" ID="ds_gender" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT * FROM [GENDER]"></asp:SqlDataSource>
                    </div>
                    <div style="margin-top: -4px">
                        <asp:Label ID="Label7" runat="server" Text="Ciudad"></asp:Label>
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
                <asp:Button ID="lbl_mensaje" runat="server" Text="" Visible="false" />
            </div>
            <div class="col-md-12">
                <center>
                    <asp:Button CssClass="btn btn-primary" ID="bt_Update" runat="server" Text="Actualizar" OnClick="bt_Update_Click" />
                </center>

            </div>
        </div>
    </div>
</asp:Content>
