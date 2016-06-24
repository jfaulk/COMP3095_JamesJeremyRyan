package ca.jamesjeremyryan;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by james on 2015-12-02.
 */
@WebServlet("/Comment")
public class Comment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String comment = request.getParameter("commentContent");
        UserBean user = (UserBean)request.getSession().getAttribute("user");
        Integer postId = Integer.parseInt(request.getParameter("postId"));
        if (!user.getValid()) {
            response.sendRedirect("login.jsp");
        }
        else if (DatabaseHelper.newComment(comment, postId, user.getUserId())) {
            response.sendRedirect("posts.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
