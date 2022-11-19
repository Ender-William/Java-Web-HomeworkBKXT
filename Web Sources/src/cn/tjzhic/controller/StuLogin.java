package cn.tjzhic.controller;

import cn.tjzhic.dao.RecordDao;
import cn.tjzhic.dao.StuDao;
import cn.tjzhic.dao.impl.RecordDaoImpl;
import cn.tjzhic.dao.impl.StuDaoImpl;
import cn.tjzhic.util.Encrypt;
import cn.tjzhic.entity.Record;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class StuLogin extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    /**
     * Constructor of the object.
     */
    public StuLogin() {
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
        HttpSession session = request.getSession();
        StuDao stuDao = new StuDaoImpl();
        RecordDao recordDao = new RecordDaoImpl();
        String username = request.getParameter("username");    /*接收表单数据*/
        String password = request.getParameter("password");
        String code = request.getParameter("code");
        request.setAttribute("username", username);    /*表单数据保存至request作用域*/
        request.setAttribute("password", password);
        request.setAttribute("code", code);
        String mess = validateForm(username, password, code);    /*表单数据规范性的服务器端验证*/
        if (!"".equals(mess)) {
            request.setAttribute("stuLoginMess", mess);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            String sessioncode = session.getAttribute("sessioncode").toString();
            if (!code.equals(sessioncode)) {
                request.setAttribute("stuLoginMess", "* 验证码错误！");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            } else if (stuDao.validateLogin(username, Encrypt.SHA(password)) == null) {
                request.setAttribute("stuLoginMess", "* 用户名或密码输入错误！");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            } else {
                Record record = new Record();
                record.setLogname(username);
                record.setUsergroup("学生");
                record.setLogip(request.getRemoteAddr());
                if (recordDao.add(record) != 0) {
                    session.setAttribute("username", username);
                    response.sendRedirect(request.getContextPath() + "/stu/notice.jsp");
                } else {
                    request.setAttribute("stuLoginMess", "* 登录异常！");
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                }
            }
        }
    }

    private String validateForm(String username, String password, String code) {
        if (username == null || !username.matches("\\w{6,20}")) {
            return "* 用户名错误！";
        } else if (password == null || !password.matches("\\w{6,20}")) {
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
