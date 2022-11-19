package cn.tjzhic.controller;

import cn.tjzhic.dao.RecordDao;
import cn.tjzhic.dao.impl.RecordDaoImpl;
import cn.tjzhic.util.PageModel;
import cn.tjzhic.entity.Record;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class StuRecord extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    /**
     * Constructor of the object.
     */
    public StuRecord() {
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
        HttpSession session = request.getSession();
        RecordDao recordDao = new RecordDaoImpl();
        int pageSize, pageNo;
        try {
            pageSize = request.getParameter("pageSize") == null ? 10 : Integer.parseInt(request.getParameter("pageSize").toString());
            pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo").toString());
        } catch (NumberFormatException e) {
            pageSize = 10;
            pageNo = 1;
        }
        String username = (String) session.getAttribute("username");
        PageModel<Record> pm = recordDao.pageByLogname(username, "学生", pageSize, pageNo);
        pm.setPageNav(request.getRequestURI());
        request.setAttribute("pm", pm);
        request.getRequestDispatcher("/stu/record.jsp").forward(request, response);
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
