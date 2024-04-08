using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Logica;
using EntidadesCompartidas;
using Persistencia;
using System.Drawing;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                Session["Usuario"] = null;

                Session["Aeropuertos"] = LogicaAeropuertos.Listar();
                ddlAeropuertos.DataSource = Session["Aeropuertos"];
                ddlAeropuertos.DataTextField = "NombreA";
                ddlAeropuertos.DataBind();
                Limpiar();
            }
        }
        catch (Exception ex)
        {
           lblError.Text = ex.Message;
        }
    }

    protected void btnListar_Click(object sender, EventArgs e)
    {
        try
        {
            Aeropuertos aero = ((List<Aeropuertos>)Session["Aeropuertos"])[ddlAeropuertos.SelectedIndex];
            lblAeropuerto.Text = aero.unaC.Nombre;

            if (aero != null)
            {
                Limpiar();
                Session["Salida"] = LogicaVuelos.ListadeSalida(aero);
                gvSalida.DataSource = Session["Salida"];
                gvSalida.DataBind();

                if (((List<Vuelos>)Session["Salida"]).Count != 0)
                {
                    lblSalidas.Text = "Departure";
                }

                Session["Llegada"] = LogicaVuelos.ListadeLlegada(aero);
                gvLlegada.DataSource = Session["Llegada"];
                gvLlegada.DataBind();

                if (((List<Vuelos>)Session["Llegada"]).Count != 0)
                {
                    lblLlegadas.Text = "Arrived"; 
                }
            }
            else
            {
                lblError.ForeColor = Color.Blue;
                lblError.Text = "No hay viajes seleccionados al aeropuerto";
            }
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }

    private void Limpiar()
    {
        lblSalidas.Text = "";
        lblLlegadas.Text = "";
    }
}