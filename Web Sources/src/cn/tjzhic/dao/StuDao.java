package cn.tjzhic.dao;

import cn.tjzhic.entity.Stu;

import java.util.ArrayList;

public interface StuDao {
    public int add(Stu stu);

    public Stu findByUsername(String username);

    public Stu validateLogin(String username, String password);

    public int passModify(String username, String newpass);

    public ArrayList<Stu> findStusLikeUsername(String username);

    public ArrayList<Stu> findStusLikeIdcode(String idcode);
}