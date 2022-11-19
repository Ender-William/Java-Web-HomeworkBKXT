package cn.tjzhic.controller;

import cn.tjzhic.dao.impl.ReginfoDaoImpl;
import cn.tjzhic.entity.Reginfo;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ZAdminConfirm extends HttpServlet {

    /**
     * Constructor of the object.
     */
    public ZAdminConfirm() {
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
     * This method is called when a form has its tag value method equals to
     * post.
     *
     * @param request  the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException      if an error occurred
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        String idcode = request.getParameter("idcode");
        String confirmid = request.getParameter("confirm");

        if (idcode != null) {
            ReginfoDaoImpl reginfoImp = new ReginfoDaoImpl();
            Reginfo reg = null;
            reg = reginfoImp.findByIdcode(idcode);
            request.setAttribute("reginfo", reg);
            request.setAttribute("isconfirmed", reg.getIsconfirm());
        }
        if (confirmid != null) {
            ReginfoDaoImpl reginfoImp = new ReginfoDaoImpl();
            reginfoImp.update(confirmid, 1);
        }
        request.getRequestDispatcher("/zadmin/confirm.jsp").forward(request,
                response);
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
