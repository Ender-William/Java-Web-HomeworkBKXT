package cn.tjzhic.listener;

import cn.tjzhic.dao.CourseDao;
import cn.tjzhic.dao.MajorDao;
import cn.tjzhic.dao.SchoolDao;
import cn.tjzhic.dao.StageDao;
import cn.tjzhic.dao.CurrstageDao;
import cn.tjzhic.dao.impl.CourseDaoImpl;
import cn.tjzhic.dao.impl.MajorDaoImpl;
import cn.tjzhic.dao.impl.SchoolDaoImpl;
import cn.tjzhic.dao.impl.StageDaoImpl;
import cn.tjzhic.dao.impl.CurrstageDaoImpl;
import cn.tjzhic.entity.Course;
import cn.tjzhic.entity.Major;
import cn.tjzhic.entity.School;
import cn.tjzhic.entity.Stage;
import cn.tjzhic.entity.Currstage;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.ArrayList;

public class MyServletContextListener implements ServletContextListener {
    public void contextInitialized(ServletContextEvent sce) {
        SchoolDao schoolDao = new SchoolDaoImpl();
        MajorDao majorDao = new MajorDaoImpl();
        CourseDao courseDao = new CourseDaoImpl();
        StageDao stageDao = new StageDaoImpl();
        CurrstageDao currstageDao = new CurrstageDaoImpl();
        School school = schoolDao.getSchool();
        ArrayList<Major> majors = majorDao.findAll();
        ArrayList<Course> courses = courseDao.findAll();
        ArrayList<Stage> stages = stageDao.findAll();
        Currstage currstage = currstageDao.findCurrent();
        sce.getServletContext().setAttribute("school", school);
        sce.getServletContext().setAttribute("majors", majors);
        sce.getServletContext().setAttribute("courses", courses);
        sce.getServletContext().setAttribute("stages", stages);
        sce.getServletContext().setAttribute("currstage", currstage);
    }

    public void contextDestroyed(ServletContextEvent sce) {
        sce.getServletContext().removeAttribute("school");
        sce.getServletContext().removeAttribute("majors");
        sce.getServletContext().removeAttribute("courses");
        sce.getServletContext().removeAttribute("stages");
        sce.getServletContext().removeAttribute("currstage");
    }
}
