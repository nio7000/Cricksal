package com.cricksal.controller;

import java.io.IOException;

import com.cricksal.model.UserModel;
import com.cricksal.service.LoginService;
import com.cricksal.util.CookiesUtil;
import com.cricksal.util.RedirectionUtil;
import com.cricksal.util.SessionUtil;
import com.cricksal.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ValidationUtil validationUtil;
    private RedirectionUtil redirectionUtil;
    private LoginService loginService;

    @Override
    public void init() throws ServletException {
        this.validationUtil = new ValidationUtil();
        this.redirectionUtil = new RedirectionUtil();
        this.loginService = new LoginService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (validationUtil.isNullOrEmpty(username) || validationUtil.isNullOrEmpty(password)) {
            redirectionUtil.setMsgAndRedirect(req, resp, "error", "Please fill all the fields!", "/login");
            return;
        }

        boolean loginSuccess = loginService.loginUser(username, password);

        if (loginSuccess) {
            UserModel loggedInUser = loginService.getUserByUsername(username);

            if (loggedInUser != null) {
                SessionUtil.setAttribute(req, "username", username);
                SessionUtil.setAttribute(req, "member", loggedInUser);

                int roleId = loggedInUser.getRoleId();

                if (roleId == 1) {
                    CookiesUtil.addCookie(resp, "role", "admin", 5 * 60);
                    resp.sendRedirect(req.getContextPath() + "/admin");
                } else {
                    CookiesUtil.addCookie(resp, "role", "user", 5 * 60);
                    resp.sendRedirect(req.getContextPath() + "/home");
                }
                return;
            }
        }

        req.setAttribute("error", "User credential mismatch. Please try again!");
        req.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(req, resp);
    }
}
