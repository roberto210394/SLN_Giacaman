using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace CRUD.Pacientes
{
    public partial class agregarAntecedentes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string rut = Request.QueryString["rut"];
            if (int.Parse(Session["rol"].ToString()) == 2)
            {
                Response.Redirect("../../Profesional/indexProfesional.aspx");
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                AntecedentesBLL ante = new AntecedentesBLL();

                //Crea variables
                string rut = Request.QueryString["rut"];
                string fami = null;
                if (txtFami.Text != "")
                {
                    fami = txtFami.Text;
                }
                string gine = null;
                if (txtGine.Text != "")
                {
                    gine = txtGine.Text;
                }
                string pato = null;
                if (txtPato.Text != "")
                {
                    pato = txtPato.Text;
                }
                string psiqui = null;
                if (txtPsiqui.Text != "")
                {
                    psiqui = txtPsiqui.Text;
                }
                string quiru = null;
                if (txtQuiru.Text != "")
                {
                    quiru = txtQuiru.Text;
                }
                string aler = null;
                if (txtAler.Text != "")
                {
                    aler = txtAler.Text;
                }


                ante.fk_paciente_rut = rut;
                ante.familiares = fami;
                ante.ginecologicos = gine;
                ante.patologicos = pato;
                ante.psiquiatricos = psiqui;
                ante.quirurgicos = quiru;
                ante.alergicos = aler;

                ante.Crear();

                
                Response.Redirect("../indexAdm.aspx", false);
                Response.Write("<script>alert('Antecedentes registrados con éxito')");
            }
            catch (Exception ex)
            {
                throw new Exception("<script>alert('" + ex.Message + "')</script>");
            }
        }
    }
}