package cn.tjzhic.controller;

import cn.tjzhic.dao.RecordDao;
import cn.tjzhic.dao.impl.GradeDaoImpl;
import cn.tjzhic.dao.impl.RecordDaoImpl;
import cn.tjzhic.entity.SupGrade;
import cn.tjzhic.util.PageModel;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

public class JAdminGradeInput extends HttpServlet {

    /**
     * Constructor of the object.
     */
    public JAdminGradeInput() {
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

        response.setContentType("text/html");
        int pageSize = request.getParameter("pageSize") == null ? 5 : Integer.parseInt(request.getParameter("pageSize").toString());
        int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo").toString());

        HttpSession session = request.getSession();
        RecordDao recordDao = new RecordDaoImpl();
        System.out.println(pageNo);
        PageModel<SupGrade> pm = recordDao.pageByLogname(pageSize, pageNo);
        pm.setPageNav(request.getRequestURI());

        File file = (File) request.getAttribute("file1");
        if (file != null) {
            try {
                GradeDaoImpl gradeImpl = new GradeDaoImpl();
                Workbook workbook = Workbook.getWorkbook(file);
                Sheet sheet = workbook.getSheet(0);
                for (int row = 2; row < sheet.getRows() - 1; row++) {
                    SupGrade supgrade = new SupGrade();
                    supgrade.setTestcardnum(sheet.getCell(1, row).getContents().trim());
                    supgrade.setSname(sheet.getCell(2, row).getContents().trim());
                    supgrade.setCname(sheet.getCell(3, row).getContents().trim());
                    supgrade.setScore(Integer.parseInt(sheet.getCell(4, row).getContents().trim()));
                    supgrade.setNote(sheet.getCell(5, row).getContents().trim());
                    gradeImpl.gradeAdd(supgrade);
                }
            } catch (BiffException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        request.setAttribute("pm", pm);
        request.getRequestDispatcher("/jadmin/grade.jsp").forward(request, response);
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
