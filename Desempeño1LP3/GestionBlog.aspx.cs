using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Desempeño1LP3
{
    public partial class GestionBlog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void ButtonCB_Click(object sender, EventArgs e)
        {
            if (TextBoxCuerpo.Text != "")
            {
                int resultado = SqlDataSourceBlogsJoinAutores.Insert();
                LabelMsg.Text = "Se ha agregado " + resultado.ToString() + " Blog.";
                string fechaActual = DateTime.Now.ToString();

                using (StreamWriter streamWriter = new StreamWriter($"{Server.MapPath(".")}/logs.txt", true))
                {
                    streamWriter.WriteLine("-Creacion Blog-");
                    streamWriter.WriteLine("Fecha: " + fechaActual);
                    streamWriter.WriteLine("ID Autor: " + DropDownListAutorApellido.SelectedValue.ToString());
                    streamWriter.WriteLine("Texto: " + TextBoxCuerpo.Text);
                    streamWriter.WriteLine(" ");


                }
                TextBoxCuerpo.Text = string.Empty;
            }
            else
            {
                LabelMsg.Text = "Complete el cuerpo antes de crear el Blog.";
            }
            
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            LabelMsg.Text = "Se ha eliminado 1 Blog.";
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            LabelMsg.Text = "Se ha modificado 1 Blog.";
        }

        protected void ButtonFiltrar_Click(object sender, EventArgs e)
        {
            SqlDataSourceBlogsJoinAutores.FilterExpression = "idAutor = " + DropDownListFiltroAutores.SelectedValue;
        }

        protected void ButtonBF_Click(object sender, EventArgs e)
        {
            SqlDataSourceBlogsJoinAutores.FilterExpression = string.Empty;
            SqlDataSourceBlogsJoinAutores.FilterParameters.Clear();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string idBlog = e.Keys["id"].ToString();
            string texto = e.Values["texto"].ToString();
            string idAutor = e.Values["idAutor"].ToString();
            string fechaActual = DateTime.Now.ToString();

            using (StreamWriter streamWriter = new StreamWriter($"{Server.MapPath(".")}/logs.txt", true))
            {
                streamWriter.WriteLine("-Eliminación Blog-");
                streamWriter.WriteLine("Fecha: " + fechaActual);
                streamWriter.WriteLine("ID Blog: " + idBlog);
                streamWriter.WriteLine("Texto: " + texto);
                streamWriter.WriteLine("ID Autor: " + idAutor);
                streamWriter.WriteLine(" ");

            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string idBlog = e.Keys["id"].ToString();
            string textoAntiguo = e.OldValues["texto"].ToString();
            string textoNuevo = e.NewValues["texto"].ToString();
            string idAutorAntiguo = e.OldValues["idAutor"].ToString();
            string idAutorNuevo = e.NewValues["idAutor"].ToString();
            string fechaActual = DateTime.Now.ToString();

            using (StreamWriter streamWriter = new StreamWriter($"{Server.MapPath(".")}/logs.txt", true))
            {
                streamWriter.WriteLine("-Modificación Blog-");
                streamWriter.WriteLine("Fecha: " + fechaActual);
                streamWriter.WriteLine("ID Blog: " + idBlog);
                streamWriter.WriteLine("Texto Antiguo: " + textoAntiguo);
                streamWriter.WriteLine("Texto Nuevo: " + textoNuevo);
                streamWriter.WriteLine("ID Autor Antiguo: " + idAutorAntiguo);
                streamWriter.WriteLine("ID Autor Nuevo: " + idAutorNuevo);
                streamWriter.WriteLine(" ");

            }
        }
    }
}