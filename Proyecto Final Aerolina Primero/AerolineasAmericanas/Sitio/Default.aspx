<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 378px;
        }
        .style2
        {
            width: 1280px;
        }
        .style3
        {
            width: 568px;
        }
        .style4
        {
            width: 1280px;
            color: #006600;
            font-size: xx-large;
            text-decoration: underline;
            height: 73px;
        }
        .style5
        {
            width: 378px;
            height: 73px;
        }
        .style6
        {
            width: 568px;
            height: 73px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width:100%;">
            <tr>
                <td class="style5" align="right">
                    </td>
                <td class="style4" align="center" style="font-family: Corbel;">
                    Bienvenido - Página principal</td>
                <td class="style6" width="250">
                    </td>
            </tr>
            <tr>
                <td class="style1" align="center">
                    &nbsp;</td>
                <td align="center" class="style2">
                    <asp:DropDownList ID="ddlAeropuertos" runat="server" Width="128px">
                    </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblAeropuerto" runat="server"></asp:Label>
                </td>
                <td class="style3" width="250">
                    <asp:Button ID="btnListar" runat="server" onclick="btnListar_Click" 
                        Text="Listar" Width="78px" />
                </td>
            </tr>
            <tr>
                <td class="style1" align="center">
                    &nbsp;</td>
                <td align="center" class="style2" style="text-align: center">
                    <br />
                    <asp:Label ID="lblSalidas" runat="server" Font-Italic="True" 
                        Font-Size="X-Large"></asp:Label>
                    <br />
                    <br />
                    <asp:GridView ID="gvSalida" runat="server" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" AutoGenerateColumns="False" Font-Size="Large" 
                        HorizontalAlign="Center" Width="663px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="CodigoV" HeaderText="Codigo del Vuelo" />
                            <asp:BoundField DataField="FechaS" HeaderText="Fecha de Salida" />
                            <asp:BoundField DataField="AeroL.NombreA" HeaderText="Aeropuerto de Llegada" />
                            <asp:BoundField DataField="AeroL.unaC.Pais" HeaderText="Destino" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" 
                            VerticalAlign="Middle" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                    <br />
                    <asp:Label ID="lblLlegadas" runat="server" Font-Italic="True" 
                        Font-Size="X-Large"></asp:Label>
                    <br />
                    <br />
                    <asp:GridView ID="gvLlegada" runat="server" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" AutoGenerateColumns="False" Font-Size="Large" 
                        HorizontalAlign="Center" Width="671px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="CodigoV" HeaderText="Codigo del Vuelo" />
                            <asp:BoundField DataField="FechaLl" HeaderText="Fecha de Llegada" />
                            <asp:BoundField DataField="AeroP.NombreA" HeaderText="Aeropuerto Proveniente" />
                            <asp:BoundField DataField="AeroP.unaC.Pais" HeaderText="País Proveniente" />
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
                <td class="style3" width="250">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1" align="right">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3" width="250">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="right" class="style1">
                    <asp:LinkButton ID="lnkEmpleado" runat="server" 
                        PostBackUrl="~/LogueoEmpleado.aspx" Font-Size="Large">Ir a logueo de empleados</asp:LinkButton>
                </td>
                <td class="style2">
                    &nbsp;</td>
                <td align="left" class="style3">
                    <asp:LinkButton ID="lnkClientes" runat="server" 
                        PostBackUrl="~/LogueCliente.aspx" Font-Size="Large">Ir a logueo de clientes</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="style1" align="right">
                    &nbsp;</td>
                <td class="style2" align="center">
                    <asp:Label ID="lblError" runat="server" Font-Size="Large"></asp:Label>
                </td>
                <td class="style3" width="250">
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
