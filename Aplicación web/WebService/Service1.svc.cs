using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using BLL;

namespace WebService
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Service1" en el código, en svc y en el archivo de configuración.
    // NOTE: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione Service1.svc o Service1.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class Service1 : IService1
    {
        public bool autorizado(string rut, string pass)
        {
            UsuarioBLL user = new UsuarioBLL();
            user.Rut = rut;
            user.Password = pass;
            return user.validarUsuario();
        }

        public int rol(string rut)
        {
            UsuarioBLL user = new UsuarioBLL();
            user.Rut = rut;
            int rol = user.GetRol();
            return rol;
        }
    }
}
