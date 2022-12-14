package cn.tjzhic.controller;

import com.jspsmart.upload.SmartUpload;
import cn.tjzhic.util.Message;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SAdminDb extends HttpServlet {

    /**
     * Constructor of the object.
     */
    public SAdminDb() {
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
        ServletContext servletContext = request.getServletContext();
        HttpSession session = request.getSession();
        String action = request.getParameter("action");


        if ("backup".equals(action)) {
            Runtime runtime = Runtime.getRuntime();

            Date date = new Date();
            DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
            String time = format.format(date);

            Process process = runtime.exec("cmd /c mysqldump -uroot -proot bkxt >C:/Progra~1/apache-tomcat-7.0.56/webapps/bkxt/backup/" + time + ".sql");
            try {
                int tag = process.waitFor();
                if (tag == 0) {
                    session.setAttribute("mess", new Message("backupMess", "????????????"));
                } else {
                    session.setAttribute("mess", new Message("backupMess", "????????????"));
                }

                SmartUpload su = new SmartUpload();
                su.initialize(this.getServletConfig(), request, response);
                su.setContentDisposition(null);
                su.downloadFile("/backup/" + time + ".sql");
                response.getOutputStream().close();
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }


            response.sendRedirect(servletContext.getContextPath() + "/sadmin/db.jsp");

        } else if ("restore".equals(action)) {
            Runtime runtime = Runtime.getRuntime();
            String relativepath = "/backup/";
            SmartUpload su = new SmartUpload();
            String message = null;
            Date date = new Date();
            DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
            String time = format.format(date);

            try {
                su.initialize(getServletConfig(), request, response);
                su.setMaxFileSize(1000000);
                su.setAllowedFilesList("sql");
                su.upload();
                com.jspsmart.upload.File file = su.getFiles().getFile(0);
                if (file.isMissing()) {
                    message = "*??????????????????????????????";
                } else {
                    file.saveAs(relativepath + time + ".sql", SmartUpload.SAVE_VIRTUAL);
                    message = "*????????????!";
                }

            } catch (SecurityException e) {
                if (e.getMessage().trim().matches("(.*)1010\\)\\.$")) {
                    message = "*??????????????????????????????!";
                } else if (e.getMessage().trim().matches("(.*)1105\\)\\.$")) {
                    message = "*?????????????????????1M!";
                } else {
                    message = "*????????????!";
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            Process process = runtime.exec("cmd /c mysql -uroot -proot bkxt <C:/Progra~1/apache-tomcat-7.0.56/webapps/bkxt/backup/" + time + ".sql");
            try {
                int tag = process.waitFor();
                if (tag == 0) {
                    session.setAttribute("mess", new Message("restoreMess", "????????????"));
                } else {
                    session.setAttribute("mess", new Message("restoreMess", message + " ????????????"));
                }
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            response.sendRedirect(servletContext.getContextPath() + "/sadmin/db.jsp");
        }

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
