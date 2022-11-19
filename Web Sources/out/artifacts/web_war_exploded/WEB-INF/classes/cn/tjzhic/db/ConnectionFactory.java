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

    /**
     * 通过web.xml的JNDIname参数配置创建连接
     *
     * @return
     */
//    public static Connection getConnection() {
//        try {
//            String JNDIname = (String) new InitialContext().lookup("java:comp/env/jdbc/bmxt");
//            return ConnectionFactory.getConnection(JNDIname);
//        } catch (NamingException e) {
//            System.out.print("数据库未启动或连接池未配置！");
//        }
//        return null;
//    }
    public static Connection getConnection() {

//        String JNDIname = new javax.naming.InitialContext().lookup("java:comp/env/jdbc/bmxt");
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
            System.out.println("");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return conn;
    }
}