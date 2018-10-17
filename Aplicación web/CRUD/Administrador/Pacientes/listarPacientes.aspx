<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="listarPacientes.aspx.cs" Inherits="CRUD.listarPacientes" %>

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
            <h1>Listar Pacientes</h1>
        </div>
        <div class="contenedor-texfield">
            <table style="width: 50%; height: 50%; margin: 50px auto; text-align: center" class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
                <tr>
                    <td>
                        <asp:GridView ID="gvPacientes" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="rut" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField SelectText="Editar" ShowSelectButton="True" />
                                <asp:BoundField DataField="rut" HeaderText="RUT" ReadOnly="True" SortExpression="rut" />
                                <asp:BoundField DataField="p_nombre" HeaderText="Primer Nombre" SortExpression="p_nombre" />
                                <asp:BoundField DataField="s_nombre" HeaderText="Segundo Nombre" SortExpression="s_nombre" />
                                <asp:BoundField DataField="pa_apellido" HeaderText="Apellido Paterno" SortExpression="pa_apellido" />
                                <asp:BoundField DataField="ma_apellido" HeaderText="Apellido Materno" SortExpression="ma_apellido" />
                                <asp:BoundField DataField="habitacion" HeaderText="Habitación" SortExpression="habitacion" />
                                <asp:BoundField DataField="estado" HeaderText="Estado" SortExpression="estado" />
                                <asp:BoundField DataField="fecha_ingreso" HeaderText="Ingreso" SortExpression="fecha_ingreso" />
                                <asp:BoundField DataField="fk_tutor_rut" HeaderText="Tutor" SortExpression="fk_tutor_rut" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_GiacamanConnectionString %>" DeleteCommand="DELETE FROM [Paciente] WHERE [rut] = @rut" InsertCommand="INSERT INTO [Paciente] ([rut], [p_nombre], [s_nombre], [pa_apellido], [ma_apellido], [habitacion], [estado], [fecha_ingreso], [fk_tutor_rut]) VALUES (@rut, @p_nombre, @s_nombre, @pa_apellido, @ma_apellido, @habitacion, @estado, @fecha_ingreso, @fk_tutor_rut)" SelectCommand="SELECT [rut], [p_nombre], [s_nombre], [pa_apellido], [ma_apellido], [habitacion], [estado], [fecha_ingreso], [fk_tutor_rut] FROM [Paciente]" UpdateCommand="UPDATE [Paciente] SET [p_nombre] = @p_nombre, [s_nombre] = @s_nombre, [pa_apellido] = @pa_apellido, [ma_apellido] = @ma_apellido, [habitacion] = @habitacion, [estado] = @estado, [fecha_ingreso] = @fecha_ingreso, [fk_tutor_rut] = @fk_tutor_rut WHERE [rut] = @rut">
            <DeleteParameters>
                <asp:Parameter Name="rut" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="rut" Type="String" />
                <asp:Parameter Name="p_nombre" Type="String" />
                <asp:Parameter Name="s_nombre" Type="String" />
                <asp:Parameter Name="pa_apellido" Type="String" />
                <asp:Parameter Name="ma_apellido" Type="String" />
                <asp:Parameter Name="habitacion" Type="String" />
                <asp:Parameter Name="estado" Type="String" />
                <asp:Parameter DbType="Date" Name="fecha_ingreso" />
                <asp:Parameter Name="fk_tutor_rut" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="p_nombre" Type="String" />
                <asp:Parameter Name="s_nombre" Type="String" />
                <asp:Parameter Name="pa_apellido" Type="String" />
                <asp:Parameter Name="ma_apellido" Type="String" />
                <asp:Parameter Name="habitacion" Type="String" />
                <asp:Parameter Name="estado" Type="String" />
                <asp:Parameter DbType="Date" Name="fecha_ingreso" />
                <asp:Parameter Name="fk_tutor_rut" Type="String" />
                <asp:Parameter Name="rut" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </body>


</asp:Content>
