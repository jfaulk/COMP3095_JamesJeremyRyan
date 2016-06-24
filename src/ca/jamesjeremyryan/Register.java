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
 * Description: The Register servlet handles new user registration and form validation. At a later date the validation
 *              method should be extracted into a new class for reuse. Error handling is done by setting an error
 *              message in the request session and redirecting back to registration.jsp
 **********************************************************************************************************************/

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = -1789658498281345986L;
	private static final String ALPHABET = "alphabet";
    private static final String NUMERIC = "numeric";
    private static final String EMAIL = "email";
    private static final String PASSWORD = "password";
    private static final String ERROR = "<span class=\"glyphicon glyphicon-remove form-control-feedback\" aria-hidden=\"true\"></span>";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String emailVerify = request.getParameter("emailVerify");
        String telephone = request.getParameter("telephone");
        String password = request.getParameter("password");
        String passwordVerify = request.getParameter("passwordVerify");

        UserBean user = new UserBean();


        HttpSession session = request.getSession();

        Boolean formValid = true;

        // TODO: I feel like there's an easier and cleaner way to do this but I'm running out of time.
        synchronized (session) {
            if (isValid(firstName, ALPHABET)) {
                session.setAttribute("firstName", firstName);
            } else {
                formValid = false;
                request.getSession().setAttribute("errorMessage", "Error");
            }
            if (isValid(lastName, ALPHABET)) {
                session.setAttribute("lastName", lastName);
            } else {
                formValid = false;
                request.getSession().setAttribute("errorMessage", ERROR);
            }
            if (isValid(email, EMAIL) && isValid(emailVerify, EMAIL)) {
                if (email.equals(emailVerify)) {
                    session.setAttribute("email", email);
                } else {
                    formValid = false;
                    request.getSession().setAttribute("errorMessage", ERROR);
                }
            } else {
                formValid = false;
                request.getSession().setAttribute("errorMessage", ERROR);
            }
            if (isValid(telephone, NUMERIC)) {
                session.setAttribute("telephone", telephone);
            } else {
                formValid = false;
                request.getSession().setAttribute("errorMessage", ERROR);
            }
            if (!password.equals(passwordVerify)) {
                formValid = false;
            }
        }
        if (formValid) {
            DatabaseHelper.newUser(firstName, lastName, email, telephone, password);
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("register.jsp");
        }
    }

    // TODO: Refactor this into multiple methods in a new class.
    protected Boolean isValid(String parameter, String validator) {
        switch (validator) {
            case ALPHABET:
                if (parameter == null || parameter.isEmpty()) {
                    return false;
                } else if (parameter.matches("[a-zA-Z]+")) { // Check if parameter is only alphabets
                    return true;
                }
                break;
            case EMAIL:
                if (parameter == null || parameter.isEmpty()) {
                    return false;
                } else if (parameter.matches(".+@.+")) { // Check if parameter is in format 'anything@anything.anything'
                    return true;
                }
                break;
            case NUMERIC:
                if (parameter == null || parameter.isEmpty()) {
                    return false;
                } else if (parameter.matches("^[0-9]*$")) { // Check if parameter is numbers only
                    return true;
                }
                break;
        }
        return true;
    }
}
