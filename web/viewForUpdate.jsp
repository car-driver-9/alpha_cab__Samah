<%-- 
    Document   : update
    Created on : Apr 3, 2020, 9:38:16 PM
    Author     : samah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Selected Record For Update</title>
    </head>
    <body>
        <div class="main"> 
            <form method="post" name="myform" action="updateCustomer.jsp">

                <center>
                    <h1>Update Record</h1>
                </center>

                <table> 
                    <%
                        try {
                            Class.forName("org.apache.derby.jdbc.ClientDriver"); //load driver  

                            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app"); // create connection  

                            if (request.getParameter("edit") != null) {
                            int id=Integer.parseInt(request.getParameter("edit"));
                            int phone;
                            String name, address, gender, email, password;

                                PreparedStatement pstmt = null; // create statement

                                pstmt = con.prepareStatement("select * from customers where id=?"); // sql select query
                                pstmt.setInt(1, id);
                                ResultSet rs = pstmt.executeQuery(); // execute query store in resultset object rs.
                                while(rs.next()) 
                                    {
                                     id=rs.getInt(1);
                                     name=rs.getString(2);
                                     address=rs.getString(3);
                                     phone=rs.getInt(4);
                                     gender=rs.getString(5);
                                     email=rs.getString(6);
                                     password=rs.getString(7);

                                   %>
                    

                <tr>
                    <td>Name : </td>
                    <td><input type="text" name="name" value="<%=name %>"/></td>
                </tr>
                <tr>
                    <td>Address : </td>
                    <td><input type="text" name="address" value="<%=address %>"/></td>
                </tr>
                <tr>
                    <td>Phone : </td>
                    <td><input type="number" name="phone" value="<%=phone %>"/></td>
                </tr>
                <tr>
                    <td>Gender : </td>
                    <td><input type="text" name="gender" value="<%=gender %>"/></td>
                </tr>
                <tr>
                    <td>Email : </td>
                    <td><input type="text" name="email" value="<%=email %>"/></td>
                </tr>
                <tr>
                    <td>Password : </td>
                    <td><input type="text" name="password" value="<%=password %>"/></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btn_update" value="Update"></td> 
                </tr>
                <input type="hidden" name="txt_hide" value="<%=id %>">
                
                    <%
                                }
                            }
                        } catch (Exception e) {
                            out.println(e);
                        }
                    %> 
                </table> 

                <center>
                    <h1><a href="viewCustomer.jsp">Back</a></h1>
                </center>

            </form>
        </div>

    </body>
</html>
