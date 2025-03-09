package Osanda;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uname = request.getParameter("username");
		String upass = request.getParameter("password");
		
		try {
		    List<Admin> adminDetails = AdminDBUtil.validate(uname, upass);

		    if (!adminDetails.isEmpty()) {
		        request.setAttribute("adminDetails", adminDetails);
		        RequestDispatcher dis = request.getRequestDispatcher("AdminAccount.jsp");
		        dis.forward(request, response);
		    } else {
		        response.sendRedirect("login.jsp?error=invalid"); // Redirect to login if no admin found
		    }
		} catch(Exception e) {
		    e.printStackTrace();
		}

		
		RequestDispatcher dis = request.getRequestDispatcher("AdminAccount.jsp");
		dis.forward(request, response);
	}

}
