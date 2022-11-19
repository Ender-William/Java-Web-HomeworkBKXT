package cn.tjzhic.controller;

import cn.tjzhic.dao.impl.PhaseDaoImpl;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdminPhaseSet", value = "/admin/phase/set")
public class AdminPhaseSet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPhaseSet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String mess = "";
        // 接收数据
        int number = Integer.parseInt(request.getParameter("number"));
        PhaseDaoImpl phaseDao = new PhaseDaoImpl();
        if (phaseDao.setCurrentPhase(number)) {

            ServletContext sc = request.getServletContext();
            sc.setAttribute("phases", phaseDao.findAll());
            sc.setAttribute("currentPhase", phaseDao.findCurrentPhase());
            mess = "* 提示：阶段设置成功！";
        } else {
            mess = "* 提示：阶段设置失败";
        }
        request.setAttribute("mess", mess);
        request.getRequestDispatcher("/admin/phase.jsp").forward(request, response);

    }
}
