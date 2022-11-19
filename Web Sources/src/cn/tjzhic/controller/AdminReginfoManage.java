package cn.tjzhic.controller;

import cn.tjzhic.dao.RecordDao;
import cn.tjzhic.dao.impl.RecordDaoImpl;
import cn.tjzhic.entity.Major;
import cn.tjzhic.entity.Reginfo;
import cn.tjzhic.util.PageModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class AdminReginfoManage extends HttpServlet {

    /**
     * Constructor of the object.
     */
    public AdminReginfoManage() {
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

        response.setContentType("text/html");
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

        response.setContentType("text/html");
        int pageSize = request.getParameter("pageSize") == null ? 5 : Integer.parseInt(request.getParameter("pageSize").toString());
        int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo").toString());
        RecordDao recordDao = new RecordDaoImpl();

        ArrayList<Major> majors = (ArrayList<Major>) this.getServletContext().getAttribute("majors");
        request.setAttribute("majors", majors);
        String majorName = request.getParameter("mname");

        String isconfirm = request.getParameter("isconfirm");
        if (majorName != null && isconfirm != null) {
            PageModel<Reginfo> pm = recordDao.pageReginfo(majorName, isconfirm, pageSize, pageNo);
            pm.setPageNav(request.getRequestURI());
            request.setAttribute("pm", pm);
        }
        request.getRequestDispatcher("/jadmin/infomanage.jsp").forward(request, response);
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
