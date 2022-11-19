package cn.tjzhic.controller;

import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import cn.tjzhic.dao.ReginfoDao;
import cn.tjzhic.dao.impl.ReginfoDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class StuPhoto extends HttpServlet {

    /**
     * Constructor of the object.
     */
    public StuPhoto() {
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
        HttpSession session = request.getSession();
        String username = session.getAttribute("username").toString();
        SmartUpload upload = new SmartUpload();
        upload.initialize(this.getServletConfig(), request, response);
        upload.setAllowedFilesList("jpg,JPG");

        try {
            upload.upload();
            String filename = "/upload/" + username + ".jpg";
            Files files = upload.getFiles();
            files.getFile(0).saveAs(filename, SmartUpload.SAVE_VIRTUAL);
        } catch (SmartUploadException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

        ReginfoDao regDao = new ReginfoDaoImpl();
        regDao.update(username + ".jpg", username);
        request.getRequestDispatcher("/stu/photo.jsp").forward(request, response);
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
