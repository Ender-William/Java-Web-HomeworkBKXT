package cn.tjzhic.controller;

import cn.tjzhic.dao.StuDao;
import cn.tjzhic.dao.impl.StuDaoImpl;
import cn.tjzhic.entity.Stu;
import cn.tjzhic.util.Encrypt;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class StuRegister extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public StuRegister() {
        super();
    }

    public void init() throws ServletException {
    }

    public void destroy() {
        super.destroy();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=utf-8");
        HttpSession session = request.getSession();
        StuDao stuDao = new StuDaoImpl();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmpass = request.getParameter("confirmpass");
        String code = request.getParameter("code");
        String regip = request.getRemoteAddr();
        request.setAttribute("username", username);
        request.setAttribute("password", password);
        request.setAttribute("confirmpass", confirmpass);
        request.setAttribute("code", code);
        String mess = validateForm(username, password, confirmpass, code);
        if (!"".equals(mess)) {
            request.setAttribute("stuAddMess", mess);
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        } else {
            Stu stu = new Stu();
            stu.setUsername(username);
            stu.setPassword(Encrypt.SHA(password));
            stu.setRegip(regip);
            System.out.println(session.getAttribute("sessioncode"));
            String sessioncode = session.getAttribute("sessioncode").toString();
            if (!code.equals(sessioncode)) {
                request.setAttribute("stuAddMess", "* ??????????????????");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
            } else if (stuDao.findByUsername(username) != null) {
                request.setAttribute("stuAddMess", "* ?????????????????????");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
            } else if (stuDao.add(stu) != 0) {
                request.setAttribute("stuLoginMess", "* ???????????????????????????");
                request.removeAttribute("username");
                request.removeAttribute("password");
                request.removeAttribute("confirmpass");
                request.removeAttribute("code");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            } else {
                request.setAttribute("stuAddMess", "* ?????????????????????");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
            }
        }
    }

    private String validateForm(String username, String password, String confirmpass, String code) {
        if (username == null || !username.matches("\\w{6,20}")) {
            return "* ?????????????????????";
        } else if (password == null || !password.matches("\\w{6,20}")) {
            return "* ??????????????????";
        } else if (!password.equals(confirmpass)) {
            return "* ???????????????????????????????????????????????????";
        } else if (code == null || !code.matches("\\d{4}")) {
            return "* ??????????????????";
        }
        return "";
    }
}