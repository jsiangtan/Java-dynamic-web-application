

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Student;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor. 
	 */
	public Login() {
		// TODO Auto-generated constructor stub
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  

		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();  

		String n=request.getParameter("userid");  
		String p=request.getParameter("userpass");  
		System.out.println(n);
		System.out.println(p);

		if(LoginDao.validate(n, p)){
			RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
			Student student = new Student();
			request.setAttribute("userID", n);
			request.setAttribute("studentList", student.getStudentList());
			rd.forward(request,response);  
		}  
		else{  
			out.print("<script>alert(\"Sorry username or password error\");</script>");  
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
			rd.include(request,response);
		}  

		out.close();  
	}  


}
