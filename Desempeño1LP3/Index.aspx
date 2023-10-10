<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Desempeño1LP3.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
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
        <div class="text-center mt-5">
            <asp:Button ID="ButtonBlogs" runat="server" OnClick="ButtonBlogs_Click" Text="Blogs" CssClass="btn btn-dark mx-2" />
            <asp:Button ID="ButtonAutores" runat="server" OnClick="ButtonAutores_Click" Text="Autores" CssClass="btn btn-dark mx-2" />
        </div>
    </form>
</body>
</html>
