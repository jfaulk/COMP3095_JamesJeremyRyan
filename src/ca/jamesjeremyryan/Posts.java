package ca.jamesjeremyryan;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/***********************************************************************************************************************
 * Project: COMP 3095 Message Board
 * Assignment: Assignment 2
 * Author(s): James Faulk
 * Student Number: 100908684
 * Date: 16 October 2015
 * Description: This Posts servlet is not doing anything at the moment.
 **********************************************************************************************************************/

@WebServlet("/Posts")
public class Posts extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("postTitle");
        String content = request.getParameter("postContent");
        UserBean user = (UserBean)request.getSession().getAttribute("user");

        try {
            if (DatabaseHelper.newPost(title, content, user.getUserId())) {
                response.sendRedirect("posts.jsp");
            }
            else {
                response.sendRedirect("newpost.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
