package cn.tjzhic.controller;

import cn.tjzhic.dao.AdminuserDao;
import cn.tjzhic.dao.RecordDao;
import cn.tjzhic.dao.impl.AdminuserDaoImpl;
import cn.tjzhic.dao.impl.RecordDaoImpl;
import cn.tjzhic.entity.Adminuser;
import cn.tjzhic.entity.Record;
import cn.tjzhic.util.Encrypt;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

public class AdminLogin extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    /**
     * Constructor of the object.
     */
    public AdminLogin() {
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
        AdminuserDao adminuserDao = new AdminuserDaoImpl();
        RecordDao recordDao = new RecordDaoImpl();

        String adminname = request.getParameter("adminname");
        String adminpass = request.getParameter("adminpass");
        String code = request.getParameter("code");

        /*表单数据保存至request作用域*/
        request.setAttribute("adminname", adminname);
        request.setAttribute("adminpass", adminpass);
        request.setAttribute("code", code);
        /*表单数据规范性的服务器端验证*/
        String mess = validateForm(adminname, adminpass, code);
        if (!"".equals(mess)) {
            request.setAttribute("adminLoginMess", mess);
            request.getRequestDispatcher("/manage.jsp").forward(request, response);
        } else {
            String sessioncode = session.getAttribute("sessioncode").toString();

            if (!code.equals(sessioncode)) {
                request.setAttribute("adminLoginMess", "* 验证码错误！");
                request.getRequestDispatcher("/manage.jsp").forward(request, response);
            } else {
                System.out.println(adminname);
                System.out.println(adminpass);
                System.out.println(Encrypt.SHA(adminpass));
                Adminuser adminuser = adminuserDao.validateLogin(adminname, Encrypt.SHA(adminpass));
                System.out.println(adminuser);
                if (adminuser == null) {
                    request.setAttribute("adminLoginMess", "* 用户名或密码输入错误！");
                    request.getRequestDispatcher("/manage.jsp").forward(request, response);
                } else {
                    Record record = new Record();
                    record.setLogname(adminuser.getUsername());
                    record.setUsergroup(adminuser.getUsergroup());
                    record.setLogip(request.getRemoteAddr());
                    if (recordDao.add(record) != 0) {
                        session.setAttribute("adminuser", adminuser);
                        System.out.println(adminuser);
                        response.sendRedirect(request.getContextPath() + "/admin/state.jsp");

                    } else {
                        request.setAttribute("adminLoginMess", "* 登录异常！");
                        request.getRequestDispatcher("/manage.jsp").forward(request, response);
                    }
                }
            }
        }
    }


    private String validateForm(String adminname, String adminpass, String code) {
        if (adminname == null || !adminname.matches("\\w{6,20}")) {
            return "* 用户名错误！";
        } else if (adminpass == null || !adminpass.matches("\\w{6,20}")) {
            return "* 密码错误！";
        } else if (code == null || !code.matches("\\d{4}")) {
            return "* 验证码错误！";
        }
        return "";
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