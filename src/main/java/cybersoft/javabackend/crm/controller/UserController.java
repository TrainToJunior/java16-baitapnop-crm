package cybersoft.javabackend.crm.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cybersoft.javabackend.crm.dao.RoleDAO;
import cybersoft.javabackend.crm.dao.UserDAO;
import cybersoft.javabackend.crm.model.Role;
import cybersoft.javabackend.crm.model.User;
import cybersoft.javabackend.crm.util.JspConst;
import cybersoft.javabackend.crm.util.UrlConst;

@WebServlet(name = "userController", urlPatterns = { UrlConst.USER, UrlConst.USER_DELETE, UrlConst.USER_INSERT,
		UrlConst.USER_UPDATE })
public class UserController extends HttpServlet {
	private UserDAO userDao = null;
	private RoleDAO roleDao = null;
	private String message = "";

	@Override
	public void init() throws ServletException {
		userDao = new UserDAO();
		roleDao = new RoleDAO();

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("message", message);
		req.setAttribute("listUser", userDao.getAll());
		req.setAttribute("listRole", roleDao.getAll());
		message = "";
		req.getRequestDispatcher(JspConst.USER).forward(req, resp);
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		User user = new User();
		int value ;
		switch (path) {
		// không thể xóa chính mình ***************
		case UrlConst.USER_DELETE:
			value = userDao.deleteUserByID(Integer.parseInt(req.getParameter("deleteID")));
			message = "Xóa thành công";
			resp.sendRedirect(req.getContextPath() + UrlConst.USER);
			break;
		case UrlConst.USER_INSERT:
			user.setEmail(req.getParameter("email"));
			user.setUserPassword(req.getParameter("userPassword"));
			user.setFullName(req.getParameter("fullName"));
			user.setRoleID(Integer.parseInt(req.getParameter("selectRole")));
			value = userDao.insertUser(user);
			message = "Thêm thành công";
			resp.sendRedirect(req.getContextPath() + UrlConst.USER);
			break;
		case UrlConst.USER_UPDATE:
			user.setUserID(Integer.parseInt(req.getParameter("updateID")));
			user.setEmail(req.getParameter("email"));
			user.setUserPassword(req.getParameter("userPassword"));
			user.setFullName(req.getParameter("fullName"));
			user.setRoleID(Integer.parseInt(req.getParameter("selectRole")));
			value = userDao.updateUser(user);
			message = "Cập nhật thành công";
			resp.sendRedirect(req.getContextPath() + UrlConst.USER);
			break;
		default:
			break;
		}
	}
}
