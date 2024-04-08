using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntidadesCompartidas;
using Persistencia;
using Logica;
using System.Drawing;

public partial class AltaVuelo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LimpioForm();
            Session["Aeropuertos"] = LogicaAeropuertos.Listar();
            ddlAero.DataSource = Session["Aeropuertos"];
            ddlAero.DataTextField = "NombreA";
            ddlAero.DataBind();
            ddlAero.Items.Insert(0, "Seleccione");
            ddlLlegada.DataSource = Session["Aeropuertos"];
            ddlLlegada.DataTextField = "NombreA";
            ddlLlegada.DataBind();
            ddlLlegada.Items.Insert(0, "Seleccione");
        }
    }

    protected void btnAlta_Click(object sender, EventArgs e)
    {
        try
        {
            lblError.Text = "";
            Aeropuertos departure = LogicaAeropuertos.Buscar((((List<Aeropuertos>)Session["Aeropuertos"])[ddlAero.SelectedIndex - 1]).CodigoA);
            Aeropuertos arrived = LogicaAeropuertos.Buscar((((List<Aeropuertos>)Session["Aeropuertos"])[ddlLlegada.SelectedIndex - 1]).CodigoA);
            DateTime FSalida = Convert.ToDateTime(txtFechaS.Text);
            DateTime FLlegada = Convert.ToDateTime(txtFechaLl.Text);
            double precio = Convert.ToDouble(txtPrecio.Text);
            int asientos = Convert.ToInt16(txtAsientos.Text);
            string codi = "";

            Vuelos unV = new Vuelos(codi, FSalida, FLlegada, precio, asientos, departure, arrived);
            LogicaVuelos.AgregarVuelo(unV);

            lblError.ForeColor = Color.Green;
            lblError.Text = "Alta exitosa." + unV.CodigoV.ToString();

            LimpioForm();

        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        LimpioForm();
    }

    private void LimpioForm()
    {
        txtFechaS.Text = "";
        txtFechaLl.Text = "";
        txtPrecio.Text = "";
        txtAsientos.Text = "";
        ddlAero.SelectedIndex = -1;
        ddlLlegada.SelectedIndex = -1;
    }
}