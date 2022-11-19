package cn.tjzhic.dao;

import cn.tjzhic.entity.Course;

import java.util.ArrayList;

public interface CourseDao {
    public int add(Course course);

    public int deleteByCcode(String ccode);

    public ArrayList<Course> findAll();

    public ArrayList<Course> findByCmname(String cmname);

    public Course findByCcode(String ccode);

    public String findCcode(String cname);
}
