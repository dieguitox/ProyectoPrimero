using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

using Logica;
using EntidadesCompartidas;


public partial class ABMciudades : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";
        if (!IsPostBack)
            LimpioForm();
    }

    private void LimpioForm()
    {
        btnAlta.Enabled = false;
        btnModificar.Enabled = false;
        btnEliminar.Enabled = false;
        txtCodigo.Enabled = true;

        txtCodigo.Text = "";
        txtNombre.Text = "";
        txtPais.Text = "";
    }

    protected void btnAlta_Click(object sender, EventArgs e)
    {
        try 
	    {	        
		    string cod = txtCodigo.Text;
            string nom = txtNombre.Text;
            string pais = txtPais.Text;

            Ciudades ciu = new Ciudades(cod, nom, pais);

            LogicaCiudades.AgregarCiudad(ciu);

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

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtCodigo.Text.Length != 6)
            {
                lblError.ForeColor = Color.Black;
                lblError.Text = "El código de ciudad es de seis letras, intente nuevamente";
                return;
            }
 
            Ciudades ciu = LogicaCiudades.BuscarCiudad(txtCodigo.Text);

            if (ciu != null)
            {
                txtNombre.Text = ciu.Nombre;
                txtPais.Text = ciu.Pais;
                txtCodigo.Enabled = false;

                Session["Ciudades"] = ciu;

                btnAlta.Enabled = false;
                btnModificar.Enabled = true;
                btnEliminar.Enabled = true;
            }
            else
            {
                Session["Ciudades"] = null;

                btnAlta.Enabled = true;
                btnModificar.Enabled = false;
                btnEliminar.Enabled = false;
                txtCodigo.Enabled = false;

                lblError.ForeColor = Color.DimGray;
                lblError.Text = "No hay ciudades ingresadas con ese código";
            }
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
            Ciudades ciu = (Ciudades)Session["Ciudades"];

            ciu.Nombre = txtNombre.Text.Trim();
            ciu.Pais = txtPais.Text.Trim();

            LogicaCiudades.ModificarCiudad(ciu);

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
            Ciudades  ciu = (Ciudades)Session["Ciudades"];

            LogicaCiudades.EliminarCiudad(ciu);

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

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        LimpioForm();
    }
}