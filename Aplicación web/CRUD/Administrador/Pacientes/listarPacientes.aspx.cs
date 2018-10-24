using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD
{
    public partial class listarPacientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.Parse(Session["rol"].ToString()) == 2)
            {
                Response.Redirect("../../Profesional/indexProfesional.aspx");
            }

            if (!IsPostBack)
            {
                gvPacientesTodo.Visible = true;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string rut = gvPacientes.SelectedRow.Cells[1].Text;
            Response.Redirect("editarPaciente.aspx?rut=" + rut);
        }

        protected void btnTodo_Click(object sender, EventArgs e)
        {
            gvPacientes.Visible = false;
            gvPacientesTodo.Visible = true;
        }

        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            gvPacientes.Visible = true;
            gvPacientesTodo.Visible = false;
        }
    }
}