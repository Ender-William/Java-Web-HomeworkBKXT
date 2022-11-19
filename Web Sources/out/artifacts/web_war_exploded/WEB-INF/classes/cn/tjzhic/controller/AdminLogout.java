package cn.tjzhic.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminLogout", value = "/admin/logout")
public class AdminLogout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getSession().removeAttribute("adminuser"); // 从会话作用域中移除adminuser
        request.setAttribute("mess", "* 提示：已注销登录！");
        request.getRequestDispatcher("/manage.jsp").forward(request, response); // 请求转发至/manage.jsp页面

    }
}
