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
<a href="Reg.html">Back</a>

<%
String Id=request.getParameter("Id");
int studId=Integer.parseInt(Id);
 
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

<% 
try{
	
	Connection conn=DriverManager.getConnection(url,username,password);
	Statement stmt=conn.createStatement();
	 String Update=" Delete from newstudent where Id="+studId+"";
	 int i=stmt.executeUpdate(Update);
	if(i>0)
		out.println("Deletion successful");
	else
		out.println("Deletion falied.."); 

	%>
	<%

}
catch (Exception e) {
    e.printStackTrace();
    out.println(e);
}
%>

</body>
</html>