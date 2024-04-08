<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LogueoEmpleado.aspx.cs" Inherits="LogueoEmpleado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <style type="text/css">
    .style5
    {
        font-size: xx-large;
    }
    .style7
    {
        width: 275px;
        font-size: x-large;
    }
    .style8
    {
            font-size: xx-large;
            width: 278px;
            text-align: left;
        }
    .style9
    {
            width: 425px;
        }
    .style10
    {
        font-size: xx-large;
        text-decoration: underline;
        width: 425px;
    }
    .style11
    {
            font-size: xx-large;
            text-decoration: underline;
            width: 262px;
        }
        .style13
        {
            font-size: xx-large;
            text-align: left;
        }
        .style15
        {
            width: 425px;
            height: 34px;
        }
        </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;" frame="above">
        <tr>
            <td class="style11" style="background-color: #FFFFFF">
                </td>
            <td class="style10" 
                style="background-color: #FFFFFF; color: #006600; " align="center">
                Iniciar sesión - Empleado</td>
            <td class="style5" style="background-color: #FFFFFF">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style11" style="background-color: #FFFFFF">
                </td>
            <td class="style9" style="background-color: #FFFFFF">
                &nbsp;</td>
            <td class="style13" style="background-color: #FFFFFF">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8" 
                style="background-color: #FFFFFF; text-align: center; text-decoration: none;">
                <span class="style7" style="text-decoration: none">Empleado</span>:&nbsp; <asp:TextBox ID="txtEmpleado" runat="server"></asp:TextBox>
            </td>
            <td class="style15" style="background-color: #FFFFFF">
                Contraseña:&nbsp; <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td class="style8" style="background-color: #FFFFFF">
                <asp:Label ID="lblError" runat="server" Font-Size="X-Large" 
                    Font-Underline="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style11" style="background-color: #FFFFFF">
                </td>
            <td class="style9" style="background-color: #FFFFFF">
                <asp:Button ID="btnEntrar" runat="server" Text="Iniciar sesión" 
                    onclick="btnEntrar_Click" />
            </td>
            <td class="style8" style="background-color: #FFFFFF">
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" 
                    onclick="btnLimpiar_Click" />
            </td>
        </tr>
        <tr>
            <td class="style11" style="background-color: #FFFFFF">
                </td>
            <td class="style9" style="background-color: #FFFFFF">
                &nbsp;</td>
            <td class="style8" style="background-color: #FFFFFF">
                </td>
        </tr>
        <tr>
            <td class="style11" style="background-color: #FFFFFF">
                </td>
            <td class="style9" style="background-color: #FFFFFF">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Volver</asp:HyperLink>
            </td>
            <td class="style8" style="background-color: #FFFFFF">
                </td>
        </tr>
    </table>
</asp:Content>

