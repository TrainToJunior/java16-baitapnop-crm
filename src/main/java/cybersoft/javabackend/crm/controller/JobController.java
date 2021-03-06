package cybersoft.javabackend.crm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cybersoft.javabackend.crm.dao.JobDAO;
import cybersoft.javabackend.crm.dao.StatusDAO;
import cybersoft.javabackend.crm.dao.TaskDAO;
import cybersoft.javabackend.crm.dao.UserDAO;
import cybersoft.javabackend.crm.filter.AuthFilter;
import cybersoft.javabackend.crm.model.Job;
import cybersoft.javabackend.crm.model.User;
import cybersoft.javabackend.crm.util.JspConst;
import cybersoft.javabackend.crm.util.UrlConst;

@WebServlet(name = "jobController", urlPatterns = { UrlConst.JOB, UrlConst.JOB_DELETE, UrlConst.JOB_INSERT, UrlConst.JOB_UPDATE })
public class JobController extends HttpServlet {
	private JobDAO jobDao = null;
	private TaskDAO taskDao = null;
	private UserDAO userDao = null;
	private String message = "";
	private String error = "";
	@Override
	public void init() throws ServletException {
		jobDao = new JobDAO();
		taskDao = new TaskDAO();
		userDao = new UserDAO();
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute("currentUser");		
		req.setAttribute("currentUser", currentUser);
		req.setAttribute("currentUserRoleID", currentUser.getRoleID());
		req.setAttribute("listJobCurrentUser", jobDao.getAllJobCurrentUser(currentUser.getUserID()));
		req.setAttribute("listJob", jobDao.getAll());
		req.setAttribute("listTask", taskDao.getAll());
		req.setAttribute("listUser", userDao.getAll());
		req.setAttribute("roleAdmin", AuthFilter.ROLE_ADMIN);
		req.setAttribute("roleLeader", AuthFilter.ROLE_LEADER);
		req.setAttribute("roleMember", AuthFilter.ROLE_MEMBER);
		req.setAttribute("message", message);
		req.setAttribute("error", error);
		message = "";
		error = "";
		req.getRequestDispatcher(JspConst.JOB).forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute("currentUser");	
		String path = req.getServletPath();
		Job job = new Job();
		switch (path) {
		case UrlConst.JOB_DELETE:
			if(jobDao.deleteJobByID(Integer.parseInt(req.getParameter("deleteID")))==AuthFilter.SUCCESS_DAO_CODE) {				
				message = "X??a th??nh c??ng";
			}else {
				message = "X??a th??nh c??ng";
				error = "true";
			}
			resp.sendRedirect(req.getContextPath() + UrlConst.JOB);
			
			break;
		case UrlConst.JOB_INSERT:
			job.setJobName(req.getParameter("jobName"));
			job.setJobDescription(req.getParameter("jobDescription"));
			job.setUserCreatedID(currentUser.getUserID());
			job.setStartDate(req.getParameter("startDate"));
			job.setEndDate(req.getParameter("endDate"));
			if(jobDao.insertJob(job) == AuthFilter.SUCCESS_DAO_CODE) {
				message = "Th??m th??nh c??ng";				
			}else {
				message = "Th??m kh??ng th??nh c??ng";				
				error = "true";
			}
			resp.sendRedirect(req.getContextPath() + UrlConst.JOB);
			break;
		case UrlConst.JOB_UPDATE:	
			job.setJobName(req.getParameter("jobName"));
			job.setJobDescription(req.getParameter("jobDescription"));
			job.setUserCreatedID(currentUser.getUserID());
			job.setStartDate(req.getParameter("startDate"));
			job.setEndDate(req.getParameter("endDate"));
			if(jobDao.updateJob(job,Integer.parseInt(req.getParameter("updateID")))==AuthFilter.SUCCESS_DAO_CODE) {
				message = "C???p nh???t th??nh c??ng";				
			}else {
				message = "C???p nh???t kh??ng th??nh c??ng";
				error = "true";
			}
			resp.sendRedirect(req.getContextPath() + UrlConst.JOB);
			break;
		default:
			resp.sendRedirect(req.getContextPath() + JspConst.ROLE);
			break;
		}
	}
}