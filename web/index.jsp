<%-- 
    Document   : Home
    Created on : Mar 19, 2020, 8:42:44 PM
    Author     : samah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserting</title>
    </head>
    <script>
        function validate()
 {
  var name = document.myform.txt_name;
  var owner = document.myform.txt_owner;
    
  if (name.value == "")
  {
   window.alert("please enter name ?");
   name.focus();
   return false;
  }
//  if (owner.value == "")
//  {
//   window.alert("please enter owner ?");
//   owner.focus();
//   return false;
//  }
 }
    </script>
    <body>
        <h1>Inserting data to data table</h1>
        <form methood="post" action="insertCustomer.jsp" onsubmit="validate()">
            <table>
                <tr>
                    <td>ID : </td>
                    <td><input type="number" name="id"/></td>
                </tr>
                <tr>
                    <td>Name : </td>
                    <td><input type="text" name="name"/></td>
                </tr>
                <tr>
                    <td>Address : </td>
                    <td><input type="text" name="address"/></td>
                </tr>
                <tr>
                    <td>Phone : </td>
                    <td><input type="number" name="phone"/></td>
                </tr>
                <tr>
                    <td>Gender : </td>
                    <td><input type="text" name="gender"/></td>
                </tr>
                <tr>
                    <td>Email : </td>
                    <td><input type="text" name="email"/></td>
                </tr>
                <tr>
                    <td>Password : </td>
                    <td><input type="text" name="password"/></td>
                </tr>
                <tr>
                <td></td>
                <td><input type="submit" value="submit"/></td>
                </tr>
            </table>
            <table style="background-color: #ffffcc;">
                <tr>
                    <td align="center"><h2>To display all the data from the 
                            table click here...</h2></td>
                </tr>
                <tr>
                    <td align="center"><a href="viewCustomer.jsp">
                            <font size="4" color="blue">show data from table</font>
                        </a></td>
                </tr>
            </table>
        </form>
    </body>
</html>
