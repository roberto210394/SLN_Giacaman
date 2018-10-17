using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class UsuarioBLL
    {
        private string rut;
        private string p_nombre;
        public string s_nombre { get; set; }
        private string pa_apellido;
        private string ma_apellido;
        private int telefono;
        private string direccion;
        private string password;
        private int fk_rol_id;
        public int fk_especialidad_id { get; set; }


        public string Rut {
            get
            {
                return rut;
            }
            set
            {
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
                if(value != null)
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

        public int Telefono {
            get
            {
                return telefono;
            }
            set
            {
                if(value.ToString().Length == 9)
                {
                    telefono = value;
                }
                else
                {
                    throw new Exception("El número debe tener 9 dígitos");
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
                if(value != null)
                {
                    direccion = value;
                }
                else
                {
                    throw new Exception("Debe ingresar una dirección");
                }
                
            }
        }

        public string Password {
            get
            {
                return password;
            }
            set
            {
                if(value != null)
                {
                    password = value;
                }
                else
                {
                    throw new Exception("Debe ingresar una contraseña");
                }
                
            }
        }

        public int Fk_rol_id {
            get
            {
                return fk_rol_id;
            }
            set
            {
                if(value >= 0)
                {
                    fk_rol_id = value;
                }
                else
                {
                    throw new Exception("Debe seleccionar un rol");
                }
                
            }
        }

        public void Crear()
        {
            DB_GiacamanEntities modelo = new DB_GiacamanEntities();

            Usuario usuario = new Usuario();

            usuario.rut = this.Rut;
            usuario.p_nombre = this.P_nombre;
            usuario.s_nombre = this.s_nombre;
            usuario.pa_apellido = this.Pa_apellido;
            usuario.ma_apellido = this.Ma_apellido;
            usuario.telefono = this.Telefono;
            usuario.direccion = this.Direccion;
            usuario.password = this.Password;
            usuario.fk_rol_id = this.Fk_rol_id;
            usuario.fk_especialidad_id = this.fk_especialidad_id;

            modelo.Usuario.Add(usuario);
            modelo.SaveChanges();
        }

        public void Editar()
        {
            DB_GiacamanEntities modelo = new DB_GiacamanEntities();

            Usuario usuario = (from usr in modelo.Usuario where usr.rut.Equals(this.Rut) select usr).FirstOrDefault();

            usuario.p_nombre = this.P_nombre;
            usuario.s_nombre = this.s_nombre;
            usuario.pa_apellido = this.Pa_apellido;
            usuario.ma_apellido = this.Ma_apellido;
            usuario.telefono = this.Telefono;
            usuario.direccion = this.Direccion;
            usuario.password = this.Password;
            usuario.fk_rol_id = this.Fk_rol_id;
            usuario.fk_especialidad_id = this.fk_especialidad_id;

            modelo.SaveChanges();
        }

        public void Eliminar()
        {
            DB_GiacamanEntities modelo = new DB_GiacamanEntities();

            Usuario usuario = (from usr in modelo.Usuario where usr.rut.Equals(this.Rut) select usr).FirstOrDefault();

            modelo.Usuario.Remove(usuario);
        }

        public UsuarioBLL GetUsuarioBLL()
        {
            DB_GiacamanEntities modelo = new DB_GiacamanEntities();

            UsuarioBLL usuario = new UsuarioBLL();
            Usuario usuarioDB = buscarUsuario(this.Rut);

            usuario.Rut = usuarioDB.rut;
            usuario.P_nombre = usuarioDB.p_nombre;
            usuario.s_nombre = usuarioDB.s_nombre;
            usuario.Pa_apellido = usuarioDB.pa_apellido;
            usuario.Ma_apellido = usuarioDB.ma_apellido;
            usuario.Telefono = usuarioDB.telefono;
            usuario.Direccion = usuarioDB.direccion;
            usuario.Password = usuarioDB.password;
            usuario.Fk_rol_id = usuarioDB.fk_rol_id;
            //usuario.fk_especialidad_id = usuarioDB.fk_especialidad_id;

            return usuario;
        }


        public Usuario buscarUsuario(string rut)
        {
            DB_GiacamanEntities modelo = new DB_GiacamanEntities();
            return modelo.Usuario.Find(rut);
        }

        public bool validarUsuario()
        {
            DB_GiacamanEntities modelo = new DB_GiacamanEntities();

            Usuario user = (from usr in modelo.Usuario where usr.rut.Equals(this.Rut) && usr.password.Equals(this.Password) select usr).FirstOrDefault();
            if(user != null)
            {
                return true;
            }
            return false;
        }

        public int GetRol()
        {
            DB_GiacamanEntities modelo = new DB_GiacamanEntities();

            int rol = (from usr in modelo.Usuario where usr.rut.Equals(this.Rut) select usr.fk_rol_id).FirstOrDefault();
            return rol;
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
