package cn.tjzhic.controller;

import cn.tjzhic.dao.impl.ReginfoDaoImpl;
import cn.tjzhic.entity.Reginfo;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

public class JAdminRoom extends HttpServlet {

    /**
     * Constructor of the object.
     */
    public JAdminRoom() {
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

        ReginfoDaoImpl regInfoD = new ReginfoDaoImpl();
        String action = request.getParameter("action");
        if (action != null) {
            if (action.equals("assign")) {
                int number = Integer.parseInt(request.getParameter("perRoom"));
                ArrayList<Reginfo> regs = regInfoD.findByIncrease();
                int totalNumber = regs.size();
                request.getSession().setAttribute("reginfos", regs);
                request.getSession().setAttribute("perRoom", number);
                int remain = totalNumber % number;
                int roomNum = remain == 0 ? totalNumber / number : totalNumber
                        / number + 1;
                System.out.println(remain);
                System.out.println(roomNum);
                request.setAttribute("room", roomNum);
                request.setAttribute("perroom", number);
                request.setAttribute("remain", remain);
            } else if (action.equals("assure")) {
                ArrayList<Reginfo> regsAssure = (ArrayList<Reginfo>) request
                        .getSession().getAttribute("reginfos");
                int number = (Integer) request.getSession().getAttribute(
                        "perRoom");
                String[] rooms = request.getParameterValues("rooms");
                System.out.println(regsAssure.size());
                Iterator<Reginfo> regIter = regsAssure.iterator();
                int exameNum = 1;
                for (String room : rooms) {
                    for (int i = 1; i <= number; i++) {
                        if (!regIter.hasNext())
                            break;
                        Reginfo tempReg = regIter.next();
                        regInfoD.update(tempReg.getUsername(), exameNum + "-"
                                + room, i);
                    }
                    exameNum++;
                }
            }
        }
        request.getRequestDispatcher("/jadmin/assignroom.jsp").forward(request,
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
