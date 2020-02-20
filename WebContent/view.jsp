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
<center><h1>STUDENT DATABASE</h1></center>
<%
String drivername="com.mysql.cj.jdbc.Driver";
String url="jdbc:mysql://localhost:3306/task";
String username="root";
String password="root";
try
{
	Class.forName(drivername);
}
catch(ClassNotFoundException e)
{
	e.printStackTrace();
}
%>
<form><center>
<table border="2">

<tr>
<td>ID</td>
<td>NAME</td>
<td>FATHERNAME</td>
<td>AGE</td>
<td>GENDER</td>
<td>COURSE</td>
<td>EMAIL</td>
<td>PHONENUMBER</td>
<td>DOB</td>
<td>ACTION</td>

</center>
</tr>

<% 
try{


Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
String query="select * from newstudent;";
ResultSet rs=stmt.executeQuery(query);

while(rs.next())
{

%>
<tr>
<td><%=rs.getInt("Id") %></td>
<td><%=rs.getString("Name") %></td>
<td><%=rs.getString("Fathername") %></td>
<td><%=rs.getInt("Age") %></td>
<td><%=rs.getString("Gender") %></td>
<td><%=rs.getString("Course") %></td>
<td><%=rs.getString("Email") %></td>
<td><%=rs.getString("Phonenumber") %></td>
<td><%=rs.getString("Dob") %></td>
<!--  <td><a href="Update.jsp?id=<%=rs.getInt("Id")%>">update</a></td>-->
<td><a href="Update.html">update</a></td>
<br>
<td><a href="Delete.jsp?id=<%=rs.getInt("Id")%>">Delete</a></td>
</tr>
<%
}
}
catch (Exception e) {
    e.printStackTrace();
    out.println(e);
}

%>
</table>
</center>
</form>
 <center><button onclick="navigate()">Back</button>
    <script>
    function navigate() {
    location.replace("Reg.html")
	}
	</script>
</body>
</html>