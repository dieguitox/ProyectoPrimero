using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

using Logica;
using EntidadesCompartidas;

public partial class ABMaeropuertos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";
        lblCiudad.Text = "";

        if (!IsPostBack)
            LimpioForm();
            
    }

    private void LimpioForm()
    {
        btnAlta.Enabled = false;
        btnModificar.Enabled = false;
        btnEliminar.Enabled = false;

        txtCodigo.Enabled = true;
        txtCiudad.Text = "";
        txtIllegada.Text = "";
        txtIpartida.Text = "";
        txtNombre.Text = "";
        txtDireccion.Text = "";
        txtCodigo.Text = "";
    }

    protected void btnAlta_Click(object sender, EventArgs e)
    {
        try
        {
            string cod = txtCodigo.Text;
            string nom = txtNombre.Text;
            string dire = txtDireccion.Text;
            double partida = Convert.ToDouble(txtIpartida.Text);
            double llegada = Convert.ToDouble(txtIllegada.Text);
            Ciudades ciu = (Ciudades)Session["Ciudad"];

            Aeropuertos aero = new Aeropuertos(cod, nom, dire, partida, llegada, ciu);

            LogicaAeropuertos.AgregarAeropuerto(aero);

            lblError.ForeColor = Color.Green;
            lblError.Text = "Alta exitosa";

            LimpioForm();
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }
    }

    protected void btnModificar_Click(object sender, EventArgs e)
    {
        try
        {
            Aeropuertos aero = (Aeropuertos)Session["Aeropuertos"];

            aero.NombreA = txtNombre.Text.Trim();
            aero.Direccion = txtDireccion.Text.Trim();
            aero.ImpuestoPar = Convert.ToDouble(txtIpartida.Text);
            aero.ImpuestoLleg = Convert.ToDouble(txtIllegada.Text);

            LogicaAeropuertos.ModificarAeropuerto(aero);

            lblError.ForeColor = Color.Green;
            lblError.Text = "Modificación exitosa";

            LimpioForm();

        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }


    }

    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        try
        {
            Aeropuertos aero = (Aeropuertos)Session["Aeropuertos"];

            LogicaAeropuertos.EliminarAeropuerto(aero);

            lblError.ForeColor = Color.Green;
            lblError.Text = "Eliminación exitosa";

            LimpioForm();
        }
        catch (Exception ex)
        {
            lblError.ForeColor = Color.Red;
            lblError.Text = ex.Message;
        }

    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtCodigo.Text.Length != 3)
            {
                lblError.ForeColor = Color.Black;
                lblError.Text = "El código de aeropuerto es de tres letras, intente nuevamente";
                return;
            }

            Aeropuertos aero =  LogicaAeropuertos.Buscar(txtCodigo.Text);

            if (aero != null)
            {
                txtCodigo.Text = aero.CodigoA;
                txtNombre.Text = aero.NombreA;
                txtDireccion.Text = aero.Direccion;
                txtIllegada.Text = aero.ImpuestoLleg.ToString();
                txtIpartida.Text = aero.ImpuestoPar.ToString();
                txtCiudad.Text = aero.unaC.Codigo;

                Session["Aeropuertos"] = aero;

                btnAlta.Enabled = false;
                btnModificar.Enabled = true;
                btnEliminar.Enabled = true;
            }
            else
            {
                Session["Aeropuertos"] = null;
                txtCodigo.Enabled = false;
                btnAlta.Enabled = true;

                lblError.ForeColor = Color.DimGray;
                lblError.Text = "No hay aeropuertos ingresados con ese código";
            }

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

    protected void btnCiudad_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtCiudad.Text.Length != 6)
            {
                lblError.ForeColor = Color.Black;
                lblError.Text = "El código de ciudad es de seis letras, intente nuevamente";
                return;
            }
 
            //busco 
            Ciudades ciu = LogicaCiudades.BuscarCiudad(txtCiudad.Text);
 
            //determino acciones
            if (ciu == null)
            {
                Session["Ciudad"] = null;
                lblError.ForeColor = Color.Red;
                lblCiudad.Text = "No existe esa ciudad";
            }
            else
            {
                Session["Ciudad"] = ciu;
                txtCiudad.Text = ciu.Codigo.ToString();
                lblError.ForeColor = Color.Green;
                lblCiudad.Text = "La ciudad es " + ciu.Nombre.ToString();
            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }
}