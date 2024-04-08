<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Menu.aspx.cs" Inherits="Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style5
        {
            font-size: xx-large;
            color: #006600;
            text-decoration: underline;
        }
        .style6
        {
            height: 144px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%; height: 242px;">
        <tr>
            <td>
                &nbsp;</td>
            <td class="style5" align="center">
                Menú</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
            </td>
            <td class="style6" align="center">

                    1.<asp:LinkButton ID="LinkButton6" runat="server" 
                        PostBackUrl="~/ABMaeropuertos.aspx">Aeropuertos</asp:LinkButton> 
                    &nbsp;<br />
                    2.<asp:LinkButton ID="LinkButton7" runat="server" 
                        PostBackUrl="~/ABMciudades.aspx">Ciudades</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
                    <br />
                    3.<asp:LinkButton ID="LinkButton8" runat="server" 
                        PostBackUrl="~/AMBclientes.aspx" >Clientes</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    4.<asp:LinkButton ID="LinkButton9" runat="server" 
                        PostBackUrl="~/VentaPasajes.aspx">Pasajes</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    5.<asp:LinkButton ID="LinkButton10" runat="server" 
                        PostBackUrl="~/AltaVuelo.aspx">Vuelos</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            </td>
            <td class="style6">
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
