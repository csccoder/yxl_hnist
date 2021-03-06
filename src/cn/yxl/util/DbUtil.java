package cn.yxl.util;

import com.mysql.jdbc.*;
import com.mysql.jdbc.Driver;
import com.mysql.jdbc.Statement;

import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Created by Administrator on 2017/6/13.
 */
public class DbUtil {
    private static String driver_class;
    private static String url;
    private static String user;
    private static String pwd;

    static {
        driver_class = "com.mysql.jdbc.Driver";
        url = "jdbc:mysql://localhost:3306/yxl";
        user = "root";
        pwd = "root";

        try {
            Class.forName(driver_class);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() {
        try {
            return DriverManager.getConnection(url, user, pwd);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static PreparedStatement getPreparedStatement(Connection connection, String sql) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sql);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return preparedStatement;
    }

    public static PreparedStatement getPreparedStatement(Connection connection, String sql,int autoGeneratedKeys) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sql,autoGeneratedKeys);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return preparedStatement;
    }

    public static void closeAll(Connection connection, PreparedStatement statement, ResultSet resultSet) {
    	closeConnection(connection);
    	closeStatement(statement);
    	closeResultSet(resultSet);
        
    }
    
    public static void closeConnection(Connection connection){
    	if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public static void closeStatement(PreparedStatement statement){
    	 if (statement != null) {
             try {
                 statement.close();
             } catch (SQLException e) {
                 e.printStackTrace();
             }
         }
    }
    
    public static void closeResultSet(ResultSet resultSet){
    	if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


}
