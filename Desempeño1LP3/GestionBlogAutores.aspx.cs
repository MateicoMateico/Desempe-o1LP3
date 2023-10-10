using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Desempeño1LP3
{
    public partial class GestionBlogAutores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonCA_Click(object sender, EventArgs e)
        {
            
            if (TextBoxNombreAutor.Text != "" && TextBoxApellidoAutor.Text != "")
            {
                int resultado = SqlDataSource1.Insert();
                LabelMsg.Text = "Se ha agregado " + resultado.ToString() + " Autor.";

                string fechaActual = DateTime.Now.ToString();

                using (StreamWriter streamWriter = new StreamWriter($"{Server.MapPath(".")}/logs.txt", true))
                {
                    streamWriter.WriteLine("-Creacion Autor-");
                    streamWriter.WriteLine("Fecha: " + fechaActual);
                    streamWriter.WriteLine("Nombre: " + TextBoxNombreAutor.Text);
                    streamWriter.WriteLine("Apellido: " + TextBoxApellidoAutor.Text);
                    streamWriter.WriteLine(" ");
                   

                }

                TextBoxApellidoAutor.Text = string.Empty;
                TextBoxNombreAutor.Text = string.Empty;
            } else
            {
                LabelMsg.Text = "Complete los campos antes de crear el Autor.";
            }
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            LabelMsg.Text = "Se ha eliminado 1 Autor.";
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            LabelMsg.Text = "Se ha modificado 1 Autor.";
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string idAutor = e.Keys["id"].ToString();
            string nombre = e.Values["nombre"].ToString();
            string apellido = e.Values["apellido"].ToString();
            string fechaActual = DateTime.Now.ToString();

            using (StreamWriter streamWriter = new StreamWriter($"{Server.MapPath(".")}/logs.txt", true))
            {
                streamWriter.WriteLine("-Eliminación Autor-");
                streamWriter.WriteLine("Fecha: " + fechaActual);
                streamWriter.WriteLine("ID: " + idAutor);
                streamWriter.WriteLine("Nombre: " + nombre);
                streamWriter.WriteLine("Apellido: " + apellido);
                streamWriter.WriteLine(" ");
                
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string idAutor = e.Keys["id"].ToString();
            string nombreNuevo = e.NewValues["nombre"].ToString();
            string apellidoNuevo = e.NewValues["apellido"].ToString();
            string nombreAntiguo = e.OldValues["nombre"].ToString();
            string apellidoAntiguo = e.OldValues["apellido"].ToString();
            string fechaActual = DateTime.Now.ToString();

            using (StreamWriter streamWriter = new StreamWriter($"{Server.MapPath(".")}/logs.txt", true))
            {
                streamWriter.WriteLine("-Modificación Autor-");
                streamWriter.WriteLine("Fecha: " + fechaActual);
                streamWriter.WriteLine("ID: " + idAutor);
                streamWriter.WriteLine("Nombre Antiguo: " + nombreAntiguo);
                streamWriter.WriteLine("Apellido Antiguo: " + apellidoAntiguo);
                streamWriter.WriteLine("Nombre Nuevo: " + nombreNuevo);
                streamWriter.WriteLine("Apellido Nuevo: " + apellidoNuevo);
                streamWriter.WriteLine(" ");
                
            }
        }
    }
}