package cybersoft.javabackend.crm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cybersoft.javabackend.crm.dao.JobDAO;

import cybersoft.javabackend.crm.model.Job;
import cybersoft.javabackend.crm.model.User;
import cybersoft.javabackend.crm.util.JspConst;
import cybersoft.javabackend.crm.util.UrlConst;

@WebServlet(name = "jobController", urlPatterns = { UrlConst.JOB, UrlConst.DELETE_JOB, UrlConst.INSERT_JOB})

public class JobController extends HttpServlet {
	private JobDAO jobDao = null;
	
	public JobController(){
		jobDao = new JobDAO();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {

		resp.setCharacterEncoding("UTF-8");

		
		req.setAttribute("listJob", jobDao.getAll());
		req.getRequestDispatcher(JspConst.JOB).forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String path = req.getServletPath();
		switch (path) {
		case UrlConst.DELETE_JOB:
			
			break;
		case UrlConst.INSERT_JOB:
			Job job = new Job();
			
			job.setJobName(req.getParameter("jobname"));;
			job.setStartDate(req.getParameter("startdate"));
			job.setEndDate(req.getParameter("enddate"));
			jobDao.insertJob(job);
			resp.sendRedirect(req.getContextPath()+UrlConst.JOB);
			break;
		default:
			break;
		}
	}
	
}

