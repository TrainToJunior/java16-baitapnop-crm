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

import cybersoft.javabackend.crm.model.User;
import cybersoft.javabackend.crm.util.JspConst;
import cybersoft.javabackend.crm.util.UrlConst;

@WebFilter(filterName = "authFilter", urlPatterns = UrlConst.GLOBAL)
public class AuthFilter implements Filter {
	public static final int ROLE_ADMIN = 1;
	public static final int ROLE_LEADER = 2;
	public static final int ROLE_MEMBER = 3;
	public static final int SUCCESS_DAO_CODE = 1;

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;

//		// code xử lý request trước khi vào servlet
		String path = req.getServletPath();
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute("currentUser");
		String accept = req.getHeader("accept");

		// Since the filter handles every request
		// we have to ensure that the request is asking for text/html
		if (accept == null || !accept.toLowerCase().startsWith("text/html")) {
			chain.doFilter(request, response);
			return;
		}
		if (!(path.startsWith(UrlConst.LOGIN))) {
			// Nếu không có currentUser (chưa đăng nhập)
			if (currentUser == null) {
				// Về trang đăng nhập
				resp.sendRedirect(req.getContextPath() + UrlConst.LOGIN); 
			} else {
				// kiểm tra role
				int currentRoleID = currentUser.getRoleID();
				// Nếu là admin thì toàn quyền
				if (currentRoleID == ROLE_ADMIN) {
					chain.doFilter(request, response);
				} else if (currentRoleID == ROLE_LEADER) { // nếu là leader thì không đc vào các trang dưới
					if (path.startsWith(UrlConst.USER_INSERT) || (path.startsWith(UrlConst.USER_DELETE))
							|| (path.startsWith(UrlConst.USER_UPDATE))) {
						resp.sendRedirect(req.getContextPath() + JspConst.ROLE); // trả về trang không được vào
					} else {
						// ngoài các trang trên thì cho phép
						chain.doFilter(request, response);
					}
				} else if (currentRoleID == ROLE_MEMBER) { // nếu là member thì ngoài các trang dưới còn lại không đc phép vào
					if (!((path.startsWith(UrlConst.LOGIN)) || (path.startsWith(UrlConst.TASK))
							|| (path.startsWith(UrlConst.HOME)) || (path.startsWith(JspConst.ROLE)))) {
						resp.sendRedirect(req.getContextPath() + JspConst.ROLE); // trả về trang không được vào
					} else {
						// chỉ có trang login, home, task đc vào
						chain.doFilter(request, response);
					}
				}
			}
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
