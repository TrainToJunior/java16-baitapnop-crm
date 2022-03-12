package cybersoft.javabackend.crm.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import cybersoft.javabackend.crm.connection.MySQLConnection;
import cybersoft.javabackend.crm.dao.UserDAO;
import cybersoft.javabackend.crm.model.User;
import cybersoft.javabackend.crm.util.JspConst;
import cybersoft.javabackend.crm.util.UrlConst;
@WebServlet(name = "loginController", urlPatterns = UrlConst.LOGIN)
public class LoginController extends HttpServlet {
	private UserDAO userDAO = null;
	
	@Override
	public void init() throws ServletException {
		userDAO = new UserDAO();
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try(Connection connection = MySQLConnection.getConnection()){
			if (connection != null) {
				System.out.println("Connect thành công");
			}else {
				System.out.println("Connect thất bại");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		req.getRequestDispatcher(JspConst.LOGIN).forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Xử lí đăng nhập, validation ( kiểm tra email và mật khẩu)
		
		User currentUser = userDAO.loginUser((String)req.getParameter("email_2"),(String)req.getParameter("password_2"));
		// Nếu không thành công: Gửi req lại trang login
		if (currentUser.getFullName() == null) {
			resp.sendRedirect(req.getContextPath() + UrlConst.LOGIN);		
		}
		// Nếu đăng nhập thanh công: Chuyển sang trang home
		else {
			HttpSession session=req.getSession();  
			session.setAttribute("currentUser", currentUser);
			resp.sendRedirect(req.getContextPath() + UrlConst.HOME);
		}
		
	}
}
