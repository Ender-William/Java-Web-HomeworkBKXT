package cn.tjzhic.listener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class CountListener implements HttpSessionListener {
    public void sessionCreated(HttpSessionEvent se) {
        ServletContext context = se.getSession().getServletContext();
        if (context.getAttribute("count") == null) {
            Integer count = new Integer(1);
            context.setAttribute("count", count);
        } else {
            Integer count = (Integer) context.getAttribute("count");
            context.setAttribute("count", count + 1);
        }
    }

    public void sessionDestroyed(HttpSessionEvent se) {
        ServletContext context = se.getSession().getServletContext();
        Integer count = (Integer) context.getAttribute("count");
        context.setAttribute("count", count - 1);
    }
}
