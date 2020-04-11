<%-- 
    Document   : viewDriver
    Created on : Apr 3, 2020, 3:37:21 PM
    Author     : samah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
try
{ 
 Class.forName("org.apache.derby.jdbc.ClientDriver");  //load driver 
 
 Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app");  //create connection 

 if(request.getParameter("delete")!=null)
 {
  int id=Integer.parseInt(request.getParameter("delete"));
  
  PreparedStatement pstmt=null; //create statement
  
  pstmt=con.prepareStatement("delete from customers where id=? "); //sql delete query
  pstmt.setInt(1,id);
  pstmt.executeUpdate(); //execute query
  
  con.close(); //close connection
 }
}
catch(Exception e)
{
 out.println(e);
}
%>
<html>
    <head>
        <title>View Customers</title>
        <style>
            th {
                background-color: #A9A9A9;

            } 
            table {
                background-color: #DCDCDC;

            }
            table, th, tr, td {
                border: 1px solid black;
                border-collapse: collapse;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <!--<img src='logo.png'  style="width:150px ;height:100px" alt='pic' > </img><br>
           <a href= "facPage.php">
              <img src='homeicon.png' width="40px" height="40px" align="right" alt = 'facPage' ></img></a>-->
    <center>
        <form method="post" name="form">
            <table border="0" cellpadding="10" cellspacing="1" width="1000" class="tblListForm">

                <th>ID</th>
                <th>Name</th>
                <th>Address</th>
                <th>Phone</th>
                <th>Gender</th>
                <th>Email</th>
                <th>Password</th>
                <th width="20%">Action</th>

                <%
                    String customer = "org.apache.derby.jdbc.ClientDriver";
                    int sumcount = 0;
                    Statement st;
                    try {
                        Class.forName(customer).newInstance();
                        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app");
                        String query = "select * from CUSTOMERS";
                        st = con.createStatement();
                        ResultSet rs = st.executeQuery(query);
                %>
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getInt(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getInt(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><%=rs.getString(7)%></td>
                    <td><a href="viewForUpdate.jsp?edit=<%=rs.getInt(1)%> ">Update</a>||<a href="?delete=<%=rs.getInt(1)%>">Delete</a></td>
                </tr>
                <%
                    }
                %>
                <%
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
                <center>
                    <h1><a href="index.jsp">Back</a></h1>
                </center>
            </table>
        </form>
    </center>
</div>
</body>
</html>
