<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LogueCliente.aspx.cs" Inherits="LogueCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
        width: 350px;
    }
        .style3
        {
        width: 577px;
        background-color: #FFFFFF;
    }
    .style4
    {
        background-color: #FFFFFF;
    }
    .style5
    {
        width: 560px;
        font-size: xx-large;
        color: #006600;
        text-decoration: underline;
        background-color: #FFFFFF;
    }
    .style8
    {
        width: 321px;
        font-size: xx-large;
        background-color: #FFFFFF;
    }
    .style9
    {
        font-size: x-large;
    }
    .style10
    {
        background-color: #FFFFFF;
        text-align: left;
    }
    .style11
    {
        width: 577px;
        font-size: xx-large;
        color: #006600;
        text-decoration: underline;
        background-color: #FFFFFF;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style11">
                Iniciar sesión - Cliente</td>
            <td class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                <span class="style9">Pasaporte:&nbsp; </span><asp:TextBox ID="txtCliente" runat="server"></asp:TextBox>
            </td>
            <td class="style3">
                Contraseña:&nbsp; <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td class="style10">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style3">
                <asp:Button ID="btnEntrar" runat="server" Text="Iniciar sesión" 
                    onclick="btnEntrar_Click" />
            </td>
            <td class="style10">
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" 
                    onclick="btnLimpiar_Click" Width="78px" />
            </td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style3">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Volver</asp:HyperLink>
            </td>
            <td class="style10">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

