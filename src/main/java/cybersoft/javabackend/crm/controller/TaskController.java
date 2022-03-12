package cybersoft.javabackend.crm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cybersoft.javabackend.crm.dao.TaskDAO;
import cybersoft.javabackend.crm.dao.UserDAO;
import cybersoft.javabackend.crm.util.JspConst;
import cybersoft.javabackend.crm.util.UrlConst;
@WebServlet (name = "taskController", urlPatterns = UrlConst.TASK)
public class TaskController extends HttpServlet {
	
	private TaskDAO taskDao = null;
	private UserDAO userDao = null;
	
	public TaskController() {
		taskDao = new TaskDAO();
		userDao = new UserDAO();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		req.setAttribute("listTask", taskDao.getAll());
		req.setAttribute("listUser", userDao.getAll());
		
		req.getRequestDispatcher(JspConst.TASK).forward(req, resp);
	}
}
