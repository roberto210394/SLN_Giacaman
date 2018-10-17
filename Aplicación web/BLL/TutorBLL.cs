using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class TutorBLL
    {
        private string rut;
        private string p_nombre;
        public string s_nombre { get; set; }
        private string pa_apellido;
        private string ma_apellido;
        private string parentesco;
        public int telefono { get; set; }
        private string direccion;

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
        public string P_nombre {
            get
            {
                return p_nombre;
            }
            set
            {
                if(value != null)
                {
                    p_nombre = value;
                }
                else
                {
                    throw new Exception("Debe ingresar un nombre");
                }
                
            }
        }
        public string Pa_apellido {
            get
            {
                return pa_apellido;
            }
            set
            {
                if (value != null)
                {
                    pa_apellido = value;
                }
                else
                {
                    throw new Exception("Debe ingresar apellido paterno");
                }
            }
        }
        public string Ma_apellido {
            get
            {
                return ma_apellido;
            }
            set
            {
                if(value != null)
                {
                    ma_apellido = value;
                }
                else
                {
                    throw new Exception("Debe ingresar apellido materno");
                }
                
            }
        }
        public string Parentesco {
            get
            {
                return parentesco;
            }
            set
            {
                if (value != null)
                {
                    parentesco = value;
                }
                else
                {
                    throw new Exception("Debe ingresar parentesco");
                }
                
            }
        }
        public string Direccion {
            get
            {
                return direccion;
            }
            set
            {
                if (value != null)
                {
                    direccion = value;
                }
                else
                {
                    throw new Exception("Debe ingresar dirección");
                }
                
            }
        }


        //Mantenedor
        public void Crear()
        {
            DB_GiacamanEntities modelo = new DB_GiacamanEntities();

            Tutor tutor = new Tutor();

            tutor.rut = this.Rut;
            tutor.p_nombre = this.P_nombre;
            tutor.s_nombre = this.s_nombre;
            tutor.pa_apellido = this.Pa_apellido;
            tutor.ma_apellido = this.Ma_apellido;
            tutor.parentesco = this.Parentesco;
            tutor.telefono = this.telefono;
            tutor.direccion = this.Direccion;

            modelo.Tutor.Add(tutor);
            modelo.SaveChanges();
        }

        public void Editar()
        {
            DB_GiacamanEntities modelo = new DB_GiacamanEntities();

            Tutor tutor = buscarTutor();

            tutor.p_nombre = this.P_nombre;
            tutor.s_nombre = this.s_nombre;
            tutor.pa_apellido = this.Pa_apellido;
            tutor.ma_apellido = this.Ma_apellido;
            tutor.parentesco = this.Parentesco;
            tutor.telefono = this.telefono;
            tutor.direccion = this.Direccion;

            modelo.SaveChanges();

        }

        public void Eliminar()
        {
            DB_GiacamanEntities modelo = new DB_GiacamanEntities();

            Tutor tutor = buscarTutor();

            modelo.Tutor.Remove(tutor);
            modelo.SaveChanges();
        }



        public Tutor buscarTutor()
        {
            DB_GiacamanEntities modelo = new DB_GiacamanEntities();
            return modelo.Tutor.Find(this.Rut);
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

    }
}
