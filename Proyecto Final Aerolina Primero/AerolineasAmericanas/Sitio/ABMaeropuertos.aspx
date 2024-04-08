<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ABMaeropuertos.aspx.cs" Inherits="ABMaeropuertos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 292px;
        }
        .style3
        {
            width: 504px;
        }
    .style4
    {
        width: 714px;
        font-size: xx-large;
        color: #006600;
    }
    .style6
    {
        width: 504px;
        height: 7px;
    }
    .style7
    {
        height: 7px;
    }
    .style8
    {
        text-align: left;
    }
        .style9
        {
        width: 353px;
    }
    .style10
    {
        width: 353px;
        height: 33px;
    }
    .style11
    {
        width: 504px;
        height: 33px;
    }
    .style12
    {
        text-align: left;
        height: 33px;
    }
    .style13
    {
        width: 504px;
        color: #006600;
        font-size: xx-large;
        text-decoration: underline;
    }
    .style14
    {
        width: 353px;
        font-size: xx-large;
    }
    .style15
    {
        width: 353px;
        height: 7px;
    }
        .style16
        {
            width: 353px;
            font-size: xx-large;
            height: 40px;
        }
        .style17
        {
            width: 504px;
            height: 40px;
        }
        .style18
        {
            text-align: left;
            height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td class="style14" style="background-color: #FFFFFF">
                </td>
            <td class="style13" style="background-color: #FFFFFF; " align="center">
                Administrador de aeropuertos</td>
            <td style="background-color: #FFFFFF">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style15" style="background-color: #FFFFFF">
                </td>
            <td class="style6" style="background-color: #FFFFFF">
                </td>
            <td style="background-color: #FFFFFF" class="style7">
                </td>
        </tr>
        <tr>
            <td class="style9" style="background-color: #FFFFFF">
                Código:</td>
            <td class="style3" style="background-color: #FFFFFF">
                <asp:TextBox ID="txtCodigo" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td style="background-color: #FFFFFF" class="style8">
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" 
                    onclick="btnBuscar_Click" Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="style10" style="background-color: #FFFFFF">
                Nombre:</td>
            <td class="style11" style="background-color: #FFFFFF">
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td style="background-color: #FFFFFF" class="style12">
                <asp:Button ID="btnAlta" runat="server" Text="Agregar" 
                    onclick="btnAlta_Click" Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="style9" style="background-color: #FFFFFF">
                Dirección:</td>
            <td class="style3" style="background-color: #FFFFFF">
                <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td style="background-color: #FFFFFF" class="style8">
                <asp:Button ID="btnModificar" runat="server" Text="Modificar" 
                    onclick="btnModificar_Click" Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="style9" style="background-color: #FFFFFF">
                Impuesto de partida:</td>
            <td class="style3" style="background-color: #FFFFFF">
                <asp:TextBox ID="txtIpartida" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td style="background-color: #FFFFFF" class="style8">
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" 
                    onclick="btnEliminar_Click" Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="style9" style="background-color: #FFFFFF">
                Impuesto de llegada:</td>
            <td class="style3" style="background-color: #FFFFFF">
                <asp:TextBox ID="txtIllegada" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td style="background-color: #FFFFFF" class="style8">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9" style="background-color: #FFFFFF">
                Ciudad:</td>
            <td class="style3" style="background-color: #FFFFFF">
                <asp:TextBox ID="txtCiudad" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblCiudad" runat="server"></asp:Label>
            </td>
            <td style="background-color: #FFFFFF" class="style8">
                <asp:Button ID="btnCiudad" runat="server" onclick="btnCiudad_Click" 
                    Text="Buscar Ciudad" Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="style14" style="background-color: #FFFFFF">
                </td>
            <td class="style3" style="background-color: #FFFFFF">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
            <td style="background-color: #FFFFFF" class="style8">
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" 
                    onclick="btnLimpiar_Click" Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="style16" style="background-color: #FFFFFF">
                </td>
            <td class="style17" style="background-color: #FFFFFF">
                &nbsp;</td>
            <td style="background-color: #FFFFFF" class="style18">
            </td>
        </tr>
        <tr>
            <td class="style16" style="background-color: #FFFFFF">
                </td>
            <td class="style17" style="background-color: #FFFFFF">
                <asp:LinkButton ID="LinkButton6" runat="server" PostBackUrl="~/Menu.aspx">Volver al Menu</asp:LinkButton>
            </td>
            <td style="background-color: #FFFFFF" class="style18">
                &nbsp;</td>
        </tr>
    </table>    
</asp:Content>

