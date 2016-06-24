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
 * Description: This Home servlet is not doing anything at the moment.
 **********************************************************************************************************************/

@WebServlet("/Home")
public class Home extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
    }
}
