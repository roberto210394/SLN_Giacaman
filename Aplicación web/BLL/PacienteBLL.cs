using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class PacienteBLL
    {
        public string rut { get; set; }
        public string p_nombre { get; set; }
        public string s_nombre { get; set; }
        public string pa_apellido { get; set; }
        public string ma_apellido { get; set; }
        public DateTime fecha_nacimiento { get; set; }
        public int edad { get; set; }
        public int telefono { get; set; }
        public string estado { get; set; }
        public string habitacion { get; set; }
        public string sexo { get; set; }
        public string ocupacion { get; set; }
        public DateTime fecha_ingreso { get; set; }
        public string causal_ingreso { get; set; }
        public bool discapacitado { get; set; }
        public int porcentaje { get; set; }
        public string fk_tutor_rut { get; set; }
        public int fk_prevision { get; set; }
        public int fk_comuna { get; set; }
        public int fk_estado_civil { get; set; }


        public string Rut {
            get {
                return rut; 
            }
            set {
                if (validarRut(value) == true)
                {
                    rut = value;
                }
                else
                {
                    throw new Exception("Debe ingresar un rut válido");
                }
                
            }
        }

        public DateTime Fecha_nacimiento {
            get{
                return fecha_nacimiento;
            }
            set {
                if (value < DateTime.Now)
                {
                    fecha_nacimiento = value;
                }
                else
                {
                    throw new Exception("La fecha de nacimiento no puede ser posterior a la fecha actual");
                }
            } 
        }

        public int Edad {
            get{
                return edad;
            }
            set{
                if (value > 0)
                {
                    edad = value;
                }
                else
                {
                    throw new Exception("La edad no puede ser menor a 0");
                }
            }
        }

        public int Telefono {
            get{
                return telefono;
            }
            set {
                if(value.ToString().Length == 9)
                {
                    telefono = value;
                }
                else
                {
                    throw new Exception("El telefono debe tener 9 dígitos");
                }
                
            } 
        }

        public DateTime Fecha_ingreso {
            get{
                return fecha_ingreso;
            }
            set {
                if(value <= DateTime.Now)
                {
                    fecha_ingreso = value;
                }
                else
                {
                    throw new Exception("La fecha de ingreso no puede ser posterior a la fecha actual");
                }
                
            } 
        }

        public int Porcentaje {
            get {
                return porcentaje;
            }
            set {
                if(value >= 0)
                {
                    porcentaje = value;
                }
                else
                {
                    throw new Exception("El porcentaje de discapacidad no puede ser menor a 0");
                }
                
            } 
        }


        //Mantenedor
        public void Crear()
        {
            DB_GiacamanEntities modelo = new DB_GiacamanEntities();

            Paciente paciente = new Paciente();

            paciente.rut = this.Rut;
            paciente.p_nombre = this.p_nombre;
            paciente.s_nombre = this.s_nombre;
            paciente.pa_apellido = this.pa_apellido;
            paciente.ma_apellido = this.ma_apellido;
            paciente.fecha_nacimiento = this.Fecha_nacimiento;
            paciente.edad = this.Edad;
            paciente.telefono = this.Telefono;
            paciente.estado = this.estado;
            paciente.habitacion = this.habitacion;
            paciente.sexo = this.sexo;
            paciente.ocupacion = this.ocupacion;
            paciente.fecha_ingreso = this.Fecha_ingreso;
            paciente.causal_ingreso = this.causal_ingreso;
            paciente.discapacitado = this.discapacitado;
            paciente.porcentaje = this.Porcentaje;
            paciente.fk_tutor_rut = this.fk_tutor_rut;
            paciente.fk_prevision = this.fk_prevision;
            paciente.fk_comuna = this.fk_comuna;
            paciente.fk_estado_civil = this.fk_estado_civil;

            modelo.Paciente.Add(paciente);
            modelo.SaveChanges();

        }

        public void Editar()
        {
            DB_GiacamanEntities modelo = new DB_GiacamanEntities();

            Paciente paciente = (from pac in modelo.Paciente where pac.rut.Equals(this.Rut) select pac).FirstOrDefault();

            paciente.p_nombre = this.p_nombre;
            paciente.s_nombre = this.s_nombre;
            paciente.pa_apellido = this.pa_apellido;
            paciente.ma_apellido = this.ma_apellido;
            paciente.fecha_nacimiento = this.Fecha_nacimiento;
            paciente.edad = this.Edad;
            paciente.telefono = this.Telefono;
            paciente.estado = this.estado;
            paciente.habitacion = this.habitacion;
            paciente.sexo = this.sexo;
            paciente.ocupacion = this.ocupacion;
            paciente.fecha_ingreso = this.Fecha_ingreso;
            paciente.causal_ingreso = this.causal_ingreso;
            paciente.discapacitado = this.discapacitado;
            paciente.porcentaje = this.Porcentaje;
            paciente.fk_tutor_rut = this.fk_tutor_rut;
            paciente.fk_prevision = this.fk_prevision;
            paciente.fk_comuna = this.fk_comuna;
            paciente.fk_estado_civil = this.fk_estado_civil;

            modelo.SaveChanges();
        }

        public void Eliminar()
        {
            DB_GiacamanEntities modelo = new DB_GiacamanEntities();

            Paciente paciente = buscarPaciente(this.Rut);

            modelo.Paciente.Remove(paciente);
            modelo.SaveChanges();
        }



        public PacienteBLL GetPacienteBLL()
        {
            DB_GiacamanEntities modelo = new DB_GiacamanEntities();

            PacienteBLL paciente = new PacienteBLL();
            Paciente pacienteDB = buscarPaciente(this.Rut);

            paciente.rut = pacienteDB.rut;
            paciente.p_nombre = pacienteDB.p_nombre;
            paciente.s_nombre = pacienteDB.s_nombre;
            paciente.pa_apellido = pacienteDB.pa_apellido;
            paciente.ma_apellido = pacienteDB.ma_apellido;
            paciente.fecha_nacimiento = pacienteDB.fecha_nacimiento.GetValueOrDefault();
            paciente.edad = pacienteDB.edad.GetValueOrDefault();
            paciente.telefono = pacienteDB.telefono.GetValueOrDefault();
            paciente.estado = pacienteDB.estado;
            paciente.habitacion = pacienteDB.habitacion;
            paciente.sexo = pacienteDB.sexo;
            paciente.ocupacion = pacienteDB.ocupacion;
            paciente.fecha_ingreso = pacienteDB.fecha_ingreso.GetValueOrDefault();
            paciente.causal_ingreso = pacienteDB.causal_ingreso;
            paciente.discapacitado = pacienteDB.discapacitado.GetValueOrDefault();
            paciente.porcentaje = pacienteDB.porcentaje.GetValueOrDefault();
            paciente.fk_tutor_rut = pacienteDB.fk_tutor_rut;
            paciente.fk_prevision = pacienteDB.fk_prevision.GetValueOrDefault();
            paciente.fk_comuna = pacienteDB.fk_comuna.GetValueOrDefault();
            paciente.fk_estado_civil = pacienteDB.fk_estado_civil.GetValueOrDefault();


            return paciente;
        }


        public Paciente buscarPaciente(string rut)
        {
            DB_GiacamanEntities modelo = new DB_GiacamanEntities();
            return modelo.Paciente.Find(rut);
            
        }

        public bool validarRut(string rut)
        {
            bool validacion = false;
            try
            {
                rut = rut.ToUpper();
                rut = rut.Replace(".", "");
                rut = rut.Replace("-", "");
                int rutAux = int.Parse(rut.Substring(0, rut.Length - 1));

                char dv = char.Parse(rut.Substring(rut.Length - 1, 1));

                int m = 0, s = 1;
                for (; rutAux != 0; rutAux /= 10)
                {
                    s = (s + rutAux % 10 * (9 - m++ % 6)) % 11;
                }
                if (dv == (char)(s != 0 ? s + 47 : 75))
                {
                    validacion = true;
                }
            }
            catch (Exception)
            {
            }
            return validacion;
        }

        public bool pacienteExiste()
        {
            Paciente paciente = buscarPaciente(this.Rut);
            if(paciente == null)
            {
                return false;
            }
            return true;
        }

        
    }



    
}
