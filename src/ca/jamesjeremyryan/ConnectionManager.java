package ca.jamesjeremyryan;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by james on 2015-11-29.
 */
public class ConnectionManager {

    private static Connection connection = null;
    private static final String jdbcDriver = "org.mariadb.jdbc.Driver";
    private static final String connectionUrl = "jdbc:mariadb://jamesfaulk.ca:6033/assignment2";
    private static final String connectionUser = "comp3095";
    private static final String connectionPass = "comp3095";

    protected static Connection getConnection() {
        try {
            Class.forName(jdbcDriver);
            connection = DriverManager.getConnection(connectionUrl, connectionUser, connectionPass);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
