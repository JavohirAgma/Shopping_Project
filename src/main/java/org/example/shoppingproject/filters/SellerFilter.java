package org.example.shoppingproject.filters;


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.shoppingproject.enums.UserRole;
import org.example.shoppingproject.model.User;
import org.example.shoppingproject.service.UserService;

import java.io.IOException;
import java.util.List;

@WebFilter(filterName = "SellerFilter" , urlPatterns = "/seller/createShop")
public class SellerFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req= (HttpServletRequest) servletRequest;
        HttpServletResponse res= (HttpServletResponse) servletResponse;
        HttpSession session = req.getSession();
        Integer userId =(Integer) session.getAttribute("userId");
        UserService userService= new UserService();
        User user = userService.get(userId);
        List<UserRole> role = user.getRole();
        if (userId!=null) { 
            Boolean check=false;
            for (UserRole userRole : role) {
                if (userRole.equals(UserRole.CONSUMER)) {
                    check=true;
                }
            }
            if (check){
                filterChain.doFilter(servletRequest,servletResponse);
            }else {
                System.out.println("Keldi");
                res.sendError(403, "Not authorized");
            }
        }else {
            System.out.println("betga keldi");
            res.sendRedirect("/main.jsp");
        }
        System.out.println("hech qaysi mas");
    }
}
