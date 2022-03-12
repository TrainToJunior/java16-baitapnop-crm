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

@WebServlet(name = "userController", urlPatterns = { UrlConst.USER, UrlConst.INSERT_USER, UrlConst.DELETE_USER,
		UrlConst.UPDATE_USER })
public class UserController extends HttpServlet {
	private UserDAO userDAO = null;
	private RoleDAO roleDAO = null;
	private String message = "";

	@Override
	public void init() throws ServletException {
		userDAO = new UserDAO();
		roleDAO = new RoleDAO();

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ArrayList<User> listUser = userDAO.getAll();
		ArrayList<Role> listRole = roleDAO.getAll();
		req.setAttribute("message", message);
		message = "";
		req.setAttribute("listUser", listUser);
		req.setAttribute("listRole", listRole);
		req.getRequestDispatcher(JspConst.USER).forward(req, resp);
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		User user = new User();
		int value ;
		switch (path) {
		// không thể xóa chính mình ***************
		case UrlConst.DELETE_USER:
			value = userDAO.deleteUserByID(Integer.parseInt(req.getParameter("deleteID")));
			message = "Xóa thành công";
			resp.sendRedirect(req.getContextPath() + UrlConst.USER);
			break;
		case UrlConst.INSERT_USER:
			user.setEmail(req.getParameter("email"));
			user.setUserPassword(req.getParameter("userPassword"));
			user.setFullName(req.getParameter("fullName"));
			user.setRoleID(Integer.parseInt(req.getParameter("selectRole")));
			value = userDAO.insertUser(user);
			message = "Thêm thành công";
			resp.sendRedirect(req.getContextPath() + UrlConst.USER);
			break;
		case UrlConst.UPDATE_USER:
			user.setUserID(Integer.parseInt(req.getParameter("updateID")));
			user.setEmail(req.getParameter("email"));
			user.setUserPassword(req.getParameter("userPassword"));
			user.setFullName(req.getParameter("fullName"));
			user.setRoleID(Integer.parseInt(req.getParameter("selectRole")));
			value = userDAO.updateUser(user);
			message = "Cập nhật thành công";
			resp.sendRedirect(req.getContextPath() + UrlConst.USER);
			break;
		default:
			break;
		}
	}
}
