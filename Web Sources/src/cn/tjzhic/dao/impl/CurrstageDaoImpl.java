package cn.tjzhic.dao.impl;

import cn.tjzhic.dao.CurrstageDao;
import cn.tjzhic.db.ConnectionFactory;
import cn.tjzhic.entity.Currstage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CurrstageDaoImpl implements CurrstageDao {

    @Override
    public int set(String adminname, String currstage) {
        int rows = 0;
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement pre = null;
        try {
            String sql = "insert into currstage(adminname,settime,stagename) values(?,NOW(),?)";
            pre = con.prepareStatement(sql);
            pre.setString(1, adminname);
            pre.setString(2, currstage);
            rows = pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pre != null)
                    pre.close();
                if (con != null)
                    con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return rows;
    }

    @Override
    public Currstage findCurrent() {
        Currstage currstage = null;
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement pre = null;
        ResultSet rs = null;
        try {
            pre = con.prepareStatement("select adminname,settime,stagename from currstage order by configid desc limit 1");
            rs = pre.executeQuery();
            while (rs.next()) {
                currstage = new Currstage();
                currstage.setAdminname(rs.getString(1));
                currstage.setSettime(rs.getString(2));
                currstage.setStagename(rs.getString(3));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (pre != null)
                    pre.close();
                if (con != null)
                    con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return currstage;
    }

}
