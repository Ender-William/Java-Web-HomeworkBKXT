package cn.tjzhic.util;

import cn.tjzhic.entity.Site;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class DBUtil {

    //private DBUtil() {}

    // 获取数据库连接对象
    public static Connection getConnection() throws SQLException {
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
            e.printStackTrace();
        }
        return conn;
    }

//    // @Test 需要添加JUnit包
//    @Test
//    public void test() throws SQLException {
//        System.out.println(getConnection());
//    }

    // 封装释放资源的代码，关闭连接
    public static void release(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // 封装释放资源的代码，关闭Statement
    public static void release(Statement stmt) {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // 封装释放资源的代码，关闭ResultSet
    public static void release(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // 封装释放资源的代码，关闭连接、statement和resultset
    public static void release(Connection conn, Statement stmt, ResultSet rs) {
        release(rs);
        release(stmt);
        release(conn);
    }

    // 封装释放资源的代码，关闭连接和statement
    public static void release(Connection conn, Statement stmt) {
        release(conn);
        release(stmt);
    }


    // 测试讲解查询数据库的流程
    @Test
    public void test() throws SQLException {

        // 1.获取数据库连接对象Connection   ：  java.sql.Connection
        Connection connection = getConnection();

        // 2.获取PreparedStatement对象，执行sql的对象
        // (1)传sql语句，如果语句有参数，使用？占位符
        // (2)sql语句中的参数，需要set一下
        PreparedStatement ps = connection.prepareStatement("select * from site");
        //ps.setInt(1, 2);

        // 3.执行SQL语句，获得结果，查询语句获得到一个ResultSet的对象，更新语句返回一个整数（影响的行数）
        ResultSet rs = ps.executeQuery();

        // 4.循环读结果
        while (rs.next()) {
            Site site = new Site();

            site.setId(rs.getInt(1));
            site.setCompany(rs.getString("company"));
            site.setName(rs.getString("name"));
            site.setLocation(rs.getString("location"));
            site.setZipcode(rs.getString("zipcode"));
            site.setContact(rs.getString("contact"));
            site.setCopy(rs.getString("copy"));

            System.out.println(site);
        }
    }


    // 泛型方法，封装对所有表的通用的查询操作，查询一条记录，返回对应的实体类对象
    public static <T> T queryOne(Class<T> clazz, String sql, Object... sqlParas) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            System.out.println(sqlParas);
            for (int i = 0; i < sqlParas.length; i++) {
                ps.setObject(i + 1, sqlParas[i]);  // 注意Jdbc中的索引都是从1开始，数组的索引是从0开始
            }
            rs = ps.executeQuery();
            if (rs.next()) {
                @SuppressWarnings("deprecation")
                T entity = clazz.newInstance();
                ResultSetMetaData rsMetaData = rs.getMetaData();
                int columnCount = rsMetaData.getColumnCount();
                for (int i = 0; i < columnCount; i++) {
                    String columnLabel = rsMetaData.getColumnLabel(i + 1);
                    Object columnValue = rs.getObject(i + 1);
                    Field field = clazz.getDeclaredField(columnLabel);
                    field.setAccessible(true);
                    field.set(entity, columnValue);
                }
                return entity;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            release(conn, ps, rs);
        }
        return null;
    }


    // 封装通用的查询操作，查询一条记录，返回结果记录对应的Map
    public static Map<String, Object> queryOneMap(String sql, Object... sqlParas) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            for (int i = 0; i < sqlParas.length; i++) {
                ps.setObject(i + 1, sqlParas[i]);  // 注意Jdbc中的索引都是从1开始，数组的索引是从0开始
            }
            rs = ps.executeQuery();
            if (rs.next()) {
                Map<String, Object> mapResult = new HashMap<>();
                ResultSetMetaData rsMetaData = rs.getMetaData();
                int columnCount = rsMetaData.getColumnCount();
                for (int i = 0; i < columnCount; i++) {
                    String columnLabel = rsMetaData.getColumnLabel(i + 1);
                    Object columnValue = rs.getObject(i + 1);
                    mapResult.put(columnLabel, columnValue);

                }
                return mapResult;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            release(conn, ps, rs);
        }
        return null;
    }


    // 泛型方法，封装对所有表的通用的查询操作，查询多条记录，返回对应的实体类对象列表集合
    public static <T> ArrayList<T> queryForList(Class<T> clazz, String sql, Object... sqlParas) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            for (int i = 0; i < sqlParas.length; i++) {
                ps.setObject(i + 1, sqlParas[i]);
            }
            rs = ps.executeQuery();
            ArrayList<T> entityList = new ArrayList<T>();
            ResultSetMetaData rsMetaData = rs.getMetaData();
            int columnCount = rsMetaData.getColumnCount();
            while (rs.next()) {
                @SuppressWarnings("deprecation")
                T entity = clazz.newInstance();
                for (int i = 0; i < columnCount; i++) {
                    String columnLabel = rsMetaData.getColumnLabel(i + 1);
                    Object columnValue = rs.getObject(i + 1);
                    Field field = clazz.getDeclaredField(columnLabel);
                    field.setAccessible(true);
                    field.set(entity, columnValue);
                }
                entityList.add(entity);
            }
            System.out.println(entityList);
            return entityList;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            release(conn, ps, rs);
        }
        return null;
    }


    // 封装通用的查询操作，将查询得到的每条记录封装为一个Map，然后返回由这些Map构成的ArrayList
    public static ArrayList<Map<String, Object>> queryForMapList(String sql, Object... sqlParas) {
        ArrayList<Map<String, Object>> mapResultList = new ArrayList<Map<String, Object>>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            for (int i = 0; i < sqlParas.length; i++) {
                ps.setObject(i + 1, sqlParas[i]);  // 注意Jdbc中的索引都是从1开始，数组的索引是从0开始
            }
            rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, Object> mapResult = new HashMap<>();
                ResultSetMetaData rsMetaData = rs.getMetaData();
                int columnCount = rsMetaData.getColumnCount();
                for (int i = 0; i < columnCount; i++) {
                    String columnLabel = rsMetaData.getColumnLabel(i + 1);
                    Object columnValue = rs.getObject(i + 1);
                    mapResult.put(columnLabel, columnValue);
                }
                mapResultList.add(mapResult);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            release(conn, ps, rs);
        }
        return mapResultList;
    }


    // 根据sql语句执行，执行完后不关闭数据库连接
    public static int updateBySql(Connection conn, String sql, Object... paras) {
        int row = 0;
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(sql);
            for (int i = 0; i < paras.length; i++) {
                ps.setObject(i + 1, paras[i]);
            }
            row = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            release(ps);
        }
        return row;
    }


    // 根据sql语句执行，执行完后关闭数据库连接
    public static int updateBySQL(String sql, Object... sqlParas) {
        int count = 0;
        Connection conn = null;
        try {
            conn = getConnection();
            count = update(conn, sql, sqlParas);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            release(conn);
        }
        return count;
    }

    //数据库更新
    public static int update(Connection conn, String sql, Object[] sqlParas) {
        int row = 0;
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(sql);
            for (int i = 0; i < sqlParas.length; i++) {
                ps.setObject(i + 1, sqlParas[i]);
            }
            row = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            release(ps);
        }
        return row;
    }


    // 根据实体类型获取对应的数据库表名
    public static String getTableName(Class<?> entityClass) {
        return entityClass.getSimpleName().toLowerCase();
    }

    // 泛型方法更新实体，给定实体类型、要更新的记录id以及更新的字段fieldMap
    public static <T> int updateEntity(Class<T> entityClass, long id, Map<String, Object> fieldMap) {
        if (fieldMap == null || fieldMap.isEmpty()) {
            return 0;
        }
        if (fieldMap.containsKey("id")) {
            fieldMap.remove("id");
        }
        String sql = "UPDATE " + getTableName(entityClass) + " SET ";
        StringBuilder columns = new StringBuilder();
        for (String fieldName : fieldMap.keySet()) {
            columns.append(fieldName).append("=?, ");
        }
        sql += columns.substring(0, columns.lastIndexOf(", ")) + " WHERE id=?";
        ArrayList<Object> paramList = new ArrayList<Object>();
        paramList.addAll(fieldMap.values());
        paramList.add(id);
        Object[] params = paramList.toArray();
        return updateBySQL(sql, params);
    }


    // 插入实体，根据提供的实体类型以及要插入的对象的域字段Map进行插入操作
    public static <T> int insertEntity(Class<T> entityClass, Map<String, Object> fieldMap) {
        if (fieldMap == null || fieldMap.isEmpty()) {
            return 0;
        }
        String sql = "INSERT INTO " + getTableName(entityClass);
        StringBuilder columns = new StringBuilder(" (");
        StringBuilder values = new StringBuilder(" (");
        for (String fieldName : fieldMap.keySet()) {
            columns.append(fieldName).append(", ");
            values.append("?, ");
        }
        columns.replace(columns.lastIndexOf(", "), columns.length(), ") ");
        values.replace(values.lastIndexOf(","), values.length(), ") ");
        sql += columns + " VALUES " + values;
        Object[] params = fieldMap.values().toArray();
        return updateBySQL(sql, params);
    }

    // 泛型方法，获取给定实体类对象的fieldValueMap
    public static <T> Map<String, Object> getFieldValueMap(T entity) {
        Map<String, Object> fieldValueMap = new HashMap<String, Object>();
        Field[] fields = entity.getClass().getDeclaredFields();
        for (int i = 0; i < fields.length; i++) {
            Field f = fields[i];
            String name = f.getName(); // 属性名
            if (!"serialVersionUID".equalsIgnoreCase(name)) { // 忽略序列化版本ID号
                f.setAccessible(true);// 取消 Java语言访问检查
                try {
                    Object value = f.get(entity); // 反射获取该属性的值
                    fieldValueMap.put(name, value);
                } catch (IllegalArgumentException e) {
                    e.printStackTrace();
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                }
            }
        }
        return fieldValueMap;
    }

    // 插入实体，提供实体对象
    public static <T> int insertEntity(T entity) {
        return insertEntity(entity.getClass(), getFieldValueMap(entity));
    }

    // 泛型方法，执行SQL语句获取一个标量值
    @SuppressWarnings("unchecked")
    public static <E> E getValue(String sql, Object... sqlParas) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            for (int i = 0; i < sqlParas.length; i++) {
                ps.setObject(i + 1, sqlParas[i]);
            }
            rs = ps.executeQuery();
            if (rs.next()) {
                return (E) rs.getObject(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            release(conn, ps, rs);
        }
        return null;
    }


    // 给定sql，查询结果条数
    public static long count(String sql, Object... sqlParas) {
        String countSql = "select count(*) " + sql.toLowerCase().substring(sql.indexOf(" from "));
        Long result = getValue(countSql, sqlParas);
        return result == null ? 0 : result;
    }


    //类DBUtil.java中封装获取指定实体类的总记录条数
    // 查询对应实体类的总记录条数
    public static <T> long count(Class<T> entityClass) {
        Long result = getValue("select count(*) from " + getTableName(entityClass));
        return result == null ? 0 : result;
    }


}

