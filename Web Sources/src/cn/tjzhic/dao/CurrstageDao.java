package cn.tjzhic.dao;

import cn.tjzhic.entity.Currstage;


public interface CurrstageDao {
    public int set(String adminname, String currstage);

    public Currstage findCurrent();
}
