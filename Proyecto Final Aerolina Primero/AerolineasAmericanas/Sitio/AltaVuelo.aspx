<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AltaVuelo.aspx.cs" Inherits="AltaVuelo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <style type="text/css">
    .style5
    {
            font-size: xx-large;
            width: 328px;
        }
    .style6
    {
            font-size: xx-large;
            color: #006600;
            width: 500px;
        }
        .style7
        {
            width: 328px;
        }
        .style8
        {
            width: 500px;
        }
        .style9
        {
            width: 460px;
        }
    .style10
    {
        width: 328px;
    }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td class="style5" style="background-color: #FFFFFF">
                &nbsp;</td>
            <td class="style6" style="background-color: #FFFFFF; ">
                Agregar viajes</td>
            <td style="background-color: #FFFFFF" class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5" style="background-color: #FFFFFF">
                &nbsp;</td>
            <td class="style8" style="background-color: #FFFFFF">
                &nbsp;</td>
            <td style="background-color: #FFFFFF" class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10" style="background-color: #FFFFFF">
                Aeropuerto de salida:</td>
            <td class="style8" style="background-color: #FFFFFF">
                <asp:DropDownList ID="ddlAero" runat="server" Width="128px">
                </asp:DropDownList>
            </td>
            <td style="background-color: #FFFFFF" align="left" class="style9">
                <asp:Button ID="btnAlta" runat="server" Text="Agregar" 
                    onclick="btnAlta_Click" Width="78px" />
            </td>
        </tr>
        <tr>
            <td class="style10" style="background-color: #FFFFFF">
                Fecha de salida:</td>
            <td class="style8" style="background-color: #FFFFFF">
                <asp:TextBox ID="txtFechaS" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
            </td>
            <td style="background-color: #FFFFFF" align="left" class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10" style="background-color: #FFFFFF">
                Aeropuerto de llegada:</td>
            <td class="style8" style="background-color: #FFFFFF">
                <asp:DropDownList ID="ddlLlegada" runat="server" Width="128px">
                </asp:DropDownList>
            </td>
            <td style="background-color: #FFFFFF" align="left" class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10" style="background-color: #FFFFFF">
                Fecha de llegada:</td>
            <td class="style8" style="background-color: #FFFFFF">
                <asp:TextBox ID="txtFechaLl" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
            </td>
            <td style="background-color: #FFFFFF" align="left" class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10" style="background-color: #FFFFFF">
                Precio:</td>
            <td class="style8" style="background-color: #FFFFFF">
                <asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox>
            </td>
            <td style="background-color: #FFFFFF" align="left" class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10" style="background-color: #FFFFFF">
                Cantidad de asientos:</td>
            <td class="style8" style="background-color: #FFFFFF">
                <asp:TextBox ID="txtAsientos" runat="server"></asp:TextBox>
            </td>
            <td style="background-color: #FFFFFF" align="left" class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10" style="background-color: #FFFFFF">
                &nbsp;</td>
            <td class="style8" style="background-color: #FFFFFF">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
            <td style="background-color: #FFFFFF" align="left" class="style9">
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" 
                    onclick="btnLimpiar_Click" Width="78px" />
            </td>
        </tr>
        <tr>
            <td class="style10" style="background-color: #FFFFFF">
                &nbsp;</td>
            <td class="style8" style="background-color: #FFFFFF">
                &nbsp;</td>
            <td style="background-color: #FFFFFF" align="left" class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10" style="background-color: #FFFFFF">
                &nbsp;</td>
            <td class="style8" style="background-color: #FFFFFF">
                <asp:LinkButton ID="LinkButton6" runat="server" PostBackUrl="~/Menu.aspx">Volver al Menu</asp:LinkButton>
            </td>
            <td style="background-color: #FFFFFF" align="left" class="style9">
                &nbsp;</td>
        </tr>
    </table>    
</asp:Content>

