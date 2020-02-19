

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import P1.StudentBean;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public StudentServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			String Name=request.getParameter("Name");
			String Age=request.getParameter("Age");
			String Email=request.getParameter("Email");
			String Phonenumber=request.getParameter("Phonenumber");
			String Dob=request.getParameter("Dob");
			
			StudentBean rb = new StudentBean();
			rb.setName(Name);
			rb.setAge(Age);
			rb.setEmail(Email);
			rb.setPhonenumber(Phonenumber);
			rb.setDob(Dob);
			
			StudentAction ra = new StudentAction();
			boolean status = ra.registerData(rb);
			
			if(status) {
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/StudentSuccess.jsp");
				rd.forward(request,response);
			}else {
				response.sendRedirect("StudentUnsucess.jsp");
			}
			
			}
			
			}

