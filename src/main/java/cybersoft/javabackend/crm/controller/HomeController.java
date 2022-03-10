package cybersoft.javabackend.crm.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cybersoft.javabackend.crm.connection.MySQLConnection;
import cybersoft.javabackend.crm.dao.RoleDAO;
import cybersoft.javabackend.crm.dao.UserDAO;
import cybersoft.javabackend.crm.model.Role;
import cybersoft.javabackend.crm.model.User;
import cybersoft.javabackend.crm.util.JspConst;
import cybersoft.javabackend.crm.util.UrlConst;

@WebServlet(name = "homeController", urlPatterns = UrlConst.HOME)
public class HomeController extends HttpServlet {


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute("currentUser");

		req.getRequestDispatcher(JspConst.HOME).forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.removeAttribute("currentUser");
		resp.sendRedirect(req.getContextPath() + UrlConst.LOGIN);
	}
}
