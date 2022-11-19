package cn.tjzhic.dao;

import cn.tjzhic.entity.Major;
import cn.tjzhic.entity.Reginfo;

import java.util.ArrayList;
import java.util.HashMap;

public interface ReginfoDao {
    public int add(Reginfo reginfo);

    public Reginfo findByUser(String username);

    public Reginfo findByIdcode(String idcode);

    public ArrayList<Reginfo> findAll();

    public int addCode(String username, String testcardnum);

    public ArrayList<Reginfo> findByIncrease();


    public HashMap<String, Integer> staticByMajor(ArrayList<Major> majors);

    public int update(Reginfo reginfo);

    public int update(String idcode, int confirm);

    public int update(String str, String username);

    public int update(String username, String examroom, int seatnum);


}
