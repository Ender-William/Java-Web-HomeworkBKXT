package cn.tjzhic.controller;


import cn.tjzhic.dao.AdminuserDao;
import cn.tjzhic.dao.impl.AdminuserDaoImpl;
import cn.tjzhic.entity.Adminuser;
import cn.tjzhic.util.Encrypt;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;


public class SAdminManage extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = -2042120840458282342L;


    public SAdminManage() {
        super();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doPost(request, response);
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=utf-8");
        AdminuserDao adminuserDao = new AdminuserDaoImpl();
        String action = request.getParameter("action");
        if ("findAll".equals(action)) {
            ArrayList<Adminuser> adminusers = adminuserDao.findAll();
            request.setAttribute("adminusers", adminusers);
            request.getRequestDispatcher("/sadmin/manage.jsp").forward(request, response);
        } else {
            if ("add".equals(action)) {
                String adminname = request.getParameter("adminname");
                String adminpass = request.getParameter("adminpass");
                String admingroup = request.getParameter("admingroup");
                Adminuser adminuser = new Adminuser();
                adminuser.setUsername(adminname);
                adminuser.setPassword(Encrypt.SHA(adminpass));
                adminuser.setUsergroup(admingroup);
                request.setAttribute("newadmin", adminuser);
                String mess = validateForm(adminname, adminpass, admingroup);
                if (!"".equals(mess)) {
                    request.setAttribute("addMess", mess);
                } else {
                    if (adminuserDao.findByAdminname(adminname) != null) {
                        request.setAttribute("addMess", "* ?????????????????????");
                    } else if (adminuserDao.add(adminuser) != 0) {
                        request.removeAttribute("newadmin");
                        request.setAttribute("addMess", "* ???????????????????????????");
                    } else {
                        request.setAttribute("addMess", "* ???????????????????????????");
                    }
                }
            } else if ("deleteByAdminname".equals(action)) {
                String adminname = request.getParameter("adminname");
                if (adminuserDao.findByAdminname(adminname).getUsergroup().equals("???????????????")) {
                    request.setAttribute("manageMess", "* ??????????????????????????????");
                } else if (adminuserDao.deleteByAdminname(adminname) != 0) {
                    request.setAttribute("manageMess", "* ????????????????????????");
                } else {
                    request.setAttribute("manageMess", "* ????????????????????????");
                }
            } else if ("passReset".equals(action)) {
                String adminname = request.getParameter("adminname");
                if (adminuserDao.passModify(adminname, Encrypt.SHA("000000")) != 0) {
                    request.setAttribute("manageMess", "* ??????????????????????????????");
                } else {
                    request.setAttribute("manageMess", "* ??????????????????????????????");
                }
            }
            request.getRequestDispatcher("/sadmin/manage.do?action=findAll").forward(request, response);
        }
    }

    private String validateForm(String adminname, String adminpass, String admingroup) {
        if (adminname == null || !adminname.matches("\\w{6,20}")) {
            return "* ?????????????????????";
        } else if (adminpass == null || !adminpass.matches("\\w{6,20}")) {
            return "* ??????????????????";
        } else if (!"???????????????".equals(admingroup) && !"???????????????".equals(admingroup)) {
            return "* ????????????????????????";
        }
        return "";
    }
}
