package cn.tjzhic.controller;

import cn.tjzhic.dao.RecordDao;
import cn.tjzhic.dao.impl.MajorDaoImpl;
import cn.tjzhic.dao.impl.RecordDaoImpl;
import cn.tjzhic.dao.impl.ReginfoDaoImpl;
import cn.tjzhic.entity.Major;
import cn.tjzhic.entity.Reginfo;
import cn.tjzhic.entity.School;
import cn.tjzhic.util.PageModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class JAdminCardNum extends HttpServlet {

    /**
     * Constructor of the object.
     */
    public JAdminCardNum() {
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
        int pageSize = request.getParameter("pageSize") == null ? 5 : Integer
                .parseInt(request.getParameter("pageSize").toString());
        int pageNo = request.getParameter("pageNo") == null ? 1 : Integer
                .parseInt(request.getParameter("pageNo").toString());
        RecordDao recordDao = new RecordDaoImpl();

        String method = request.getParameter("action");

        if (method != null && method.equals("assign")) {
            ReginfoDaoImpl reginfoDao = new ReginfoDaoImpl();
            ArrayList<Reginfo> array = reginfoDao.findAll();
            Map<String, Integer> map = new HashMap<String, Integer>();
            School school = (School) this.getServletContext().getAttribute(
                    "school");
            ArrayList<Major> majors = (ArrayList<Major>) this
                    .getServletContext().getAttribute("majors");
            String shoolCode = school.getShcode();
            String year = school.getShyear();
            String testcardnum = year + shoolCode;

            for (Major major : majors) {
                map.put(major.getMname(), 1);
            }
            for (Reginfo reg : array) {
                MajorDaoImpl majorimp = new MajorDaoImpl();
                if (reg.getIsconfirm() == 0)
                    continue;
                String tempMajor = reg.getMname();
                int tempNum = (Integer) map.get(tempMajor);
                map.put(tempMajor, tempNum + 1);
                testcardnum = testcardnum + majorimp.getByName(tempMajor)
                        + tempNum;
                reginfoDao.addCode(reg.getUsername(), testcardnum);
            }
        }
        PageModel<Reginfo> pm = recordDao.pageReginfo(pageSize, pageNo);
        pm.setPageNav(request.getRequestURI());
        request.setAttribute("pm", pm);
        request.getRequestDispatcher("/jadmin/assignnum.jsp").forward(request,
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
