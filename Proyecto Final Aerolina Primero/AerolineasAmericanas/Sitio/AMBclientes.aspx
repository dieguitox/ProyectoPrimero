<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AMBclientes.aspx.cs" Inherits="AMBclientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 292px;
        }
        .style3
        {
            width: 483px;
        }
        .style4
        {
            width: 292px;
            height: 32px;
        }
        .style6
        {
            height: 32px;
        text-align: left;
    }
    .style7
    {
        width: 483px;
        color: #006600;
        font-size: xx-large;
        text-decoration: underline;
    }
    .style8
    {
            width: 265px;
        }
    .style9
    {
        text-align: left;
    }
        .style10
        {
            width: 265px;
            height: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td class="style8" style="background-color: #FFFFFF">
                &nbsp;</td>
            <td class="style7" style="background-color: #FFFFFF; " align="center">
                Administrador de clientes</td>
            <td style="background-color: #FFFFFF" class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8" style="background-color: #FFFFFF">
                &nbsp;</td>
            <td class="style3" style="background-color: #FFFFFF" align="center">
                &nbsp;</td>
            <td style="background-color: #FFFFFF" class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10" style="background-color: #FFFFFF">
                Pasaporte:</td>
            <td class="style3" style="background-color: #FFFFFF" align="center">
                <asp:TextBox ID="txtPasaporte" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td style="background-color: #FFFFFF" class="style6">
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" 
                    onclick="btnBuscar_Click" Width="78px" />
            </td>
        </tr>
        <tr>
            <td class="style8" style="background-color: #FFFFFF">
                Contraseña:</td>
            <td class="style3" style="background-color: #FFFFFF" align="center">
                <asp:TextBox ID="txtPass" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td style="background-color: #FFFFFF" class="style9">
                <asp:Button ID="btnAlta" runat="server" Text="Agregar" 
                    onclick="btnAlta_Click" Width="78px" />
            </td>
        </tr>
        <tr>
            <td class="style8" style="background-color: #FFFFFF">
                Nombre:</td>
            <td class="style3" style="background-color: #FFFFFF" align="center">
                <asp:TextBox ID="txtNombre" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td style="background-color: #FFFFFF" class="style9">
                <asp:Button ID="btnModificar" runat="server" Text="Modificar" 
                    onclick="btnModificar_Click" Width="78px" />
            </td>
        </tr>
        <tr>
            <td class="style8" style="background-color: #FFFFFF">
                Tarjeta de crédito:</td>
            <td class="style3" style="background-color: #FFFFFF" align="center">
                <asp:TextBox ID="txtTarjeta" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td style="background-color: #FFFFFF" class="style9">
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" 
                    onclick="btnEliminar_Click" Width="78px" />
            </td>
        </tr>
        <tr>
            <td class="style8" style="background-color: #FFFFFF">
                &nbsp;</td>
            <td class="style3" style="background-color: #FFFFFF" align="center">
                &nbsp;</td>
            <td style="background-color: #FFFFFF" class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8" style="background-color: #FFFFFF">
                &nbsp;</td>
            <td class="style3" style="background-color: #FFFFFF" align="center">
                &nbsp;</td>
            <td style="background-color: #FFFFFF" class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8" style="background-color: #FFFFFF">
                &nbsp;</td>
            <td class="style3" style="background-color: #FFFFFF" align="center">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
            <td style="background-color: #FFFFFF" class="style9">
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" 
                    onclick="btnLimpiar_Click" style="height: 26px" Width="78px" />
            </td>
        </tr>
        <tr>
            <td class="style8" style="background-color: #FFFFFF">
                &nbsp;</td>
            <td class="style3" style="background-color: #FFFFFF" align="center">
                &nbsp;</td>
            <td style="background-color: #FFFFFF" class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8" style="background-color: #FFFFFF">
                &nbsp;</td>
            <td class="style3" style="background-color: #FFFFFF" align="center">
                <asp:LinkButton ID="LinkButton6" runat="server" PostBackUrl="~/Menu.aspx">Volver al Menu</asp:LinkButton>
            </td>
            <td style="background-color: #FFFFFF" class="style9">
                &nbsp;</td>
        </tr>
    </table>    
</asp:Content>

