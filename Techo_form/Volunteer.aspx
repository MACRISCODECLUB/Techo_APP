<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Volunteer.aspx.cs" Inherits="Techo_form.Volunteer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="product.css" rel="stylesheet" />

    <style>
      .myMain{
    font-family: Garamond, serif; 
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-4 bg-light shadow marginTop">
        <main class="myMain" id="myMain">
            <div
                class="bg-image p-5 text-center shadow-1-strong rounded mb-5 text-white"
                style="background-image: url('https://i.ibb.co/64fHGcW/IMG-0376.jpg');">
                <div class="col-md-5 p-lg-5 mx-auto my-5"></div>
                <h1 class="mb-3 h2">Techo.org</h1>
                <p>
                    Hello
                </p>
            </div>
            <div class="container">
                <div class="row gy-3">
                    <div class="col-md-6">
                        <asp:Label ID="lbl_FirstName" runat="server" Text="NOMBRE" Font-Bold="true"></asp:Label>
                        <br />
                        <asp:TextBox CssClass="form-control" ID="tb_FirstName" runat="server" placeholder="Juan"></asp:TextBox>
                        <br />
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lbl_LastName" runat="server" Text="APELLIDO" Font-Bold="true"></asp:Label>
                        <br />
                        <asp:TextBox CssClass="form-control" ID="tb_LastName" runat="server" placeholder="Perez"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lbl_Gender" runat="server" Text="GENERO" Font-Bold="true"></asp:Label>
                        <asp:RadioButtonList CssClass="form-check-input" ID="rbl_Gender" runat="server" RepeatDirection="Horizontal" Width="100%" DataSourceID="ds_gender" DataTextField="Gender" DataValueField="Id_Gender" CellSpacing="0" CellPadding="8">
                        </asp:RadioButtonList>
                        <asp:SqlDataSource runat="server" ID="ds_gender" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT * FROM [GENDER]"></asp:SqlDataSource>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lbl_DOB" runat="server" Text="FECHA DE NACIMIENTO" Font-Bold="true"></asp:Label>
                        <asp:Label ID="lbl_EjDOB" runat="server" Text="Ej: 2023/06/21" ForeColor="#808080"></asp:Label>
                        <br />
                        <asp:TextBox CssClass="form-control" ID="tb_DOB" runat="server" placeholder="aaaa/mm/dd"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lbl_RNP_Number" runat="server" Text="NUMERO DE DOCUMENTO / PASAPORTE" Font-Bold="true"></asp:Label>
                        <br />
                        <asp:TextBox CssClass="form-control" ID="tb_RNP_Number" runat="server" placeholder="0801200016916"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lbl_Cellphone" runat="server" Text="TELEFONO" Font-Bold="true"></asp:Label>
                        <br />
                        <asp:TextBox CssClass="form-control" ID="tb_Cellphone" runat="server" placeholder="+504 9988-7766"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lbl_Email" runat="server" Text="EMAIL" Font-Bold="true"></asp:Label>
                        <br />
                        <asp:TextBox CssClass="form-control" ID="tb_Email" runat="server" placeholder="techo@gmail.com"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lbl_Country" runat="server" Text="PAIS ACTUAL" Font-Bold="true"></asp:Label>
                        <br />
                        <asp:DropDownList CssClass="form-control" ID="DDL_Country" runat="server" DataSourceID="ds_Country" DataTextField="Country_Name" DataValueField="Id_Country" AppendDataBoundItems="True">
                            <asp:ListItem Selected="True" Value="-1">SELECCIONE UNO</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="ds_Country" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT * FROM [COUNTRIES] ORDER BY [Country_Name]"></asp:SqlDataSource>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lbl_State" runat="server" Text="ESTADO ACTUAL" Font-Bold="true"></asp:Label>
                        <br />
                        <asp:DropDownList CssClass="form-control" ID="DDL_State" runat="server" DataSourceID="ds_States" DataTextField="State_Name" DataValueField="Id_State" AppendDataBoundItems="True">
                            <asp:ListItem Selected="True" Value="-1">SELECCIONE UNO</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="ds_States" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT * FROM [STATES] ORDER BY [State_Name]"></asp:SqlDataSource>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lbl_City" runat="server" Text="CIUDAD ACTUAL" Font-Bold="true"></asp:Label>
                        <br />
                        <asp:DropDownList CssClass="form-control" ID="DDL_City" runat="server" DataSourceID="ds_Cities" DataTextField="City_Name" DataValueField="Id_City" AppendDataBoundItems="True">
                            <asp:ListItem Selected="True" Value="-1">SELECCIONE UNO</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="ds_Cities" ConnectionString='<%$ ConnectionStrings:CODECLUBConnectionString %>' SelectCommand="SELECT * FROM [CITIES] ORDER BY [City_Name]"></asp:SqlDataSource>
                    </div>
                    <div class="row g-1" style="padding-top: 20px">
                        <div class="col-md-6">
                            <asp:CheckBox ID="cb_Politica_Privacidad" runat="server" Text="Acepto la Politica de Privacidad" Font-Bold="true" />
                        </div>
                        <div class="col-md-16">
                            <asp:CheckBox ID="cb_confirmacion" runat="server" Text="Acepto que TECHO se contacte conmigo para notificarme de eventos y campañas" Font-Bold="true" />
                        </div>
                        <div class="col-md-3">
                            <%--<asp:Button ID="bt_volver" runat="server" Text="Volver" />--%>
                        </div>
                        <div class="col-md-3">
                            <asp:Button ID="bt_siguiente" runat="server" CssClass="btn btn-primary"
                                Text="Siguiente" OnClick="bt_siguiente_Click" />
                            <br />
                            <asp:Label ID="lbl_mensaje" runat="server" Text="" Visible="false">

                            </asp:Label>
                        </div>
                    </div>
                </div>
            </div>

        </main>
    </div>

</asp:Content>
