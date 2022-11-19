package cn.tjzhic.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AdminFilter implements Filter {
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
            chain.doFilter(request, response);
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
