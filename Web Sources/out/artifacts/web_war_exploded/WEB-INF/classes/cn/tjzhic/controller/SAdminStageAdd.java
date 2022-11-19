package cn.tjzhic.controller;

import cn.tjzhic.dao.StageDao;
import cn.tjzhic.dao.impl.StageDaoImpl;
import cn.tjzhic.entity.Stage;
import cn.tjzhic.util.Message;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class SAdminStageAdd extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * Constructor of the object.
     */
    public SAdminStageAdd() {
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

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=utf-8");
        ServletContext servletContext = request.getServletContext();
        HttpSession session = request.getSession();
        StageDao stageDao = new StageDaoImpl();
        String action = request.getParameter("action");

        if ("stageAdd".equals(action)) {
            int stagenum = Integer.parseInt(request.getParameter("stagenum").toString());
            Stage stage = new Stage();
            stage.setStagenum(stagenum);
            stage.setStagename(request.getParameter("stagename"));
            stage.setStarttime(request.getParameter("starttime"));
            stage.setEndtime(request.getParameter("endtime"));
            stage.setNote(request.getParameter("note"));
            if (stageDao.findByStagenum(stagenum) != null) {
                session.setAttribute("mess", new Message("stageAddMess", "阶段编号不能重复！"));
            } else if (stageDao.add(stage) != 0) {
                servletContext.setAttribute("stages", stageDao.findAll());
                session.setAttribute("mess", new Message("stageAddMess", "添加阶段成功！"));
            } else {
                session.setAttribute("mess", new Message("stageAddMess", "添加阶段失败！"));
            }
            response.sendRedirect(servletContext.getContextPath() + "/sadmin/stageadd.jsp#add");
            //删除系统阶段
        } else if ("stageDelete".equals(action)) {
            int stagenum = Integer.parseInt(request.getParameter("stagenum").toString());
            ;
            if (stageDao.deleteByStagenum(stagenum) != 0) {
                servletContext.setAttribute("stages", stageDao.findAll());
                session.setAttribute("mess", new Message("stageDeleteMess", "阶段删除成功！"));
            } else {
                session.setAttribute("mess", new Message("stageDeleteMess", "阶段删除失败！"));
            }
            response.sendRedirect(servletContext.getContextPath() + "/sadmin/stageadd.jsp");
            //其他情况
        } else {
            session.removeAttribute("mess");
            response.sendRedirect(servletContext.getContextPath() + "/sadmin/stageadd.jsp");
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
