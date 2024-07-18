package org.example.shoppingproject.filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;


@WebFilter(filterName = "LoginFilter",urlPatterns = {"/profile","/createShop","/becomeSeller","/seller/*","/addSavat"})
public class LoginFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req= (HttpServletRequest) request;
        HttpServletResponse res= (HttpServletResponse) response;
        HttpSession session = req.getSession();
        Integer userId =(Integer) session.getAttribute("userId");
        if (userId!=null) {
            filterChain.doFilter(request,response);
        }else {
            res.sendRedirect("/main.jsp");
        }

    }


}
