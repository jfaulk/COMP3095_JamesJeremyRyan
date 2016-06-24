package ca.jamesjeremyryan;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/***********************************************************************************************************************
 * Project: COMP 3095 Message Board
 * Assignment: Assignment 2
 * Author(s): James Faulk
 * Student Number: 100908684
 * Date: 16 October 2015
 * Description: The Login servlet handles user login by sending the request to the DatabaseHelper which returns true or
 *              false. If DatabaseHelper.login() returns true then an email session variable is created and the user is
 *              redirected to index.jsp.
 **********************************************************************************************************************/

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 6329219932148198280L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("remember-me");

        HttpSession session = request.getSession();
        UserBean user = DatabaseHelper.login(email, password);
        if (user.getValid()) {
            synchronized (session) {
                request.getSession().setAttribute("user", user);
            }
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
