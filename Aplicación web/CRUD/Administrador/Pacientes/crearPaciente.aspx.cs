using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace CRUD
{
    public partial class crearPaciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.Parse(Session["rol"].ToString()) == 2)
            {
                Response.Redirect("../../Profesional/indexProfesional.aspx");
            }

            txtRutTutor.Enabled = false;
            txtPNombreTutor.Enabled = false;
            txtSNombreTutor.Enabled = false;
            txtPaApellidoTutor.Enabled = false;
            txtMaApellidoTutor.Enabled = false;
            txtParentesco.Enabled = false;
            txtTelefonoTutor.Enabled = false;
            txtDireccion.Enabled = false;
            
            
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

            try
            {
                PacienteBLL aux = new PacienteBLL();
                aux.Rut = txtRut.Text;

                if (!aux.pacienteExiste())
                {


                    //Creación de variables paciente
                    string rut = txtRut.Text;
                    string pNombre = txtPNombre.Text;
                    string sNombre = txtSNombre.Text;
                    string paApellido = txtPaApellido.Text;
                    string maApellido = txtMaApellido.Text;
                    DateTime nacimiento = dpNacimiento.SelectedDate;
                    int edad = int.Parse(txtEdad.Text);
                    int telefono = 000000000;
                    if (txtTelefono.Text != "")
                    {
                        telefono = int.Parse(txtTelefono.Text);
                    }
                    string estado = "Activo";
                    string habitación = txtHabitacion.Text;
                    string sexo = "";
                    if (rbMale.Checked == true)
                    {
                        sexo = "M";
                    }
                    if (rbFemale.Checked == true)
                    {
                        sexo = "F";
                    }
                    string ocupacion = txtOcupacion.Text;
                    DateTime ingreso = dpIngreso.SelectedDate;
                    string causalIngreso = txtCausalIngreso.Text;
                    bool discapacitado = false;
                    if (cbDiscapacitado.Checked == true)
                    {
                        discapacitado = true;
                    }
                    int porcentaje = 0;
                    if (txtPorcentaje.Text != "")
                    {
                        porcentaje = int.Parse(txtPorcentaje.Text);
                    }
                    string prevision = ddPrevision.SelectedValue;
                    string comuna = ddComuna.SelectedValue;
                    string estadoCivil = ddEstadoCivil.SelectedValue;
                    string rutTutor = null;
                    if (cbTutor.Checked == true)
                    {
                      rutTutor = txtRutTutor.Text;
                    }
                    //string rutTutor = txtRutTutor.Text;


                    TutorBLL tutor = new TutorBLL();
                    //Creacion de tutor si existe
                    if (cbTutor.Checked == true)
                    {
                        //Creación de variables tutor
                        
                        string pNombreTutor = txtPNombreTutor.Text;
                        string sNombreTutor = txtSNombreTutor.Text;
                        string paApellidoTutor = txtPaApellidoTutor.Text;
                        string maApellidoTutor = txtMaApellidoTutor.Text;
                        string parentesco = txtParentesco.Text;
                        int telefonoTutor = int.Parse(txtTelefonoTutor.Text);
                        string direccion = txtDireccion.Text;

                        //Asigna valores a nuevo tutor

                        tutor.Rut = rutTutor;
                        tutor.P_nombre = pNombreTutor;
                        tutor.s_nombre = sNombreTutor;
                        tutor.Pa_apellido = paApellidoTutor;
                        tutor.Ma_apellido = maApellidoTutor;
                        tutor.Parentesco = parentesco;
                        tutor.telefono = telefonoTutor;
                        tutor.Direccion = direccion;
                    }


                    //Asigna valores a nuevo paciente
                    PacienteBLL paciente = new PacienteBLL();

                    paciente.Rut = rut;
                    paciente.p_nombre = pNombre;
                    paciente.s_nombre = sNombre;
                    paciente.pa_apellido = paApellido;
                    paciente.ma_apellido = maApellido;
                    paciente.Fecha_nacimiento = nacimiento;
                    paciente.Edad = edad;
                    paciente.Telefono = telefono;
                    paciente.estado = estado;
                    paciente.habitacion = habitación;
                    paciente.sexo = sexo;
                    paciente.ocupacion = ocupacion;
                    paciente.Fecha_ingreso = ingreso;
                    paciente.causal_ingreso = causalIngreso;
                    paciente.discapacitado = discapacitado;
                    paciente.Porcentaje = porcentaje;
                    paciente.fk_prevision = int.Parse(prevision);
                    paciente.fk_comuna = int.Parse(comuna);
                    paciente.fk_estado_civil = int.Parse(estadoCivil);
                    paciente.fk_tutor_rut = rutTutor;

                    //Crea paciente y tutor en caso de que exista uno
                    if (cbTutor.Checked == true)
                    {
                        tutor.Crear();
                    }

                    paciente.Crear();

                    
                    Response.Redirect("agregarAntecedentes.aspx?rut=" + rut, false);
                    Response.Write("<script>alert('Paciente registrado con éxito')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('"+ ex.Message +"')</script>");
            }
        }

        protected void rbMale_CheckedChanged(object sender, EventArgs e)
        {
            rbFemale.Checked = false;
        }

        protected void rbFemale_CheckedChanged(object sender, EventArgs e)
        {
            rbMale.Checked = false;
        }

        protected void cbTutor_CheckedChanged(object sender, EventArgs e)
        {
            if(cbTutor.Checked == true)
            {
                txtRutTutor.Enabled = true;
                txtPNombreTutor.Enabled = true;
                txtSNombreTutor.Enabled = true;
                txtPaApellidoTutor.Enabled = true;
                txtMaApellidoTutor.Enabled = true;
                txtParentesco.Enabled = true;
                txtTelefonoTutor.Enabled = true;
                txtDireccion.Enabled = true;
            }
            if (cbTutor.Checked == false)
            {
                txtRutTutor.Enabled = false;
                txtPNombreTutor.Enabled = false;
                txtSNombreTutor.Enabled = false;
                txtPaApellidoTutor.Enabled = false;
                txtMaApellidoTutor.Enabled = false;
                txtParentesco.Enabled = false;
                txtTelefonoTutor.Enabled = false;
                txtDireccion.Enabled = false;
            }
            
        }
    }
}