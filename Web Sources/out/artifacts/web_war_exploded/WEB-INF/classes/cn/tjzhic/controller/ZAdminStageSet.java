package cn.tjzhic.controller;

import cn.tjzhic.dao.CurrstageDao;
import cn.tjzhic.dao.impl.CurrstageDaoImpl;
import cn.tjzhic.entity.Adminuser;
import cn.tjzhic.util.Message;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ZAdminStageSet extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    /**
     * Constructor of the object.
     */
    public ZAdminStageSet() {
        super();
    }

    /**
     * Destruction of the servlet. <br>
     */
    public void destroy() {
        super.destroy(); // Just puts "destroy" string in log
        // Put your code here
    }

    /**
     * The doGet method of the servlet. <br>
     * <p>
     * This method is called when a form has its tag value method equals to get.
     *
     * @param request  the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException      if an error occurred
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doPost(request, response);
    }

    /**
     * The doPost method of the servlet. <br>
     * <p>
     * This method is called when a form has its tag value method equals to post.
     *
     * @param request  the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException      if an error occurred
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html; charset=utf-8");
        ServletContext servletContext = request.getServletContext();
        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        if ("stageSet".equals(action)) {
            CurrstageDao currstageDao = new CurrstageDaoImpl();
            Adminuser adminuser = (Adminuser) session.getAttribute("adminuser");
            String adminname = adminuser.getUsername();
            String currstage = request.getParameter("currstage");
            if (currstageDao.set(adminname, currstage) != 0) {
                servletContext.setAttribute("currstage", currstageDao.findCurrent());
                session.setAttribute("mess", new Message("stageSetMess", "阶段设置成功！"));
            } else {
                session.setAttribute("mess", new Message("stageAddMess", "阶段设置失败！"));
            }
            response.sendRedirect(servletContext.getContextPath() + "/zadmin/stageset.jsp");
        } else {
            session.removeAttribute("mess");
            response.sendRedirect(servletContext.getContextPath() + "/zadmin/stageset.jsp");
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
