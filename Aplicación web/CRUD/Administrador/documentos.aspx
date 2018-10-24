<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="documentos.aspx.cs" Inherits="CRUD.Administrador.documentos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:TextBox ID="txtTitulo" runat="server"></asp:TextBox>
    
    <asp:FileUpload ID="FileUpload1" runat="server" />
    
    <asp:Button ID="btnSubir" runat="server" Text="Subir" OnClick="btnSubir_Click" />
    
    <br />
    
    
    
    <asp:GridView ID="gvDocumentos" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="gvDocumentos_SelectedIndexChanged">
        <Columns>
            <asp:CommandField SelectText="Descargar" ShowSelectButton="True" />
            <asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo" />
            <asp:BoundField DataField="fk_paciente_rut" HeaderText="fk_paciente_rut" SortExpression="fk_paciente_rut" />
            <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" />
            <asp:BoundField DataField="id" HeaderText="codigo" InsertVisible="False" ReadOnly="True" SortExpression="id" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_GiacamanConnectionString %>" SelectCommand="SELECT titulo, fk_paciente_rut, fecha, id FROM Documentos WHERE (fk_paciente_rut = '777777777') ORDER BY fecha">
    </asp:SqlDataSource>
    
    
    
</asp:Content>
