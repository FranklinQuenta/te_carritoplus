<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.Producto"%>
<%
    if (session.getAttribute("almacen")==null) {
            ArrayList<Producto> lisaux = new ArrayList<Producto>();
            session.setAttribute("almacen", lisaux);
        }
    ArrayList<Producto> almacen = (ArrayList<Producto>)session.getAttribute("almacen");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Carrito de compras 2</h1>
        <form action="MainServlet" method="post">
            <table>
                <tr>
                    <td>Id</td>
                    <td><input type="text" name="id"></td>
                </tr>
                <tr>
                    <td>Producto</td>
                    <td><input type="text" name="producto"></td>
                </tr>
                <tr>
                    <td>Cantidad</td>
                    <td><input type="text" name="cantidad"></td>
                </tr>
                <tr>
                    <td>Precio</td>
                    <td><input type="text" name="precio"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="procesar"></td>
                </tr>
            </table>
        </form>
        
        <a href="MainServlet?op=vaciar">Vaciar Carrito</a>
        
        <h2>Contenido del carrito</h2>
        <table border="1">
            <tr>
                <td>Id</td>
                <td>Producto</td>
                <td>Precio</td>
                <td>Cantidad</td>
            </tr>
            <%
                if (almacen != null) {
                for (Producto p : almacen) {              
            %>
            <tr>
                <td><%=p.getId() %></td>
                <td><%=p.getProducto() %></td>
                <td><%=p.getCantidad() %></td>
                <td><%=p.getPrecio() %></td>
                <td><a href="MainServlet?op=eliminar&id=<%= p.getId() %>"></a></td>
            </tr>
            <%
                }
                }
            %>
        </table>
    </body>
</html>
