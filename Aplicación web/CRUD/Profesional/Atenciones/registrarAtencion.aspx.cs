using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace CRUD.Atenciones
{
    public partial class registrarAtencion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string rut = Request.QueryString["rut"];
            lblFechaHoy.Text = DateTime.Now.ToShortDateString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                //Crea variables
                DateTime fecha = DateTime.Now;
                string nombre = txtNombreAtencion.Text;
                string descripcion = txtDescAtencion.Text;
                string medicamentos = txtMedicamentos.Text;
                string rut = Request.QueryString["rut"];
                string rutUsuario = Session["rut"].ToString();

                //Crea nueva atencion
                AtencionBLL atencion = new AtencionBLL();
                atencion.Fecha = fecha;
                atencion.Nombre_atencion = nombre;
                atencion.Descripcion = descripcion;
                atencion.medicamentos = medicamentos;
                atencion.Fk_paciente_rut = rut;
                atencion.Fk_usuario_rut = rutUsuario;

                atencion.Crear();

                Response.Write("<script>alert('Atención registrada')</script>");


            }
            catch (Exception ex)
            {
                throw new Exception("<script>alert('"+ex.Message+"')</script>");
            }


        }
    }
}