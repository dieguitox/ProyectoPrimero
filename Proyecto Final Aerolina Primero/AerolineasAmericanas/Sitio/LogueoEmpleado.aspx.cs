using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntidadesCompartidas;
using Logica;
using Persistencia;

public partial class LogueoEmpleado : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Limpiar();
            Session["Usuario"] = null;
        }
    }

    protected void btnEntrar_Click(object sender, EventArgs e)
    {
        try
        {
            Empleados unEmp = LogicaEmpleados.LogueoE(txtEmpleado.Text.Trim(), txtPass.Text.Trim());

            if (unEmp != null)
            {
                Session["Usuario"] = unEmp;
                Response.Redirect("~/Menu.aspx");
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
        txtEmpleado.Text = "";
        txtPass.Text = "";
    }
}