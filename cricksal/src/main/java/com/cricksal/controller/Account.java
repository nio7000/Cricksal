package com.cricksal.controller;

import com.cricksal.model.UserModel;
import com.cricksal.service.LoginService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/account")
public class Account extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoginService loginService;

    @Override
    public void init() throws ServletException {
        loginService = new LoginService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("username");
        UserModel member = loginService.getUserByUsername(username);

        if (member != null) {
            session.setAttribute("member", member);
            req.setAttribute("member", member);  // Optional: for JSP direct use
            req.getRequestDispatcher("WEB-INF/pages/account.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("login.jsp?error=User not found");
        }
    }
}
