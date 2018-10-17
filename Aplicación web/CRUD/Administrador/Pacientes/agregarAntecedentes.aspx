<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="agregarAntecedentes.aspx.cs" Inherits="CRUD.Pacientes.agregarAntecedentes" %>

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
        <h1>Ingresar Antecedentes</h1>
    </div>
    <div class="contenedor_tablas">
        <table style="width: 50%; height: 50%; margin: 50px auto; text-align: center" class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Patológicos"></asp:Label><br />
                    <asp:TextBox ID="txtPato" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Quirúrgicos"></asp:Label><br />
                    <asp:TextBox ID="txtQuiru" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Alérgicos"></asp:Label><br />
                    <asp:TextBox ID="txtAler" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Ginecológicos"></asp:Label><br />
                    <asp:TextBox ID="txtGine" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Psiquiátricos"></asp:Label><br />
                    <asp:TextBox ID="txtPsiqui" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Familiares"></asp:Label><br />
                    <asp:TextBox ID="txtFami" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnGuardar" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" Text="Finalizar" OnClick="btnGuardar_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
