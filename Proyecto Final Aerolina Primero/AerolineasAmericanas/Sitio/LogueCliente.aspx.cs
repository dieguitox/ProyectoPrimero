using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntidadesCompartidas;
using Logica;
using Persistencia;

public partial class LogueCliente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Limpiar();
            Session["Cliente"] = null;
        }
    }

    protected void btnEntrar_Click(object sender, EventArgs e)
    {
        try
        {
            Cliente unCli = LogicaClientes.LogueoC(txtCliente.Text.Trim(), txtPass.Text.Trim());

            if (unCli != null)
            {
                Session["Cliente"] = unCli;
                Response.Redirect("~/HistoricoCompras.aspx");
            }
            else
                lblError.Text = "Credenciales incorrectas";
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        Limpiar();
    }

    private void Limpiar()
    {
        txtCliente.Text = "";
        txtPass.Text = "";
    }
}