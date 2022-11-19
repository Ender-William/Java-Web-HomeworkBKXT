package cn.tjzhic.controller;

import cn.tjzhic.dao.StuDao;
import cn.tjzhic.dao.impl.StuDaoImpl;
import cn.tjzhic.entity.Stu;
import cn.tjzhic.util.Encrypt;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class ZAdminStuManage extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    /**
     * Constructor of the object.
     */
    public ZAdminStuManage() {
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
        StuDao stuDao = new StuDaoImpl();
        String action = request.getParameter("action");
        if ("findStusLikeUsername".equals(action)) {
            String username = request.getParameter("username").toString();
            ArrayList<Stu> stus = stuDao.findStusLikeUsername(username);
            request.setAttribute("stus", stus);
            request.getRequestDispatcher("/zadmin/stumanage.jsp").forward(request, response);
        } else if ("findStusLikeIdcode".equals(action)) {
            String idcode = request.getParameter("idcode").toString();
            ArrayList<Stu> stus = stuDao.findStusLikeIdcode(idcode);
            request.setAttribute("stus", stus);
            request.getRequestDispatcher("/zadmin/stumanage.jsp").forward(request, response);
        } else if ("stuPassReset".equals(action)) {
            String username = request.getParameter("username").toString();
            if (stuDao.passModify(username, Encrypt.SHA("000000")) != 0) {
                request.setAttribute("stuPassResetMess", "* 用户 " + username + " 的密码已重置为‘000000’！");
                request.getRequestDispatcher("/zadmin/stumanage.jsp").forward(request, response);
            } else {
                request.setAttribute("stuPassResetMess", "* 用户 " + username + " 的密码清零操作失败！");
                request.getRequestDispatcher("/zadmin/stumanage.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect(servletContext.getContextPath() + "/zadmin/stumanage.jsp");
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
