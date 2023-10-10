<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionBlog.aspx.cs" Inherits="Desempeño1LP3.GestionBlog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Blogs</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="Index.aspx">Desmpeño 1 - LP3 - Mateo Duarte Jaureguiberry</a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="Index.aspx">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="GestionBlog.aspx">Blog</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="GestionBlogAutores.aspx">Autores</a>
                    </li>

                </ul>
            </div>
        </div>

    </nav>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="text-center mb-4">Gestion de Blogs</h2>
            <div class="card p-4 " style="width: 60%; margin: auto;">
                <h3 class="text-center mb-4">Crear Blog</h3>
                <asp:Label ID="LabelMsg" runat="server" CssClass="text-info"></asp:Label>
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Elegir Autor: " CssClass="font-weight-bold"></asp:Label>
                    <asp:DropDownList ID="DropDownListAutorApellido" runat="server" DataSourceID="SqlDataSourceBlogAutores" DataTextField="id" DataValueField="id" ToolTip="Autor (seleccionar Id en base a la tabla de autores existentes)" CssClass="form-control"></asp:DropDownList>
                </div>

                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSourceBlogAutores" GridLines="Horizontal" CssClass="table">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                        <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>

                <div class="form-group mt-3">
                    <asp:TextBox ID="TextBoxCuerpo" runat="server" TextMode="MultiLine" Rows="8" placeholder="Ingrese cuerpo del Blog..." ToolTip="Ingresar Cuerpo del Blog" Width="100%" CssClass="form-control"></asp:TextBox>
                </div>


                <asp:Button ID="ButtonCB" runat="server" OnClick="ButtonCB_Click" Text="Crear" CssClass="btn btn-dark" />

            </div>


            <br />
            <br />

            <h3 class="text-center mb-4">Blogs</h3>
            <div class="text-center">
                <asp:Label ID="Label2" runat="server" Text="Filtrar por Id Autor: "></asp:Label>
                <asp:DropDownList ID="DropDownListFiltroAutores" runat="server" DataSourceID="SqlDataSourceBlogAutores" DataTextField="id" DataValueField="id" ToolTip="Vea el Id del autor en la tabla de abajo">
                </asp:DropDownList>
                <asp:Button ID="ButtonFiltrar" runat="server" OnClick="ButtonFiltrar_Click" Text="Filtrar" CssClass="btn btn-primary" />
                <asp:Button ID="ButtonBF" runat="server" OnClick="ButtonBF_Click" Text="Borrar Filtros" CssClass="btn btn-secondary" />
            </div>
            <br />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSourceBlogsJoinAutores" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleted="GridView1_RowDeleted" OnRowUpdated="GridView1_RowUpdated" Width="100%" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="texto" HeaderText="Texto" SortExpression="texto" />
                    <asp:BoundField DataField="idAutor" HeaderText="Id Autor" SortExpression="idAutor" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" ReadOnly="True" />
                    <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" ReadOnly="True" />
                    <asp:CommandField ButtonType="Image" CancelImageUrl="~/icons/cancel.png" DeleteImageUrl="~/icons/delete.png" EditImageUrl="~/icons/edit.jpg" ShowDeleteButton="True" ShowEditButton="True" UpdateImageUrl="~/icons/accept.jpg" ControlStyle-Width="25" HeaderText="Acciones">
                        <ControlStyle Width="25px"></ControlStyle>
                    </asp:CommandField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceBlogsJoinAutores" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" DeleteCommand="DELETE FROM [Blogs] WHERE [id] = @id" InsertCommand="INSERT INTO [Blogs] ([texto], [idAutor]) VALUES (@texto, @idAutor)" SelectCommand="SELECT Blogs.id, Blogs.texto, Blogs.idAutor, BlogAutores.nombre, BlogAutores.apellido FROM Blogs INNER JOIN BlogAutores ON Blogs.idAutor = BlogAutores.id" UpdateCommand="UPDATE [Blogs] SET [texto] = @texto, [idAutor] = @idAutor WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBoxCuerpo" Name="texto" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="DropDownListAutorApellido" Name="idAutor" PropertyName="SelectedValue" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="texto" Type="String" />
                    <asp:Parameter Name="idAutor" Type="Int32" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceBlogAutores" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" SelectCommand="SELECT * FROM [BlogAutores]"></asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
