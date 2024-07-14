package org.example.shoppingproject.filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;

import java.io.IOException;


@WebFilter(filterName = "LoginFilter",urlPatterns = {"/profile"})
public class LogingFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }


    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {


    }

    @Override
    public void destroy() {

    }
}
