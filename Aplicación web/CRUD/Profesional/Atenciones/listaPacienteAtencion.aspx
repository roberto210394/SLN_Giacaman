<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="listaPacienteAtencion.aspx.cs" Inherits="CRUD.Atenciones.crearAtencion" %>

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
    <body>
        <div class="contenedor_titulo">
            <h1>Pacientes</h1>
        </div>
        <div class="contenedor-texfield">
            <table style="width: 50%; height: 50%; margin: 50px auto; text-align: center" class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
                <tr>
                    <td>
                        <asp:GridView ID="gvPac" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="RUT" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="gvPac_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField SelectText="Registrar atención" ShowSelectButton="True" />
                                <asp:BoundField DataField="RUT" HeaderText="RUT" ReadOnly="True" SortExpression="RUT" />
                                <asp:BoundField DataField="Apellido Paterno" HeaderText="Apellido Paterno" SortExpression="Apellido Paterno" />
                                <asp:BoundField DataField="Apellido Materno" HeaderText="Apellido Materno" SortExpression="Apellido Materno" />
                                <asp:BoundField DataField="Primer Nombre" HeaderText="Primer Nombre" SortExpression="Primer Nombre" />
                                <asp:BoundField DataField="Segundo Nombre" HeaderText="Segundo Nombre" SortExpression="Segundo Nombre" />
                                <asp:BoundField DataField="Edad" HeaderText="Edad" SortExpression="Edad" />
                                <asp:BoundField DataField="Habitación" HeaderText="Habitación" SortExpression="Habitación" />
                                <asp:CheckBoxField DataField="Discapacitado?" HeaderText="Discapacitado?" SortExpression="Discapacitado?" />
                                <asp:BoundField DataField="Porcentaje discapacidad" HeaderText="% discapacidad" SortExpression="% discapacidad" />
                                <asp:BoundField DataField="Previsión" HeaderText="Previsión" SortExpression="Previsión" />
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
                    </td>
                </tr>
            </table>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_GiacamanConnectionString %>" SelectCommand="SELECT Paciente.rut AS RUT, Paciente.pa_apellido AS [Apellido Paterno], Paciente.ma_apellido AS [Apellido Materno], Paciente.p_nombre AS [Primer Nombre], Paciente.s_nombre AS [Segundo Nombre], Paciente.edad AS Edad, Paciente.habitacion AS Habitación, Paciente.discapacitado AS [Discapacitado?], Paciente.porcentaje AS [Porcentaje discapacidad], Tipo_prevision.descripcion AS Previsión FROM Paciente INNER JOIN Tipo_prevision ON Paciente.fk_prevision = Tipo_prevision.id ORDER BY [Apellido Paterno]"></asp:SqlDataSource>
    </body>
</asp:Content>
