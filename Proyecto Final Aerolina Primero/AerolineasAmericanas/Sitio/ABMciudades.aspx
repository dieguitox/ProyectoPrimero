<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ABMciudades.aspx.cs" Inherits="ABMciudades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <style type="text/css">
    .style5
    {
            text-decoration: underline;
            width: 227px;
        }
    .style6
    {
        text-decoration: underline;
        color: #006600;
    }
    .style7
    {
        text-decoration: underline;
        color: #006600;
        font-size: xx-large;
            width: 550px;
        }
    .style8
    {
        color: #006600;
    }
    .style9
    {
        height: 30px;
            width: 227px;
        }
    .style10
    {
        width: 550px;
        height: 30px;
    }
    .style11
    {
        text-decoration: underline;
        color: #006600;
        height: 30px;
    }
        .style12
        {
            width: 550px;
        }
        .style13
        {
            width: 227px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td class="style5" style="background-color: #FFFFFF">
                </td>
            <td class="style7" style="background-color: #FFFFFF; ">
                Administrador de Ciudades</td>
            <td style="background-color: #FFFFFF" class="style8" align="left">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5" style="background-color: #FFFFFF">
                </td>
            <td class="style12" style="background-color: #FFFFFF">
                &nbsp;</td>
            <td style="background-color: #FFFFFF" class="style8" align="left">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9" style="background-color: #FFFFFF">
                Código:</td>
            <td class="style10" style="background-color: #FFFFFF">
                <asp:TextBox ID="txtCodigo" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td style="background-color: #FFFFFF" class="style11" align="left">
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" 
                    onclick="btnBuscar_Click" Width="78px" />
            </td>
        </tr>
        <tr>
            <td style="background-color: #FFFFFF" class="style13">
                Nombre:</td>
            <td class="style12" style="background-color: #FFFFFF">
                <asp:TextBox ID="txtNombre" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td style="background-color: #FFFFFF" class="style6" align="left">
                <asp:Button ID="btnAlta" runat="server" Text="Agregar" 
                    onclick="btnAlta_Click" Width="78px" />
            </td>
        </tr>
        <tr>
            <td style="background-color: #FFFFFF" class="style13">
                País:</td>
            <td class="style12" style="background-color: #FFFFFF">
                <asp:TextBox ID="txtPais" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td style="background-color: #FFFFFF" class="style6" align="left">
                <asp:Button ID="btnModificar" runat="server" Text="Modificar" 
                    onclick="btnModificar_Click" Width="78px" />
            </td>
        </tr>
        <tr>
            <td style="background-color: #FFFFFF" class="style13">
                &nbsp;</td>
            <td class="style12" style="background-color: #FFFFFF">
                &nbsp;</td>
            <td style="background-color: #FFFFFF" class="style6" align="left">
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" 
                    onclick="btnEliminar_Click" Width="78px" />
            </td>
        </tr>
        <tr>
            <td style="background-color: #FFFFFF" class="style13">
                &nbsp;</td>
            <td class="style12" style="background-color: #FFFFFF">
                &nbsp;</td>
            <td style="background-color: #FFFFFF" class="style8" align="left">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="background-color: #FFFFFF" class="style13">
                &nbsp;</td>
            <td class="style12" style="background-color: #FFFFFF">
                &nbsp;</td>
            <td style="background-color: #FFFFFF" class="style8" align="left">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="background-color: #FFFFFF" class="style13">
                &nbsp;</td>
            <td class="style12" style="background-color: #FFFFFF">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
            <td style="background-color: #FFFFFF" class="style6" align="left">
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" 
                    onclick="btnLimpiar_Click" Width="78px" />
            </td>
        </tr>
        <tr>
            <td style="background-color: #FFFFFF" class="style13">
                &nbsp;</td>
            <td class="style12" style="background-color: #FFFFFF">
                &nbsp;</td>
            <td style="background-color: #FFFFFF" class="style6" align="left">
            </td>
        </tr>
        <tr>
            <td style="background-color: #FFFFFF" class="style13">
                &nbsp;</td>
            <td class="style12" style="background-color: #FFFFFF">
                <asp:LinkButton ID="LinkButton6" runat="server" PostBackUrl="~/Menu.aspx">Volver al Menu</asp:LinkButton>
            </td>
            <td style="background-color: #FFFFFF" class="style6" align="left">
            </td>
        </tr>
    </table>    
</asp:Content>

