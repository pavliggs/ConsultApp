package filters;

import javax.servlet.*;
import java.io.IOException;

public class CharsetFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException {
        if (req.getCharacterEncoding() == null)
            req.setCharacterEncoding("UTF-8");

        resp.setCharacterEncoding("UTF-8");

        filterChain.doFilter(req, resp);
    }

    @Override
    public void destroy() {
    }
}
