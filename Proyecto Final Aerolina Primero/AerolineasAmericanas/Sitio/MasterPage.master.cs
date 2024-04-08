using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntidadesCompartidas;


public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Cliente"] is Cliente)
        {
            Menu1.Visible = false;
            lblUser.Text = "Bienvenido/a " + ((Cliente)Session["Cliente"]).Nombre;
        }
        
        if (Session["Usuario"] is Empleados)
        {
            Menu1.Visible = true;
            lblUser.Text = "Bienvenido/a " + ((Empleados)Session["Usuario"]).Nombre;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        lblUser.Text = "";
        Session["Cliente"] = null;
        Session["Usuario"] = null;
        Response.Redirect("~/Default.aspx");
    }
}
