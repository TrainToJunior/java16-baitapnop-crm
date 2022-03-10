package cybersoft.javabackend.crm.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cybersoft.javabackend.crm.util.JspConst;
import cybersoft.javabackend.crm.util.UrlConst;

@WebFilter(filterName = "authFilter", urlPatterns = UrlConst.GLOBAL)
public class AuthFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;

//		// code xử lý request trước khi vào servlet
		String path = req.getServletPath();
		HttpSession session = req.getSession();
		Object currentUser = session.getAttribute("currentUser");
		String accept = req.getHeader("accept");

		// Since the filter handles every request
		// we have to ensure that the request is asking for text/html
		if (accept == null || !accept.toLowerCase().startsWith("text/html")) {
			chain.doFilter(request, response);
			return;
		}
		if (!(path.startsWith(UrlConst.LOGIN))) {
			if (currentUser == null) {
				resp.sendRedirect(req.getContextPath() + UrlConst.LOGIN);
			} else {
				chain.doFilter(req, resp); // Sau khi xử lý xong request -> cho chạy tiếp
				return;
			}
			// Nếu không có currentUser (chưa đăng nhập)
		} else {
			chain.doFilter(req, resp); // Sau khi xử lý xong request -> cho chạy tiếp
			return;
		}

	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}
