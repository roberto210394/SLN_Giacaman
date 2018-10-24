using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;

namespace CRUD.Administrador
{
    public partial class documentos : System.Web.UI.Page
    {
        string conexion = "Data Source=DESKTOP-A1M93J4\\SQLEXPRESS;Initial Catalog=DB_Giacaman;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubir_Click(object sender, EventArgs e)
        {
            if(txtTitulo.Text != "")
            {
                string nombreArchivo = FileUpload1.FileName.ToString();

                Response.Write("<script>alert('"+nombreArchivo+"')</script>");

                string[] extensiones = nombreArchivo.Split('.');
                int final = extensiones.Count()-1;
                string ext = extensiones[final].ToString();


                Response.Write("<script>alert('" + extensiones[final] + "')</script>");

                //PacienteBLL paciente = new PacienteBLL();
                //paciente.Rut = "777777777";
                //HACER LA VARIABLE DEL RUT DEL USUARIO**************************************************************
                string rutPaciente = "777777777";

                int tam = FileUpload1.PostedFile.ContentLength;
                byte[] docOriginal = new byte[tam];
                FileUpload1.PostedFile.InputStream.Read(docOriginal, 0, tam);


                SqlConnection conexionSQL = new SqlConnection(conexion);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "INSERT INTO Documentos(fk_paciente_rut,documento,titulo,extension) VALUES(@rut,@doc,@titulo,@extension)";
                cmd.Parameters.Add("@rut", SqlDbType.Text).Value = rutPaciente;
                cmd.Parameters.Add("@doc", SqlDbType.VarBinary).Value = docOriginal;
                cmd.Parameters.Add("@titulo", SqlDbType.Text).Value = txtTitulo.Text;
                cmd.Parameters.Add("@extension", SqlDbType.Text).Value = ext;




                cmd.CommandType = CommandType.Text;
                cmd.Connection = conexionSQL;
                conexionSQL.Open();
                cmd.ExecuteNonQuery();

                Response.Write("<script>alert('Archivo cargado con éxito')</script>");
            }
            else
            {
                Response.Redirect("<script>alert('Debe ingresar un titulo para el archivo')</script>");
            }
        }

        protected void gvDocumentos_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idDoc = int.Parse(gvDocumentos.SelectedRow.Cells[4].Text);
            string titulo = gvDocumentos.SelectedRow.Cells[1].Text;

            SqlConnection conexionSQL = new SqlConnection(conexion);
            conexionSQL.Open();
            SqlCommand cmd = new SqlCommand("SELECT documento FROM documentos where id = @id", conexionSQL);
            cmd.Parameters.Add("@id", SqlDbType.Int).Value = idDoc;
            byte[] buffer = (byte[])cmd.ExecuteScalar();
            conexionSQL.Close();
            FileStream fs = new FileStream(@"C:\Users\rob21\Desktop\" + titulo + ".pdf", FileMode.Create);
            fs.Write(buffer, 0, buffer.Length);
            fs.Close();

            Response.Write("<script>alert('Archivo descargado con éxito')</script>");
        }
    }
}