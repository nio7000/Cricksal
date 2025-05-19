package com.cricksal.controller;

import java.io.IOException;
import java.util.List;

import com.cricksal.model.UserModel;
import com.cricksal.service.UserManagementService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/users")
public class UserManagementController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserManagementService userService;
    
    @Override
    public void init() throws ServletException {
        userService = new UserManagementService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get user ID from request parameter if any (for edit operation)
            String userIdParam = request.getParameter("userId");
            if (userIdParam != null && !userIdParam.isEmpty()) {
                int userId = Integer.parseInt(userIdParam);
                UserModel selectedUser = userService.getUserById(userId);
                request.setAttribute("selectedUser", selectedUser);
            }
            
            // Get all users for display
            List<UserModel> users = userService.getAllUsers();
            request.setAttribute("userList", users);
            
            // Forward to the JSP page
            request.getRequestDispatcher("/WEB-INF/pages/userManagement.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            String message = null;
            
            // Extract common form fields
            String userIdParam = request.getParameter("userId");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String phoneNumber = request.getParameter("phoneNumber");
            int roleId = Integer.parseInt(request.getParameter("roleId"));
            
            // Process according to the action
            switch (action) {
                case "create":
                    if (userService.createUser(firstName, lastName, username, email, password, phoneNumber, roleId)) {
                        message = "User created successfully.";
                    } else {
                        message = "Error: Failed to create user.";
                    }
                    break;
                    
                case "update":
                    if (userIdParam != null && !userIdParam.isEmpty()) {
                        int userId = Integer.parseInt(userIdParam);
                        if (userService.updateUser(userId, firstName, lastName, username, email, password, phoneNumber, roleId)) {
                            message = "User updated successfully.";
                        } else {
                            message = "Error: Failed to update user.";
                        }
                    } else {
                        message = "Error: No user selected for update.";
                    }
                    break;
                    
                case "delete":
                    if (userIdParam != null && !userIdParam.isEmpty()) {
                        int userId = Integer.parseInt(userIdParam);
                        if (userService.deleteUser(userId)) {
                            message = "User deleted successfully.";
                        } else {
                            message = "Error: Failed to delete user.";
                        }
                    } else {
                        message = "Error: No user selected for deletion.";
                    }
                    break;
                    
                default:
                    message = "Error: Invalid action.";
                    break;
            }
            
            // Set message attribute and redirect to GET
            request.getSession().setAttribute("message", message);
            response.sendRedirect(request.getContextPath() + "/users");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("message", "Error: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/users");
        }
    }
}