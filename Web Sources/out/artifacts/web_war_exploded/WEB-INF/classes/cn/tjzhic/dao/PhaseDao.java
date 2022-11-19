package cn.tjzhic.dao;

import cn.tjzhic.entity.Phase;

import java.util.ArrayList;

public interface PhaseDao {

    // 查找所有阶段
    public ArrayList<Phase> findAll();

    // 查找当前阶段
    public Phase findCurrentPhase();

    // 设置当前阶段
    public boolean setCurrentPhase(int number);

}
