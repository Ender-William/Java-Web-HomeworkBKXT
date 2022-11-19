package cn.tjzhic.db;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectionFactory {
    private ConnectionFactory() {
    }

    public static Connection getConnection() {

        return ConnectionFactory.getConnection1();

    }

    public static Connection getConnection1() {
        Connection conn = null;
        try {
            InputStream ins = Thread.currentThread().getContextClassLoader().getResourceAsStream("jdbc.properties");
            Properties props = new Properties();
            props.load(ins);
            String driver = props.getProperty("driver");
            String url = props.getProperty("url");
            String user = props.getProperty("user");
            String password = props.getProperty("password");
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);

        } catch (IOException | ClassNotFoundException e) {
            System.out.println("数据库未启动或连接池错误");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return conn;
    }
}





