using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using Logica;
using EntidadesCompartidas;



public partial class VentaPasajes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblerror.Text = "";
            LimpioForm();
        }
    }

    protected void btnAlta_Click(object sender, EventArgs e)
    {
        try
        {
            List<Pasajes> lista = new List<Pasajes>();
            List<Pasajes> unaF = new List<Pasajes>();

            DateTime fecha = DateTime.Now;
            double monto = 1;

            Pasajes unP = new Pasajes(0,fecha,monto,((Vuelos)Session["Vuelos"]),((Cliente)Session["Cliente"]));
            int numero = LogicaPasajes.AgregarPasaje(unP);

            lblPrecio.Text = "$ " + unP.PrecioTotal.ToString();

            lblerror.ForeColor = Color.Green;
            lblerror.Text = "Pasaje comprado con Exito. Número de Factura " + numero;

            LimpioForm();

            lista = LogicaPasajes.Historico((Cliente)Session["Cliente"]);
            
            foreach (Pasajes p in lista)
            {
                if (p.NroFactura == numero)
                {
                    unaF.Add(p);
                    Session["Mostrar"] = unaF;
                    break;
                }
            }
        }
        catch (Exception ex)
        {
            lblerror.ForeColor = Color.Red;
            lblerror.Text = ex.Message;
        }
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        LimpioForm();
    }

    private void LimpioForm()
    {
        txtCodigo.Text = "";
        txtPasaporte.Text = "";
    }

    protected void btnCliente_Click(object sender, EventArgs e)
    {
        try
        {
            Cliente cliente = LogicaClientes.Buscar(txtPasaporte.Text);

            if (cliente == null)
            {
                Session["Cliente"] = null;
                lblCliente .Text = "No existe ese cliente en el sistema";
                
            }
            else
            {
                Session["Cliente"] = cliente;
                lblCliente.Text = cliente.Nombre;
            }  
        }
        catch (Exception ex)
        {

            lblerror.Text = ex.Message;
        }
    }

    protected void btnVuelo_Click(object sender, EventArgs e)
    {
        try
        {
            Vuelos unV = LogicaVuelos.BuscarV(txtCodigo.Text);

            if (unV == null)
            {
                Session["Vuelos"] = null;
                lblVuelo.Text = "No existe ese vuelo en el sistema";
            }
            else
            {
                Session["Vuelos"] = unV;
                lblVuelo.Text = unV.CodigoV;             
            } 
        }
        catch (Exception ex)
        {
            lblerror.ForeColor = Color.Red;
            lblerror.Text = ex.Message;
        }
    }

    protected void btnMostrar_Click(object sender, EventArgs e)
    {
        GvdPasaje.DataSource = Session["Mostrar"];
        GvdPasaje.DataBind();
    }
}

