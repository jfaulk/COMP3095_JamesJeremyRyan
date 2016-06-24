package ca.jamesjeremyryan;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by james on 2015-12-03.
 */
public class AdminModel {
    protected Boolean removePost(Integer postId) throws SQLException {
        final String SQL_DELETE_POST = "DELETE FROM posts WHERE post_id = ?";

        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = ConnectionManager.getConnection();
            statement = connection.prepareStatement(SQL_DELETE_POST);
            statement.setInt(1, postId);
            statement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return false;
    }

    protected Boolean removeComment(Integer commentId) throws SQLException {
        final String SQL_DELETE_COMMENT = "DELETE FROM comments WHERE comment_id = ?";

        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = ConnectionManager.getConnection();
            statement = connection.prepareStatement(SQL_DELETE_COMMENT);
            statement.setInt(1, commentId);
            statement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return false;
    }
}
