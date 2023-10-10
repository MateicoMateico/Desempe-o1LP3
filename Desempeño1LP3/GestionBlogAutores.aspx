<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionBlogAutores.aspx.cs" Inherits="Desempeño1LP3.GestionBlogAutores" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Autores</title>
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
            <h2 class="text-center mb-4">Gestion de Autores</h2>
            <div class="card p-4 " style="text-align: center; width: 60%; margin: auto;">
                <h3 class="text-center mb-4">Crear Autor</h3>
                <asp:Label ID="LabelMsg" runat="server" CssClass="text-info"></asp:Label>
                <br />
                <div class="form-group">
                    <asp:TextBox ID="TextBoxNombreAutor" runat="server" placeholder="Ingrese nombre..." ToolTip="Nombre"></asp:TextBox>
                    <asp:TextBox ID="TextBoxApellidoAutor" runat="server" placeholder="Ingrese apellido..." ToolTip="Apellido"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="ButtonCA" runat="server" Text="Crear" OnClick="ButtonCA_Click" CssClass="btn btn-dark" />

                </div>
            </div>

            <br />
            <br />
            <h3 class="text-center mb-4">Autores</h3>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Style="margin-top: 0px" OnRowDeleted="GridView1_RowDeleted" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowUpdated="GridView1_RowUpdated" OnRowDeleting="GridView1_RowDeleting" Width="100%" OnRowUpdating="GridView1_RowUpdating">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                    <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/icons/delete.png" EditImageUrl="~/icons/edit.jpg" ShowDeleteButton="True" ShowEditButton="True" ControlStyle-Width="25" CancelImageUrl="~/icons/cancel.png" UpdateImageUrl="~/icons/accept.jpg" HeaderText="Acciones">
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" DeleteCommand="DELETE FROM [BlogAutores] WHERE [id] = @id" InsertCommand="INSERT INTO [BlogAutores] ([apellido], [nombre]) VALUES (@apellido, @nombre)" SelectCommand="SELECT * FROM [BlogAutores]" UpdateCommand="UPDATE [BlogAutores] SET [apellido] = @apellido, [nombre] = @nombre WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBoxNombreAutor" Name="nombre" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBoxApellidoAutor" Name="apellido" PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="apellido" Type="String" />
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</body>

</html>

