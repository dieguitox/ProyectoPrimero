<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="VentaPasajes.aspx.cs" Inherits="VentaPasajes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 292px;
        }
        .style3
        {
            width: 752px;
        }
    .style4
    {
        text-align: left;
    }
    .style5
    {
        width: 752px;
        color: #006600;
        font-size: xx-large;
        text-decoration: underline;
    }
    .style6
    {
        width: 292px;
    }
    .style7
    {
        width: 292px;
        font-size: xx-large;
        text-decoration: underline;
        height: 11px;
    }
    .style8
    {
        width: 752px;
        height: 11px;
    }
    .style9
    {
        text-align: left;
        height: 11px;
    }
        .style10
        {
            width: 292px;
            height: 36px;
        }
        .style11
        {
            width: 752px;
            height: 36px;
        }
        .style12
        {
            text-align: left;
            width: 306px;
            height: 36px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td class="style2" style="background-color: #FFFFFF">
                </td>
            <td class="style5" style="background-color: #FFFFFF; ">
                Agregar pasajes</td>
            <td style="background-color: #FFFFFF" class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" style="background-color: #FFFFFF">
                </td>
            <td class="style3" style="background-color: #FFFFFF">
                &nbsp;</td>
            <td style="background-color: #FFFFFF" class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6" style="background-color: #FFFFFF">
                Nro de pasaporte:</td>
            <td class="style3" style="background-color: #FFFFFF">
                <asp:TextBox ID="txtPasaporte" runat="server" Width="128px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCliente" runat="server" onclick="btnCliente_Click" 
                    Text="Buscar Cliente" Width="128px" />
&nbsp;
                <asp:Label ID="lblCliente" runat="server"></asp:Label>
            </td>
            <td style="background-color: #FFFFFF" class="style4">
                <asp:Button ID="btnAlta" runat="server" Text="Comprar" 
                    onclick="btnAlta_Click" Width="78px" />
            </td>
        </tr>
        <tr>
            <td class="style10" style="background-color: #FFFFFF">
                Código de vuelo:</td>
            <td class="style11" style="background-color: #FFFFFF">
                <asp:TextBox ID="txtCodigo" runat="server" Width="128px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnVuelo" runat="server" onclick="btnVuelo_Click" 
                    Text="Buscar Vuelo" Width="128px" />
&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblVuelo" runat="server"></asp:Label>
            </td>
            <td style="background-color: #FFFFFF" class="style12">
                </td>
        </tr>
        <tr>
            <td class="style6" style="background-color: #FFFFFF">
                Precio:</td>
            <td class="style3" style="background-color: #FFFFFF">
                <asp:Label ID="lblPrecio" runat="server"></asp:Label>
            </td>
            <td style="background-color: #FFFFFF" class="style4">
                </td>
        </tr>
        <tr>
            <td class="style7" style="background-color: #FFFFFF">
                </td>
            <td class="style8" style="background-color: #FFFFFF">
                </td>
            <td style="background-color: #FFFFFF" class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" style="background-color: #FFFFFF">
                </td>
            <td class="style3" style="background-color: #FFFFFF" rowspan="2">
                <asp:GridView ID="GvdPasaje" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" Font-Size="Large" ForeColor="#333333" GridLines="None" 
                    Height="172px" Width="624px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField HeaderText="Nro Venta" DataField="nroFactura" />
                        <asp:BoundField HeaderText="Código de Vuelo" DataField="unV.CodigoV" />
                        <asp:BoundField HeaderText="Precio" DataField="PrecioTotal" />
                        <asp:BoundField HeaderText="Fecha de Compra" DataField="Fecha" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            </td>
            <td style="background-color: #FFFFFF" class="style4">
                <asp:Button ID="btnMostrar" runat="server" 
                    Text="Mostrar Vuelo" onclick="btnMostrar_Click" />
            </td>
        </tr>
        <tr>
            <td class="style2" style="background-color: #FFFFFF">
                </td>
            <td style="background-color: #FFFFFF" class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" style="background-color: #FFFFFF">
                </td>
            <td class="style3" style="background-color: #FFFFFF">
                <asp:Label ID="lblerror" runat="server"></asp:Label>
            </td>
            <td style="background-color: #FFFFFF" class="style4">
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" 
                    onclick="btnLimpiar_Click" Width="78px" />
            </td>
        </tr>
        <tr>
            <td class="style2" style="background-color: #FFFFFF">
                </td>
            <td class="style3" style="background-color: #FFFFFF">
                &nbsp;</td>
            <td style="background-color: #FFFFFF" class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" style="background-color: #FFFFFF">
                </td>
            <td class="style3" style="background-color: #FFFFFF">
                <asp:LinkButton ID="LinkButton6" runat="server" PostBackUrl="~/Menu.aspx">Volver al Menu</asp:LinkButton>
            </td>
            <td style="background-color: #FFFFFF" class="style4">
                &nbsp;</td>
        </tr>
    </table>    
</asp:Content>
