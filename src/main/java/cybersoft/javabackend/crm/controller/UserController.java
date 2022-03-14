package cybersoft.javabackend.crm.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cybersoft.javabackend.crm.dao.RoleDAO;
import cybersoft.javabackend.crm.dao.UserDAO;
import cybersoft.javabackend.crm.filter.AuthFilter;
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
	private String error = "";

	@Override
	public void init() throws ServletException {
		userDao = new UserDAO();
		roleDao = new RoleDAO();

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute("currentUser");		
		req.setAttribute("currentUser", currentUser);	
		req.setAttribute("currentUserRoleID", currentUser.getRoleID());
		req.setAttribute("message", message);
		req.setAttribute("error", error);
		req.setAttribute("listUser", userDao.getAll());
		req.setAttribute("listRole", roleDao.getAll());
		req.setAttribute("roleAdmin", AuthFilter.ROLE_ADMIN);
		req.setAttribute("roleLeader", AuthFilter.ROLE_LEADER);
		req.setAttribute("roleMember", AuthFilter.ROLE_MEMBER);
		message = "";
		error = "";
		req.getRequestDispatcher(JspConst.USER).forward(req, resp);
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute("currentUser");		
		String path = req.getServletPath();
		User user = new User();
		switch (path) {
		// không thể xóa chính mình ***************
		case UrlConst.USER_DELETE:
			if (currentUser.getUserID() == Integer.parseInt(req.getParameter("deleteID"))) {
				message = "Không thể xóa bản thân :(";
				error = "true";
			}else {
				if(userDao.deleteUserByID(Integer.parseInt(req.getParameter("deleteID"))) == AuthFilter.SUCCESS_DAO_CODE) {			
					message = "Xóa thành công";	
				}else {
					message = "Xóa thất bại";
					error = "true";	
					}
			}
			resp.sendRedirect(req.getContextPath() + UrlConst.USER);
			break;
		case UrlConst.USER_INSERT:
			user.setFullName(req.getParameter("fullName"));
			user.setPhoneNumber(req.getParameter("phoneNumber"));
			user.setAddress(req.getParameter("address"));
			user.setEmail(req.getParameter("email"));
			user.setUserPassword(req.getParameter("userPassword"));
			user.setRoleID(Integer.parseInt(req.getParameter("selectRole")));
			if(userDao.insertUser(user) == AuthFilter.SUCCESS_DAO_CODE) {
				message = "Thêm thành công";			
				resp.sendRedirect(req.getContextPath() + UrlConst.USER);
			}else {
				message = "Thêm thất bại";
				resp.sendRedirect(req.getContextPath() + UrlConst.USER);
			}
			
			break;
		case UrlConst.USER_UPDATE:
			user.setUserID(Integer.parseInt(req.getParameter("updateID")));
			user.setEmail(req.getParameter("email"));
			user.setPhoneNumber(req.getParameter("phoneNumber"));
			user.setAddress(req.getParameter("address"));
			user.setUserPassword(req.getParameter("userPassword"));
			user.setFullName(req.getParameter("fullName"));
			user.setRoleID(Integer.parseInt(req.getParameter("selectRole")));
			if(userDao.updateUser(user) == AuthFilter.SUCCESS_DAO_CODE) {
				message = "Cập nhật thành công";
				resp.sendRedirect(req.getContextPath() + UrlConst.USER);			
			}else {
				message = "Cập nhật thất bại";
				resp.sendRedirect(req.getContextPath() + UrlConst.USER);
			}
			break;
		default:
			break;
		}
	}
}
