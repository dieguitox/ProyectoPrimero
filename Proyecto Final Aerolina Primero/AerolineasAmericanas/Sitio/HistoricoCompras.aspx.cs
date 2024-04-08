using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntidadesCompartidas;
using Logica;
using Persistencia;
using System.Drawing;

public partial class HistoricoCompras : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                lblError.Text = "";

                Session["Pasajes"] = LogicaPasajes.Historico(((Cliente)Session["Cliente"]));

                if (Session["Pasajes"] != null)
                {
                    gvhistorico.DataSource = Session["Pasajes"];
                    gvhistorico.DataBind();
                }
                else
                {
                    lblError.ForeColor = Color.Blue;
                    lblError.Text = "El cliente no tiene pasajes asociados";
                }
            }
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }
    
    protected void gvhistorico_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            List<Pasajes> colpasajes = (List<Pasajes>)Session["Pasajes"];
            List<Vuelos> lista = new List<Vuelos>();
            int opcion = gvhistorico.SelectedIndex;

            Pasajes pasaje = colpasajes[opcion];
            lista.Add(pasaje.unV);

            gvPasajes.DataSource = lista;
            gvPasajes.DataBind();
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }
}