package ca.jamesjeremyryan;

import java.sql.*;

/***********************************************************************************************************************
 * Project: COMP 3095 Message Board
 * Assignment: Assignment 2
 * Author(s): James Faulk
 * Student Number: 100908684
 * Date: 16 October 2015
 * Description: Helper class for database functions. I was having trouble accessing the SQLite3 database file path at
 *              runtime so the file is downloaded from a website of mine through the getDatabase() method.
 *              The newUser() and login() methods connect to the SQLite database file and use prepared statements to
 *              submit queries.
 *              I am using the Xerial SQLite JDBC driver from https://github.com/xerial/sqlite-jdbc which is found in
 *              at libs/sqlite-jdbc-3.8.11.2.jar in this project.
 **********************************************************************************************************************/

public class DatabaseHelper {

    protected static Boolean newPost(String title, String content, Integer userId) throws SQLException {
        final String SQL_INSERT_POST = "INSERT INTO posts (post_title, post_content, user_id) VALUES (?, ?, ?)";

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = ConnectionManager.getConnection();
            statement = connection.prepareStatement(SQL_INSERT_POST);
            statement.setString(1, title);
            statement.setString(2, content);
            statement.setInt(3, userId);
            statement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            }
            catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    protected static Boolean newComment(String comment, Integer postId, Integer userId) {
        final String SQL_INSERT_COMMENT = "INSERT INTO comments (comment_content, post_id, user_id) VALUES (?, ?, ?)";

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = ConnectionManager.getConnection();
            statement = connection.prepareStatement(SQL_INSERT_COMMENT);
            statement.setString(1, comment);
            statement.setInt(2, postId);
            statement.setInt(3, userId);
            statement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return false;
        }
    }

    protected static void newUser(String firstName, String lastName, String email, String telephone, String password) {
        final String SQL_INSERT_USER = "INSERT INTO USERS (FIRST_NAME, LAST_NAME, EMAIL, TELEPHONE, PASSWORD) VALUES (?, ?, ?, ?, ?)";

        Connection connection = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mariadb://jamesfaulk.ca:6033/assignment2", "comp3095", "comp3095");
            PreparedStatement statement = connection.prepareStatement(SQL_INSERT_USER);
            statement.setString(1, firstName);
            statement.setString(2, lastName);
            statement.setString(3, email);
            statement.setString(4, telephone);
            statement.setString(5, password);
            statement.executeUpdate();

        } catch (SQLException e) {
            System.err.println(e.getMessage());

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    protected static UserBean login(String email, String password) {
        final String SQL_CHECK_LOGIN = "SELECT * FROM users WHERE email=? AND password=?";

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet result = null;

        UserBean user = new UserBean();

        try {
            connection = ConnectionManager.getConnection();
            statement = connection.prepareStatement(SQL_CHECK_LOGIN);
            statement.setString(1, email);
            statement.setString(2, password);
            result = statement.executeQuery();
            if (result.next()) {
                user.setUserId(result.getInt("user_id"));
                user.setFirstName(result.getString("first_name"));
                user.setLastName(result.getString("last_name"));
                user.setEmail(result.getString("email"));
                user.setTelephone(result.getString("telephone"));
                user.setPassword(result.getString("password"));
                user.setAdmin(result.getBoolean("isAdmin"));
                user.setValid(true); // valid user
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (result != null) {
                    result.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            }
            catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return user; // invalid login
    }
}
