<%-- 
    Document   : updateDriver
    Created on : Apr 3, 2020, 9:10:31 PM
    Author     : samah
--%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Customer Details</title>
    </head>
    <body>
        <%
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");  //load driver 

                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app"); // create connection 

                if (request.getParameter("btn_update") != null) //check button click event not null
                {
                    int hide = Integer.parseInt(request.getParameter("txt_hide")); //it is hidden id get for update record
                        //String id = request.getParameter("id");
                        String name = request.getParameter("name");
                        String address = request.getParameter("address");
                        int phone = Integer.parseInt(request.getParameter("phone"));
                        String gender = request.getParameter("gender");
                        String email = request.getParameter("email");
                        String password = request.getParameter("password");

                    PreparedStatement pstmt = null; //create statement  

                    pstmt = con.prepareStatement("update customers set name=?, address=?, phone=?, gender=?, email=?, password=? where id=?"); //sql update query 
                    //pstmt.setString(1, id);
                    pstmt.setString(1, name);
                    pstmt.setString(2, address);
                    pstmt.setInt(3, phone);
                    pstmt.setString(4, gender);
                    pstmt.setString(5, email);
                    pstmt.setString(6, password);
                    
                    pstmt.setInt(7, hide);
                    pstmt.executeUpdate(); //execute query

                    con.close(); //connection close

                    out.println("Record Updated Successfully...!"); //after update record successfully message
                }

            } catch (Exception e) {
                out.println(e);
            }

        %>
    </body>
</html>
