<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="crearUsuario.aspx.cs" Inherits="CRUD.Usuarios.crearUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css" />
    <script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <style type="text/css">
        .auto-style3 {
            width: 186px;
        }

        .contenedor_tablas {
            margin: auto;
            text-align: center;
        }

        .contenedor_titulo {
            margin: 20px auto;
            text-align: center;
        }

        body {
            background-color: #E1F5FE;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contenedor_titulo">
        <h1>Ingresar Usuario</h1>
    </div>
    <div class="contenedor_tablas">
        <table style="width: 50%; height: 50%; margin: 50px auto; text-align: center" class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="lblRut" runat="server" Text="RUT:"></asp:Label>
                </td>
                <td style="text-align: center">
                    <asp:TextBox ID="txtRut" runat="server" MaxLength="12"></asp:TextBox>
                    <br />
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="El rut no es valido." MaximumValue="9999999999" MinimumValue="1111111111" Font-Bold="True" Text="El rut no es valido." ControlToValidate="txtRut"></asp:RangeValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="El rut no puede estar vacío." ControlToValidate="txtRut" Text="El rut no puede estar vacío." Font-Bold="True"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label2" runat="server" Text="Primer Nombre:"></asp:Label>
                </td>
                <td style="text-align: center">
                    <asp:TextBox ID="txtPNombre" runat="server" MaxLength="12"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="El primer nombre no puede ir vacío." Text="El primer nombre no puede ir vacío." ControlToValidate="txtPNombre" Font-Bold="True"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label3" runat="server" Text="Segundo Nombre:"></asp:Label>
                </td>
                <td style="text-align: center">
                    <asp:TextBox ID="txtSNombre" runat="server" MaxLength="50"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label4" runat="server" Text="Apellido Paterno:"></asp:Label>
                </td>
                <td style="text-align: center">
                    <asp:TextBox ID="txtAPaterno" runat="server" MaxLength="50"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="El apellido paterno no puede ir vacío." Text="El apellido paterno no puede ir vacío." ControlToValidate="txtAPaterno" Font-Bold="True"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label5" runat="server" Text="Apellido Materno:"></asp:Label>
                </td>
                <td style="text-align: center">
                    <asp:TextBox ID="txtAMaterno" runat="server" MaxLength="50"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="El apellido materno no puede estar vacío." Text="El apellido materno no puede estar vacío." ControlToValidate="txtAMaterno" Font-Bold="True"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label6" runat="server" Text="Teléfono:"></asp:Label>
                </td>
                <td style="text-align: center">
                    <asp:TextBox ID="txtTelefono" runat="server" MaxLength="9" TextMode="Phone"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="El telefono no puede ir vacío." Text="El telefono no puede ir vacío." ControlToValidate="txtTelefono" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="El teléfono debe tener 9 digitos y ser valido." MaximumValue="999999999" MinimumValue="111111111" Text="El teléfono no puede tener más de 9 digitos." Font-Bold="True" ControlToValidate="txtTelefono" Visible="True" Display="Dynamic" Type="Integer"></asp:RangeValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label7" runat="server" Text="Dirección:"></asp:Label>
                </td>
                <td style="text-align: center">
                    <asp:TextBox ID="txtDireccion" runat="server" MaxLength="50"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="La dirección no puede estar vacía." ControlToValidate="txtDireccion" Text="La dirección no puede estar vacía." Font-Bold="True"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label8" runat="server" Text="Contraseña:"></asp:Label>
                </td>
                <td style="text-align: center">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="50"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="La contraseña no debe estar vacía." Text="La contraseña no debe estar vacía." ControlToValidate="txtPassword" Font-Bold="True"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label9" runat="server" Text="Confirme contraseña"></asp:Label>
                </td>
                <td style="text-align: center">
                    <asp:TextBox ID="txtPassword2" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label10" runat="server" Text="Rol:"></asp:Label>
                </td>
                <td style="text-align: center">
                    <asp:DropDownList ID="ddlRolUsuario" runat="server" Width="150px" DataTextField="descripcion" DataValueField="id" DataSourceID="SqlDataSource1"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_GiacamanConnectionString %>" SelectCommand="SELECT * FROM [Rol]"></asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label11" runat="server" Text="Especialidad:"></asp:Label>
                </td>
                <td style="text-align: center">
                    <asp:DropDownList ID="ddEspecialidad" runat="server" Width="150px" DataTextField="descripcion" DataValueField="id" DataSourceID="SqlDataSource2"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB_GiacamanConnectionString %>" SelectCommand="SELECT * FROM [Especialidad]"></asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td style="text-align: center">
                    <asp:Button ID="btnAgregar" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" Text="Agregar" OnClick="btnAgregar_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>
