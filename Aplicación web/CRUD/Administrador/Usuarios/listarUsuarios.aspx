<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="listarUsuarios.aspx.cs" Inherits="CRUD.Usuarios.listarUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css" />
    <script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <style>
        .contenedor-texfield {
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
        <h1>Lista usuarios</h1>
    </div>
    <div class="contenedor-texfield">
        <table style="width: 50%; height: 50%; margin: 50px auto; text-align: center" class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
            <tr>
                <td>
                    <asp:GridView ID="gvUsuarios" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="RUT" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="gvUsuarios_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField SelectText="Editar" ShowSelectButton="True" />
                            <asp:BoundField DataField="Rol" HeaderText="Rol" SortExpression="Rol" />
                            <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" SortExpression="Especialidad" />
                            <asp:BoundField DataField="Primer Nombre" HeaderText="Primer Nombre" SortExpression="Primer Nombre" />
                            <asp:BoundField DataField="Segundo Nombre" HeaderText="Segundo Nombre" SortExpression="Segundo Nombre" />
                            <asp:BoundField DataField="Apellido Paterno" HeaderText="Apellido Paterno" SortExpression="Apellido Paterno" />
                            <asp:BoundField DataField="Apellido Materno" HeaderText="Apellido Materno" SortExpression="Apellido Materno" />
                            <asp:BoundField DataField="RUT" HeaderText="RUT" ReadOnly="True" SortExpression="RUT" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_GiacamanConnectionString %>" SelectCommand="SELECT Rol.descripcion AS Rol, Especialidad.descripcion AS Especialidad, Usuario.p_nombre AS [Primer Nombre], Usuario.s_nombre AS [Segundo Nombre], Usuario.pa_apellido AS [Apellido Paterno], Usuario.ma_apellido AS [Apellido Materno], Usuario.rut AS RUT FROM Usuario INNER JOIN Especialidad ON Usuario.fk_especialidad_id = Especialidad.id INNER JOIN Rol ON Usuario.fk_rol_id = Rol.id ORDER BY Rol"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
