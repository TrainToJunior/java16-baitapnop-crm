package cybersoft.javabackend.crm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cybersoft.javabackend.crm.dao.JobDAO;
import cybersoft.javabackend.crm.dao.StatusDAO;
import cybersoft.javabackend.crm.dao.TaskDAO;
import cybersoft.javabackend.crm.dao.UserDAO;
import cybersoft.javabackend.crm.model.Task;
import cybersoft.javabackend.crm.model.User;
import cybersoft.javabackend.crm.util.JspConst;
import cybersoft.javabackend.crm.util.UrlConst;
@WebServlet (name = "taskController", urlPatterns = {UrlConst.TASK, UrlConst.INSERT_TASK, UrlConst.DELETE_TASK})
public class TaskController extends HttpServlet {
	
	private TaskDAO taskDao = null;
	private UserDAO userDao = null;
	private StatusDAO statusDao = null;
	private JobDAO jobDao = null;
	
	public TaskController() {
		taskDao = new TaskDAO();
		userDao = new UserDAO();
		statusDao = new StatusDAO();
		jobDao = new JobDAO();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		req.setAttribute("listTask", taskDao.getAll());
		req.setAttribute("listUser", userDao.getAll());
		req.setAttribute("listStatus", statusDao.getAll());
		req.setAttribute("listJob", jobDao.getAll());
		
		req.getRequestDispatcher(JspConst.TASK).forward(req, resp);
	}
		
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String path = req.getServletPath();
		switch (path) {
		case UrlConst.DELETE_TASK:
			
			break;
		case UrlConst.INSERT_TASK:
			
			Task task = new Task();
			task.setTaskName(req.getParameter("taskname"));
			task.setStartDate(req.getParameter("startdate"));
			task.setEndDate(req.getParameter("enddate"));
			task.setUserID(Integer.parseInt(req.getParameter("selectuser")));
			task.setJobID(Integer.parseInt(req.getParameter("selectjob")));
			task.setStatusID(Integer.parseInt(req.getParameter("selectstatus")));
			
			taskDao.insertTask(task);
						
			resp.sendRedirect(req.getContextPath()+UrlConst.TASK);
			break;
		default:
			break;
		}
	}
}