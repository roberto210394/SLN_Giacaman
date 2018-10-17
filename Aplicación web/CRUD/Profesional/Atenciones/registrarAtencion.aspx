<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="registrarAtencion.aspx.cs" Inherits="CRUD.Atenciones.registrarAtencion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css" />
    <script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 501px;
        }

        .auto-style2 {
            margin-top: 0px;
        }

        .auto-style3 {
            margin-left: 80px;
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
        <h1>Ingresar Atención</h1>
    </div>
    <div class="contenedor_tablas">
        <table <table style="width: 50%; height: 50%; margin: 50px auto; text-align: center" class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblFecha" runat="server" Text="Fecha: "></asp:Label>
                    <asp:Label ID="lblFechaHoy" runat="server" Text=""></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label2" runat="server" Text="Nombre Atención"></asp:Label><br />
                    <asp:TextBox ID="txtNombreAtencion" runat="server" Width="422px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label1" runat="server" Text="Descripción"></asp:Label><br />
                    <asp:TextBox ID="txtDescAtencion" runat="server" Height="217px" Width="418px"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:Label ID="Label3" runat="server" Text="Medicamentos:"></asp:Label><br />
                    <asp:TextBox ID="txtMedicamentos" runat="server" Height="217px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="Button1" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" Text="Registrar" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
