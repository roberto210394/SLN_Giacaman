<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="crearPaciente.aspx.cs" Inherits="CRUD.crearPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css" />
    <script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <style type="text/css">
        .contenedor_tablas {
            margin: auto;
            text-align: center;
        }
        .contenedor_titulo {
            margin:20px auto;
            text-align: center;
        }

        .auto-style1 {
            width: 111px;
        }

        .auto-style2 {
            height: 41px;
        }

        .auto-style3 {
            width: 111px;
            height: 41px;
        }

        .auto-style4 {
            height: 26px;
        }

        .auto-style5 {
            height: 192px;
        }

        .auto-style6 {
            width: 111px;
            height: 192px;
        }

        .auto-style7 {
            height: 23px;
        }

        body {
            background-color: #E1F5FE;
        }
        .auto-style8 {
            left: 105px;
            top: 176px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div class="contenedor_titulo" >
            <h1 >Ingresar Pacientes</h1>
        </div>
        <div class="contenedor_tablas">
        <table style="width: 50%; height: 50%; margin:50px auto; text-align:center" class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label1" runat="server" Text="R.U.T.:"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtRut" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="Label6" runat="server" Text="Sexo"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:RadioButton ID="rbMale" runat="server" Text="M" AutoPostBack="True" OnCheckedChanged="rbMale_CheckedChanged" />
                    <asp:RadioButton ID="rbFemale" runat="server" Text="F" AutoPostBack="True" OnCheckedChanged="rbFemale_CheckedChanged" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label2" runat="server" Text="Primer Nombre"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtPNombre" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="Label7" runat="server" Text="Ocupación:"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtOcupacion" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Segundo Nombre"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtSNombre" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="Label8" runat="server" Text="Discapacitado:"></asp:Label>
                </td>
                <td>
                    <asp:CheckBox ID="cbDiscapacitado" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Text="Apellido Paterno"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtPaApellido" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="Label9" runat="server" Text="Porcentaje:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPorcentaje" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label5" runat="server" Text="Apellido Materno"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtMaApellido" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:Label ID="Label10" runat="server" Text="Telefono:"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtTelefono" ErrorMessage="*Debe ingresar un numero" MaximumValue="999999999" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label13" runat="server" Text="Comuna:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddComuna" runat="server" DataSourceID="SqlDataSource1" DataTextField="descripcion" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_GiacamanConnectionString %>" SelectCommand="SELECT [id], [descripcion] FROM [Comuna] ORDER BY [descripcion]"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:Label ID="Label14" runat="server" Text="Estado Civil: "></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddEstadoCivil" runat="server" DataSourceID="SqlDataSource3" DataTextField="descripcion" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DB_GiacamanConnectionString %>" SelectCommand="SELECT * FROM [Estado_civil]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label15" runat="server" Text="Previsión: "></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddPrevision" runat="server" DataSourceID="SqlDataSource2" DataTextField="descripcion" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB_GiacamanConnectionString %>" SelectCommand="SELECT * FROM [Tipo_prevision]"></asp:SqlDataSource>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>Fecha Nacimiento: </td>
                <td>
                    <asp:Calendar ID="dpNacimiento" runat="server"></asp:Calendar>
                </td>
                <td class="auto-style1">Edad:<br />
                </td>
                <td>
                    <asp:TextBox ID="txtEdad" runat="server" Width="85px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Fecha Ingreso:</td>
                <td class="auto-style5">
                    <asp:Calendar ID="dpIngreso" runat="server"></asp:Calendar>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="Label11" runat="server" Text="Habitación:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtHabitacion" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label12" runat="server" Text="Causal Ingreso:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCausalIngreso" runat="server" Height="124px" Width="220px"></asp:TextBox>
                </td>
                <td class="auto-style1">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <hr />
        <table style="width: 50%; height: 50%;  margin: 20px auto; text-align:center"" class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
            <tr>
                <td>
                    <asp:Label ID="Label16" runat="server" Text="Tiene tutor?"></asp:Label>
                </td>
                <td>
                    <asp:CheckBox ID="cbTutor" runat="server" AutoPostBack="True" OnCheckedChanged="cbTutor_CheckedChanged" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <hr />
        <table style="width: 50%; height: 50%; margin: 20px auto; text-align:center"" class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
            <tr>
                <td>
                    <asp:Label ID="Label17" runat="server" Text="Primer Nombre:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPNombreTutor" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label18" runat="server" Text="R.U.T.:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtRutTutor" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label19" runat="server" Text="Segundo Nombre:"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtSNombreTutor" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label22" runat="server" Text="Parentesco:"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtParentesco" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label20" runat="server" Text="Apellido Paterno"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPaApellidoTutor" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label23" runat="server" Text="Teléfono:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTelefonoTutor" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label21" runat="server" Text="Apellido Materno"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtMaApellidoTutor" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label24" runat="server" Text="Dirección:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <asp:Button ID="btnGuardar" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" Text="Siguiente" OnClick="btnGuardar_Click" />

                </td>
            </tr>
        </table>
    </div>
</asp:Content>
