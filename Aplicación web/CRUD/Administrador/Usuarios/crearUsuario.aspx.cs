using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace CRUD.Usuarios
{
    public partial class crearUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.Parse(Session["rol"].ToString()) == 2)
            {
                Response.Redirect("../../Profesional/indexProfesional.aspx");
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtPassword.Text.Equals(txtPassword2.Text))
                {
                    //Crea variables
                    string rut = txtRut.Text;
                    string pNombre = txtPNombre.Text;
                    string sNombre = txtSNombre.Text;
                    string aPaterno = txtAPaterno.Text;
                    string aMaterno = txtAMaterno.Text;
                    int telefono = int.Parse(txtTelefono.Text);
                    string direccion = txtDireccion.Text;
                    string pass = txtPassword.Text;
                    int rol = int.Parse(ddlRolUsuario.SelectedValue);
                    int especialidad = int.Parse(ddEspecialidad.SelectedValue);

                    UsuarioBLL usuario = new UsuarioBLL();

                    usuario.Rut = rut;
                    usuario.P_nombre = pNombre;
                    usuario.s_nombre = sNombre;
                    usuario.Pa_apellido = aPaterno;
                    usuario.Ma_apellido = aMaterno;
                    usuario.Telefono = telefono;
                    usuario.Direccion = direccion;
                    usuario.Password = pass;
                    usuario.Fk_rol_id = rol;
                    usuario.fk_especialidad_id = especialidad;

                    usuario.Crear();
                    Limpiar();
                    
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('"+ex.Message+"')</script>");
            }
        }

        public void Limpiar()
        {
            txtRut.Text = "";
            txtPNombre.Text = "";
            txtSNombre.Text = "";
            txtAPaterno.Text = "";
            txtAMaterno.Text = "";
            txtTelefono.Text = "";
            txtDireccion.Text = "";
            txtPassword.Text = "";
            txtPassword2.Text = "";
            ddlRolUsuario.SelectedIndex = 0;
            ddEspecialidad.SelectedIndex = 0;
        }
    }
}