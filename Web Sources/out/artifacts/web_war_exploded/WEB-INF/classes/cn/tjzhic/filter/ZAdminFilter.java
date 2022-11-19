package cn.tjzhic.filter;

import cn.tjzhic.entity.Adminuser;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ZAdminFilter implements Filter {

    @Override
    public void destroy() {
        // TODO Auto-generated method stub

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        // TODO Auto-generated method stub
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        if (session != null && session.getAttribute("adminuser") != null) {
            Adminuser adminuser = (Adminuser) session.getAttribute("adminuser");
            if ("招生管理员".equals(adminuser.getUsergroup())) {
                chain.doFilter(request, response);
            } else {
                req.setAttribute("adminLoginMess", "* 请先登录！");
                req.getRequestDispatcher("/manage.jsp").forward(request, response);
            }
        } else {
            req.setAttribute("adminLoginMess", "* 请先登录！");
            req.getRequestDispatcher("/manage.jsp").forward(request, response);
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // TODO Auto-generated method stub

    }

}
