using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD.Atenciones
{
    public partial class crearAtencion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.Parse(Session["rol"].ToString()) == 1)
            {
                Response.Redirect("../../Administrador/indexAdm.aspx");
            }
        }

        protected void gvPac_SelectedIndexChanged(object sender, EventArgs e)
        {
            string rut = gvPac.SelectedRow.Cells[1].Text;

            Response.Redirect("registrarAtencion.aspx?rut="+rut);
        }
    }
}