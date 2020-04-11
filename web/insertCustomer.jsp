<%-- 
    Document   : insert
    Created on : Mar 19, 2020, 9:34:31 PM
    Author     : samah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<% Class.forName("org.apache.derby.jdbc.ClientDriver");%>
<%
    
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
    String gender = request.getParameter("gender");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app");
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into customers(ID,NAME,ADDRESS,PHONE,GENDER,EMAIL,PASSWORD)values("+ id +",'" + name + "','" + address + "'," + phone + ",'" + gender + "','" + email + "','" + password + "')");
    out.println("Record Inserted Successfully");
%>