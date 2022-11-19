package cn.tjzhic.controller;

import cn.tjzhic.dao.SiteDao;
import cn.tjzhic.dao.impl.SiteDaoImpl;
import cn.tjzhic.entity.Site;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "AdminSiteModify", value = "/admin/site/modify")
public class AdminSiteModify extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 请求和响应传输的编码设置
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // 接收数据
        // 接收数据的方法被封装在Request对象中了，下面的代码逐一接收数据
        String company = request.getParameter("company");
        String name = request.getParameter("name");
        String location = request.getParameter("location");
        String zipcode = request.getParameter("zipcode");
        String contact = request.getParameter("contact");
        String copy = request.getParameter("copy");

        // 数据校验：也可以封装为一个方法，消息mess不为空，说明数据校验未通过
        String mess = "";
        if (company == null || company.trim().isEmpty()) {
            mess = "* 提示：公司名称不能为空！";
        } else if (name == null || name.trim().isEmpty()) {
            mess = "* 提示：站点名称不能为空！";
        } else if (location == null || location.trim().isEmpty()) {
            mess = "* 提示：地址不能为空！";
        } else if (zipcode == null || !zipcode.trim().matches("\\d{6}")) {
            mess = "* 提示：邮编格式不正确！";
        } else if (contact == null || contact.trim().isEmpty()) {
            mess = "* 提示：联系电话不能为空！";
        } else if (copy == null || copy.trim().isEmpty()) {
            mess = "* 提示：版权信息不能为空！";
        }

        // 如果通过校验
        if (mess.isEmpty()) {

            // 将接收到的数据封装为Map
            Map<String, Object> siteFieldMap = new HashMap<String, Object>();
            siteFieldMap.put("company", company.trim());
            siteFieldMap.put("name", name.trim());
            siteFieldMap.put("location", location.trim());
            siteFieldMap.put("zipcode", zipcode.trim());
            siteFieldMap.put("contact", contact.trim());
            siteFieldMap.put("copy", copy.trim());

            // 业务：调用底层DAO存取修改数据方法，完成对数据库的更新操作
            SiteDao siteDao = new SiteDaoImpl();
            int row = siteDao.updateById(1L, siteFieldMap);
            if (row > 0) { // 对数据库更新成功
                // 业务：从库中重新读取更新后的站点信息site，并再次存入application作用域
                Site site = siteDao.findById(1L);
                request.getServletContext().setAttribute("site", site);
                mess = "* 提示：修改成功！";  // 给客户端的消息
            } else {
                mess = "* 提示：修改失败！";  // 给客户端的消息
            }
        }

        // 在request作用域中存入提示消息
        request.setAttribute("mess", mess);
        // 获取请求转发器，在内部将请求转发至 /admin/site.jsp这个页面
        request.getRequestDispatcher("/admin/site.jsp").forward(request, response);

    }
}
