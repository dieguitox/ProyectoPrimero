<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="HistoricoCompras.aspx.cs" Inherits="HistoricoCompras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            width: 655px;
        text-align: right;
    }
    .style4
    {
        color: #006600;
        font-size: xx-large;
    }
    .style5
    {
        color: #006600;
        font-size: xx-large;
    }
    .style7
    {
        color: #006600;
        font-size: xx-large;
        width: 465px;
        text-decoration: underline;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:85%;">
        <tr>
            <td bgcolor="White" class="style7" align="center">
                Historial del Cliente</td>
        </tr>
        <tr>
            <td bgcolor="White" class="style3" align="right">
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="White" class="style1" align="center">
                <asp:GridView ID="gvhistorico" runat="server"
                    CellPadding="4" Font-Size="Large" ForeColor="#333333" GridLines="None" 
                    Width="518px" AutoGenerateColumns="False" 
                    onselectedindexchanged="gvhistorico_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="NroFactura" HeaderText="Factura" />
                        <asp:BoundField DataField="unV.CodigoV" HeaderText="Vuelo" />
                        <asp:BoundField DataField="PrecioTotal" HeaderText="Precio" />
                        <asp:BoundField DataField="unC.pasaporte" HeaderText="Pasaporte" />
                        <asp:CommandField SelectText="Ver" ShowSelectButton="True" />
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
        </tr>
        <tr>
            <td bgcolor="White" class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="White" class="style1" align="center">
                <asp:GridView ID="gvPasajes" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" Font-Size="Large" ForeColor="#333333" GridLines="None" 
                    HorizontalAlign="Center" Width="1477px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="CodigoV" HeaderText="Código de Vuelo" />
                        <asp:BoundField DataField="AeroP.NombreA" HeaderText="Aeropuerto Salida" />
                        <asp:BoundField DataField="FechaS" HeaderText="Fecha Salida" />
                        <asp:BoundField DataField="AeroP.unaC.Nombre" HeaderText="Ciudad  Salida" />
                        <asp:BoundField DataField="AeroP.unaC.Pais" HeaderText="País Salida" />
                        <asp:BoundField DataField="AeroL.unaC.Nombre" HeaderText="Aeropuerto Llegada" />
                        <asp:BoundField DataField="AeroL.unaC.Nombre" HeaderText="Ciudad LLegada" />
                        <asp:BoundField DataField="AeroL.unaC.Pais" HeaderText="País LLegada" />
                        <asp:BoundField DataField="FechaLl" HeaderText="Fecha de Llegada" />
                        <asp:BoundField DataField="Precio" HeaderText="Precio" />
                        <asp:BoundField DataField="Asientos" HeaderText="Cant. de Asientos" />
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
        </tr>
        <tr>
            <td bgcolor="White" class="style1" align="center">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

