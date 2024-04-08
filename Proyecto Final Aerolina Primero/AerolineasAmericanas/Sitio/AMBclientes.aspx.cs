using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

using Logica;
using EntidadesCompartidas;

public partial class AMBclientes : System.Web.UI.Page
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

        txtPasaporte.Text = "";
        txtPass.Text = "";
        txtNombre.Text = "";
        txtTarjeta.Text = "";
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtPasaporte.Text.Length != 7)
            {
                lblError.ForeColor = Color.Black;
                lblError.Text = "El pasaporte es de siete letras, intente nuevamente";
                return;
            }
 
            Cliente cli = LogicaClientes.Buscar(txtPasaporte.Text);

            if (cli != null)
            {
                txtPass.Text = cli.Contrasenia;
                txtNombre.Text = cli.Nombre;
                txtTarjeta.Text = cli.Tarjeta.ToString();

                Session["Cliente"] = cli;

                btnAlta.Enabled = false;
                btnModificar.Enabled = true;
                btnEliminar.Enabled = true;
            }
            else
            {
                Session["Cliente"] = null;

                btnAlta.Enabled = true;
                btnModificar.Enabled = false;
                btnEliminar.Enabled = false;

                txtPass.Text = "";
                txtNombre.Text = "";
                txtTarjeta.Text = "";

                lblError.ForeColor = Color.DimGray;
                lblError.Text = "No hay clientes con ese número de pasaporte";


            }
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
            Cliente cli = (Cliente)Session["Cliente"];

            LogicaClientes.EliminarCliente(cli);

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

    protected void btnAlta_Click(object sender, EventArgs e)
    {
        try
        {
            string pasaporte = txtPasaporte.Text;
            string pass = txtPass.Text;
            string nom = txtNombre.Text;
            long tarjeta = long.Parse(txtTarjeta.Text);

            Cliente cli = new Cliente(pasaporte, pass, nom, tarjeta);

            LogicaClientes.AgregarCliente(cli);

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
            Cliente cli = (Cliente)Session["Cliente"];
            
            cli.Contrasenia = txtPass.Text.Trim();
            cli.Nombre = txtNombre.Text.Trim();
            cli.Tarjeta =  long.Parse(txtTarjeta.Text);

            LogicaClientes.ModificarCliente(cli);

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

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        LimpioForm();
    }
}