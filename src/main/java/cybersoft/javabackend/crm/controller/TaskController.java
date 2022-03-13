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
import cybersoft.javabackend.crm.util.JspConst;
import cybersoft.javabackend.crm.util.UrlConst;

@WebServlet(name = "taskController", urlPatterns = { UrlConst.TASK, UrlConst.TASK_DELETE, UrlConst.TASK_INSERT,
		UrlConst.TASK_UPDATE })
public class TaskController extends HttpServlet {

	private TaskDAO taskDao = null;
	private UserDAO userDao = null;
	private StatusDAO statusDao = null;
	private JobDAO jobDao = null;

	private String message = "";
	
	@Override
	public void init() throws ServletException {
		taskDao = new TaskDAO();
		userDao = new UserDAO();
		statusDao = new StatusDAO();
		jobDao = new JobDAO();
		super.init();
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("listTask", taskDao.getAll());
		req.setAttribute("listUser", userDao.getAll());
		req.setAttribute("listStatus", statusDao.getAll());
		req.setAttribute("listJob", jobDao.getAll());
		req.setAttribute("message", message);
		message = "";
		req.getRequestDispatcher(JspConst.TASK).forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String path = req.getServletPath();
		Task task = new Task();
		switch (path) {
		case UrlConst.TASK_DELETE:
			taskDao.deleteTaskByID(Integer.parseInt(req.getParameter("deleteID")));
			message = "Xóa thành công";
			resp.sendRedirect(req.getContextPath() + UrlConst.TASK);
			break;
		case UrlConst.TASK_INSERT:

			task.setTaskName(req.getParameter("taskname"));
			task.setStartDate(req.getParameter("startdate"));
			task.setEndDate(req.getParameter("enddate"));
			task.setUserID(Integer.parseInt(req.getParameter("selectuser")));
			task.setJobID(Integer.parseInt(req.getParameter("selectjob")));
			task.setStatusID(Integer.parseInt(req.getParameter("selectstatus")));

			taskDao.insertTask(task);
			message = "Thêm thành công";
			resp.sendRedirect(req.getContextPath() + UrlConst.TASK);
			break;
		case UrlConst.TASK_UPDATE:
			task.setTaskName(req.getParameter("taskname"));
			task.setStartDate(req.getParameter("startdate"));
			task.setEndDate(req.getParameter("enddate"));
			task.setUserID(Integer.parseInt(req.getParameter("selectuser")));
			task.setJobID(Integer.parseInt(req.getParameter("selectjob")));
			task.setStatusID(Integer.parseInt(req.getParameter("selectstatus")));
			taskDao.updateTask(task,Integer.parseInt(req.getParameter("updateID")) );
			message = "Cập nhật thành công";
			resp.sendRedirect(req.getContextPath() + UrlConst.TASK);
			break;
		default:
			break;
		}
	}
}