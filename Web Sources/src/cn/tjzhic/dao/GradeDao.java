package cn.tjzhic.dao;

import cn.tjzhic.entity.SupGrade;

import java.util.ArrayList;

public interface GradeDao {
    public int gradeAdd(SupGrade supgrade);

    public ArrayList<SupGrade> findByCardnum(String testcardnum);
}
