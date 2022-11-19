package cn.tjzhic.dao.impl;

import cn.tjzhic.dao.PhaseDao;
import cn.tjzhic.entity.Phase;
import cn.tjzhic.util.DBUtil;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class PhaseDaoImpl implements PhaseDao {

    public ArrayList<Phase> findAll() {
        return DBUtil.queryForList(Phase.class, "select * from phase order by number asc");
    }

    public Phase findCurrentPhase() {
        return DBUtil.queryOne(Phase.class, "select * from phase where current=1");
    }

    public boolean setCurrentPhase(int number) {  // 两条更新语句，需要使用事务
        boolean result = false;
        // 使用事务
        Connection conn = null;
        try {
            conn = DBUtil.getConnection();
            conn.setAutoCommit(false); // 设置不自动提交
            DBUtil.updateBySql(conn, "update phase set current=0 where current=1");
            DBUtil.updateBySql(conn, "update phase set current=1 where number=?", number);
            conn.commit(); // 提交
            result = true;
        } catch (SQLException e) {
            try {
                conn.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            DBUtil.release(conn);
        }
        System.out.println(result);
        return result;
    }
}
