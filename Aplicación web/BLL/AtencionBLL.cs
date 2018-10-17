using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class AtencionBLL
    {
        public int id { get; set; }
        private System.DateTime fecha;
        private string nombre_atencion;
        private string descripcion;
        public string medicamentos { get; set; }
        private string fk_paciente_rut;
        private string fk_usuario_rut;


        public DateTime Fecha {
            get {
                return fecha;
            }
            set{
                if(value <= DateTime.Now)
                {
                    fecha = value;
                }
                else
                {
                    throw new Exception("La fecha de atención no puede ser posterior a la fecha actual");
                }
                
            }
        }

        public string Nombre_atencion {
            get
            {
                return nombre_atencion;
            }
            set
            {
                if (value != null)
                {
                    nombre_atencion = value;
                }
                else
                {
                    throw new Exception("Debe ingresar un nombre de atención");
                }

            }
        }

        public string Descripcion {
            get
            {
                return descripcion;
            }
            set
            {
                if (value != null)
                {
                    descripcion = value;
                }
                else
                {
                    throw new Exception("Debe ingresar una descripción");
                }

            }
        }

        public string Fk_paciente_rut {
            get
            {
                return fk_paciente_rut;
            }
            set
            {
                if (value != null)
                {
                    fk_paciente_rut = value;
                }
                else
                {
                    throw new Exception("Debe seleccionar un paciente");
                }

            }
        }

        public string Fk_usuario_rut {
            get
            {
                return fk_usuario_rut;
            }
            set
            {
                if (value != null)
                {
                    fk_usuario_rut = value;
                }
                else
                {
                    throw new Exception("Debe seleccionar un usuario");
                }

            }
        }

        

        public void Crear()
        {
            DB_GiacamanEntities modelo = new DB_GiacamanEntities();

            Atencion atencion = new Atencion();

            atencion.fecha = this.Fecha;
            atencion.nombre_atencion = this.Nombre_atencion;
            atencion.descripcion = this.Descripcion;
            atencion.medicamentos = this.medicamentos;
            atencion.fk_paciente_rut = this.Fk_paciente_rut;
            atencion.fk_usuario_rut = this.Fk_usuario_rut;

            modelo.Atencion.Add(atencion);
            modelo.SaveChanges();
        }


    }
}
