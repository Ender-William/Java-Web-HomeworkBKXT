package cn.tjzhic.controller;

import cn.tjzhic.dao.CourseDao;
import cn.tjzhic.dao.MajorDao;
import cn.tjzhic.dao.SchoolDao;
import cn.tjzhic.dao.impl.CourseDaoImpl;
import cn.tjzhic.dao.impl.MajorDaoImpl;
import cn.tjzhic.dao.impl.SchoolDaoImpl;
import cn.tjzhic.entity.Course;
import cn.tjzhic.entity.Major;
import cn.tjzhic.entity.School;
import cn.tjzhic.util.Message;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ZAdminRelease", value = "/ZAdminRelease")
public class ZAdminRelease extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    /**
     * Constructor of the object.
     */
    public ZAdminRelease() {
        super();
    }

    /**
     * Destruction of the servlet. <br>
     */
    public void destroy() {
        super.destroy();
    }


    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doPost(request, response);
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=utf-8");
        ServletContext servletContext = request.getServletContext();
        HttpSession session = request.getSession();
        SchoolDao schoolDao = (SchoolDao) new SchoolDaoImpl();
        MajorDao majorDao = new MajorDaoImpl();
        CourseDao courseDao = new CourseDaoImpl();
        String action = request.getParameter("action");
        //添加院校基本信息
        if ("schoolAdd".equals(action)) {
            School school = new School();
            school.setShcode(request.getParameter("shcode"));
            school.setShname(request.getParameter("shname"));
            school.setShaddr(request.getParameter("shaddr"));
            school.setShzip(request.getParameter("shzip"));
            school.setShtel(request.getParameter("shtel"));
            school.setShtest(request.getParameter("shtest"));
            school.setShyear(request.getParameter("shyear"));
            if (schoolDao.add(school) != 0) {
                servletContext.setAttribute("school", school);
                session.setAttribute("mess", new Message("schoolAddMess", "学校基本信息设置成功！"));
            } else {
                session.setAttribute("mess", new Message("schoolAddMess", "学校基本信息设置失败！"));
            }
            response.sendRedirect(servletContext.getContextPath() + "/zadmin/release.jsp");
            //添加新的专业
        } else if ("majorAdd".equals(action)) {
            String mcode = request.getParameter("mcode");
            Major major = new Major();
            major.setMcode(mcode);
            major.setMname(request.getParameter("mname"));
            major.setPlannum(Integer.parseInt(request.getParameter("plannum")));
            if (majorDao.findByMcode(mcode) != null) {
                session.setAttribute("mess", new Message("majorAddMess", "专业代码不能重复！"));
            } else if (majorDao.add(major) != 0) {
                servletContext.setAttribute("majors", majorDao.findAll());
                session.setAttribute("mess", new Message("majorAddMess", "专业添加成功！"));
            } else {
                session.setAttribute("mess", new Message("majorAddMess", "专业添加失败！"));
            }
            response.sendRedirect(servletContext.getContextPath() + "/zadmin/release.jsp#major");
            //删除已有专业
        } else if ("majorDelete".equals(action)) {
            String mcode = request.getParameter("mcode");
            Major major = majorDao.findByMcode(mcode);
            if (major != null && !courseDao.findByCmname(major.getMname()).isEmpty()) {
                session.setAttribute("mess", new Message("majorDeleteMess", "请先删除'" + major.getMname() + "'专业的所有课程！"));
            } else if (majorDao.deleteByMcode(mcode) != 0) {
                servletContext.setAttribute("majors", majorDao.findAll());
                session.setAttribute("mess", new Message("majorDeleteMess", "专业删除成功！"));
            } else {
                session.setAttribute("mess", new Message("majorDeleteMess", "专业删除失败！"));
            }
            response.sendRedirect(servletContext.getContextPath() + "/zadmin/release.jsp#major");
            //添加新的课程
        } else if ("courseAdd".equals(action)) {
            String ccode = request.getParameter("ccode");
            Course course = new Course();
            course.setCcode(ccode);
            course.setCname(request.getParameter("cname"));
            course.setCmname(request.getParameter("cmname"));
            course.setCstarttime(request.getParameter("cstarttime"));
            course.setCendtime(request.getParameter("cendtime"));
            if (courseDao.findByCcode(ccode) != null) {
                session.setAttribute("mess", new Message("courseAddMess", "课程代码不能重复！"));
            } else if (courseDao.add(course) != 0) {
                servletContext.setAttribute("courses", courseDao.findAll());
                session.setAttribute("mess", new Message("courseAddMess", "课程添加成功！"));
            } else {
                session.setAttribute("mess", new Message("courseAddMess", "课程添加失败！"));
            }
            response.sendRedirect(servletContext.getContextPath() + "/zadmin/release.jsp#course");
            //删除已有课程
        } else if ("courseDelete".equals(action)) {
            String ccode = request.getParameter("ccode");
            if (courseDao.deleteByCcode(ccode) != 0) {
                servletContext.setAttribute("courses", courseDao.findAll());
                session.setAttribute("mess", new Message("courseDeleteMess", "课程删除成功！"));
            } else {
                session.setAttribute("mess", new Message("courseDeleteMess", "课程删除失败！"));
            }
            response.sendRedirect(servletContext.getContextPath() + "/zadmin/release.jsp#course");
            //其他情况
        } else {
            session.removeAttribute("mess");
            response.sendRedirect(servletContext.getContextPath() + "/zadmin/release.jsp");
        }
    }

    /**
     * Initialization of the servlet. <br>
     *
     * @throws ServletException if an error occurs
     */
    public void init() throws ServletException {
        // Put your code here
    }
}
