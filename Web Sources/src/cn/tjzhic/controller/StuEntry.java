package cn.tjzhic.controller;

import cn.tjzhic.dao.ReginfoDao;
import cn.tjzhic.dao.impl.ReginfoDaoImpl;
import cn.tjzhic.entity.Reginfo;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class StuEntry extends HttpServlet {

    /**
     * Constructor of the object.
     */
    public StuEntry() {
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

        HttpSession session = request.getSession();

        String username = session.getAttribute("username").toString();
        String action = request.getParameter("action");
        ReginfoDao regDao = new ReginfoDaoImpl();
        Reginfo reg = new Reginfo();
        reg = regDao.findByUser(username);
        String sname = reg.getSname();
        if (action != null && action.equals("entry")) {
            reg.setUsername(username);
            reg.setSname(request.getParameter("sname"));
            reg.setIdcode(request.getParameter("idcode"));
            reg.setSsex(request.getParameter("ssex"));
            reg.setAos(request.getParameter("aos"));
            reg.setCet(request.getParameter("cet"));
            reg.setConaddr(request.getParameter("conaddr"));
            reg.setGradutetime(request.getParameter("gradutetime"));
            reg.setHomeaddr(request.getParameter("homeaddr"));
            reg.setIsnew(request.getParameter("isnew"));
            reg.setMajor(request.getParameter("major"));
            reg.setMname(request.getParameter("mname"));
            reg.setMobile(request.getParameter("mobile"));
            reg.setNation(request.getParameter("nation"));
            reg.setPolitical(request.getParameter("political"));
            reg.setReceiver(request.getParameter("receiver"));
            reg.setSchool(request.getParameter("school"));
            reg.setSource(request.getParameter("source"));
            reg.setTelphone(request.getParameter("telphone"));
            reg.setZipcode(request.getParameter("zipcode"));
            if (sname == null)
                regDao.add(reg);
            else
                regDao.update(reg);
            request.getSession().setAttribute("reginfo", reg);
            request.setAttribute("reginfo", reg);
            request.getRequestDispatcher("/stu/photo.jsp").forward(request, response);
        } else {
            request.getSession().setAttribute("reginfo", reg);
            request.setAttribute("reginfo", reg);
            request.getRequestDispatcher("/stu/entry.jsp").forward(request, response);
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
