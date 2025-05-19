package com.cricksal.controller;

import java.io.IOException;
import java.util.List;

import com.cricksal.dao.UserDAO;
import com.cricksal.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin")
public class Admin extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<UserModel> userList = userDAO.getAllUsers();
        System.out.println("Fetched users from DB: " + userList.size()); // debug log
        req.setAttribute("userList", userList);
        req.getRequestDispatcher("WEB-INF/pages/admin.jsp").forward(req, resp);
    }
}
