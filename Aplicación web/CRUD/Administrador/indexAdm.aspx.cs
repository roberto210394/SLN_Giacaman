using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD.Administrador
{
    public partial class indexAdm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.Parse(Session["rol"].ToString()) == 2)
            {
                Response.Redirect("../Profesional/indexProfesional.aspx");
            }
        }
    }
}