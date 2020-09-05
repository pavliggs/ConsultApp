package filters;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

public class AuthorizedFilter implements Filter {
    // пути, на которые не влияет фильтр
    private static final Set<String> ALLOWED_PATHS = Collections.unmodifiableSet(new HashSet<>(
            Arrays.asList("/login", "/registration", "/user-auth", "/successful-registration")));

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession();
//        String path = request.getRequestURI().substring(request.getContextPath().length()).replaceAll("[/]+$", "");
//
//        boolean allowedPath = ALLOWED_PATHS.contains(path);
//
//        if (allowedPath || session.getAttribute("login") != null) {
//            filterChain.doFilter(req, resp);
//        } else {
//            response.sendRedirect("/login");
//        }

        if (session.getAttribute("login") == null) {
            response.sendRedirect("login");
        } else
            filterChain.doFilter(req, resp);
    }

    @Override
    public void destroy() {
    }
}
