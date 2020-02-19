<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <form>
               
        <h2 align=center >StudentDetails</h2>
       <table align="center" class="table">
        <%
            String driverName = "com.mysql.cj.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/task";
            String userId = "root";
            String password = "root";
            try{
            	Class.forName(driverName);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            Connection con;
            Statement statement;
            ResultSet rs;
        %>
        
         <tr>
            
                <td><b>name</b></td></br>
                <td><b>age</b></td></br>
                <td><b>email</b></td></br>
                <td><b>phonenumber</b></td></br>
                <td><b>dob</b></td></br>
            </tr>
            
             <%
                try {
                    con = DriverManager.getConnection(connectionUrl, userId, password);
                    statement  = con.createStatement();
                    String sql = "Select * from newstudent ";
                    rs = statement.executeQuery(sql);
                    while (rs.next()) {
            %>  
            <tr>
               
            
                <td><%out.println(rs.getString("Name")); %></td>
                <td><%out.println(rs.getString("Age"));%></td>
                <td><%out.println(rs.getString("Email"));%></td>
                <td><%out.println(rs.getString("Phonenumber")); %></td>
                <td><%out.println(rs.getString("Dob")); %></td>
                
                   
             </tr>
             <%
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println(e);
                    }
                
            %>
        </table>
    </form>
   
</body>
            