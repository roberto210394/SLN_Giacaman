using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD.Usuarios
{
    public partial class listarUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.Parse(Session["rol"].ToString()) == 2)
            {
                Response.Redirect("../../Profesional/indexProfesional.aspx");
            }
        }

        protected void gvUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            string rut = gvUsuarios.SelectedRow.Cells[7].Text;
            Response.Write(rut);
        }
    }
}