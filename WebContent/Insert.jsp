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

String Name=request.getParameter("name");
String Fathername=request.getParameter("fathername");
String Age=request.getParameter("age");
String Gender=request.getParameter("gender");
String Course=request.getParameter("Course");
String Email=request.getParameter("email");
String Phonenumber=request.getParameter("phonenumber");
//System.out.println(Phonenumber+" "+Name);
int phno=Integer.parseInt(Phonenumber);
//System.out.println(phno);
String Dob=request.getParameter("dob");

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
 String Update=" Insert into newstudent(Name,Fathername,Age,Gender,Course,Email,Phonenumber,Dob)values('"+Name+"','"+Fathername+"','"+Age+"','"+Gender+"','"+Course+"','"+Email+"',"+phno+",'"+Dob+"')";
int i=stmt.executeUpdate(Update);
if(i>0)
	out.println("insertion successful");
else
	out.println("insertion falied.."); 

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