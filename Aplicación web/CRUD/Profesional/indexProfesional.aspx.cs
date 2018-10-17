using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD
{
    public partial class indexProfesional : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.Parse(Session["rol"].ToString()) == 1)
            {
                Response.Redirect("../Administrador/indexAdm.aspx");
            }
        }
    }
}