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
import cybersoft.javabackend.crm.model.Job;
import cybersoft.javabackend.crm.util.JspConst;
import cybersoft.javabackend.crm.util.UrlConst;

@WebServlet(name = "jobController", urlPatterns = { UrlConst.JOB, UrlConst.JOB_DELETE, UrlConst.JOB_INSERT })
public class JobController extends HttpServlet {
	private JobDAO jobDao = null;
	private TaskDAO taskDao = null;
	private UserDAO userDao = null;

	@Override
	public void init() throws ServletException {
		jobDao = new JobDAO();
		taskDao = new TaskDAO();
		userDao = new UserDAO();
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setCharacterEncoding("UTF-8");

		req.setAttribute("listJob", jobDao.getAll());
		req.setAttribute("listTask", taskDao.getAll());
		req.setAttribute("listUser", userDao.getAll());
		req.getRequestDispatcher(JspConst.JOB).forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String path = req.getServletPath();
		switch (path) {
		case UrlConst.JOB_DELETE:

			break;
		case UrlConst.JOB_INSERT:
			Job job = new Job();

			job.setJobName(req.getParameter("jobname"));
			job.setStartDate(req.getParameter("startdate"));
			job.setEndDate(req.getParameter("enddate"));
			jobDao.insertJob(job);
			resp.sendRedirect(req.getContextPath() + UrlConst.JOB);
			break;
		default:
			break;
		}
	}
}