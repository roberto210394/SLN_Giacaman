using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using BLL;

namespace CRUD
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            //Crea referencia al servicio
            ServiceReference1.Service1Client svc = new ServiceReference1.Service1Client();
            
            //Ejecutar el metodo del servicio
            if (svc.autorizado(Login1.UserName, Login1.Password))
            {
                //Crea variable de session para saber el rol
                Session["rol"] = svc.rol(Login1.UserName);
                Session["rut"] = Login1.UserName;
                

                //Se deja como autenticado y redirige a la pag por defecto
                e.Authenticated = true;
                FormsAuthentication.RedirectFromLoginPage(Login1.UserName, Login1.RememberMeSet);

                //Se debe cerrar el servicio
                svc.Close();


            }
        }

        protected void Login1_Authenticate1(object sender, AuthenticateEventArgs e)
        {
            //Crea referencia al servicio
            ServiceReference1.Service1Client svc = new ServiceReference1.Service1Client();

            //Ejecutar el metodo del servicio
            if (svc.autorizado(Login1.UserName, Login1.Password))
            {
                //Crea variable de session para saber el rol
                Session["rol"] = svc.rol(Login1.UserName);
                Session["rut"] = Login1.UserName;


                //Se deja como autenticado y redirige a la pag por defecto
                e.Authenticated = true;
                FormsAuthentication.RedirectFromLoginPage(Login1.UserName, Login1.RememberMeSet);

                //Se debe cerrar el servicio
                svc.Close();


            }
        }
    }
}