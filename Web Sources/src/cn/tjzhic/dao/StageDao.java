package cn.tjzhic.dao;

import cn.tjzhic.entity.Stage;

import java.util.ArrayList;

public interface StageDao {
    public int add(Stage stage);

    public int deleteByStagenum(int stagenum);

    public ArrayList<Stage> findAll();

    public Stage findByStagenum(int stagenum);

}
