package servlet;

import entity.Userdata;
import handler.LoginHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Enumeration;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //固定操作，设置字符格式
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("content-type", "text/html;charset=utf-8");

        //从前端获取username和password
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println(username);
        System.out.println(password);

        //声明输出流
        PrintWriter printWriter = response.getWriter();

        try {

            LoginHandler loginHandler = new LoginHandler();
            Userdata userdata = loginHandler.check(username, password);

            if ( userdata == null ) {
                printWriter.write("用户不存在或密码错误，请返回重新登录");
            }
            else {
//                printWriter.write("欢迎你, " + userdata.getUserName() + "!");

                //通过用户email更新当前登录ip
                String log_ip = request.getRemoteAddr();
                String email = userdata.getEmail();
                loginHandler.updateLoginIP(log_ip, email);

                //登录成功，存入session
                request.getSession().setAttribute("user_session", userdata);

                //转向知识点录入
                request.getRequestDispatcher("home_page.jsp").forward(request, response);

            }
            loginHandler.closeConnection();

        } catch (ClassNotFoundException | SQLException | ServletException e) {
            e.printStackTrace();
            printWriter.write("登陆失败");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //固定操作，不论method是post还是get，都能互相调用
        doPost(request, response);
    }
}
