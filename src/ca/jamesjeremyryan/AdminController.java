package ca.jamesjeremyryan;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by james on 2015-12-02.
 */
@WebServlet("/AdminController")
public class AdminController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = null;
        UserBean user = (UserBean)request.getSession().getAttribute("user");

        String postId = request.getParameter("removePost");
        String commentId = request.getParameter("removeComment");

        if (!user.getValid()) {
            dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }

        if (!user.getAdmin()) {
            dispatcher = request.getRequestDispatcher("NotAnAdmin.jsp");
            dispatcher.forward(request, response);
        }

        HttpSession session = request.getSession();


        AdminModel model = new AdminModel();
        if (postId != null) {
            try {
                session.setAttribute("postId", model.removePost(Integer.parseInt(postId)));
                dispatcher = request.getRequestDispatcher("WEB-INF/AdminView.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (commentId != null) {
            try {
                session.setAttribute("commentId", model.removeComment(Integer.parseInt(commentId)));
                dispatcher = request.getRequestDispatcher("WEB-INF/AdminView.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else {
            dispatcher = request.getRequestDispatcher("WEB-INF/AdminView.jsp");
        }
        dispatcher.forward(request, response);
    }
}
