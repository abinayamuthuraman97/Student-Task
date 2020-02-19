import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import P1.StudentBean;

public class StudentAction {
	public boolean registerData(StudentBean rb) {
    boolean status = false;
    
   
    Connection con=null;
    String name=rb.getName();
    String Age=rb.getAge();
    String Email=rb.getEmail();
    String Phonenumber=rb.getPhonenumber();
    String Dob=rb.getDob();
    
    try {
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/task","root","root");
    	Statement st = con.createStatement();
    	ResultSet rs=st.executeQuery("Select * from newstudent where Name ='"+name+"'");
    	if(rs.next()) {
    		status = false;
    	}else {
    		int i=st.executeUpdate("insert into newstudent "+ " values ('"+name+"','"+Age+"','"+Email+"','"+Phonenumber+"','"+Dob+"')");
    		if(i>0) {
    			status=true;
    		}
    	}
    	
    }catch(ClassNotFoundException e) {
    	e.printStackTrace();
    }catch (SQLException e) {
    	e.printStackTrace();
    }
    return status;
}
}