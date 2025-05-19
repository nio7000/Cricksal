package com.cricksal.controller;

import com.cricksal.model.UserModel;
import com.cricksal.service.RegisterService;
import com.cricksal.util.PasswordUtil;
import com.cricksal.util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RegisterService registerService;
    private ValidationUtil validationUtil;

    @Override
    public void init() throws ServletException {
        this.registerService = new RegisterService();
        this.validationUtil = new ValidationUtil();
    }

    // Handle GET request for rendering the registration page
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
    }

    // Handle POST request for form submission
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Get form parameters (field names from JSP!)
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String retypePassword = request.getParameter("retypePassword");
        String phoneNumber = request.getParameter("phone");

        int roleId = 2; // default user role

        // Validate inputs
        String errorMessage = validateInputs(firstName, lastName, username, email, 
                                             password, retypePassword, phoneNumber);

        if (errorMessage != null) {
            request.setAttribute("errorMessages", errorMessage);
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
            return;
        }

        if (registerService.usernameExists(username)) {
            request.setAttribute("errorMessages", "Username already exists");
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
            return;
        }

        if (registerService.emailExists(email)) {
            request.setAttribute("errorMessages", "Email already registered");
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
            return;
        }

        // Encrypt password using PasswordUtil
        String encryptedPassword = PasswordUtil.encrypt(username, password);

        // Create and populate user model
        UserModel user = new UserModel(firstName, lastName, username, email,
                                       encryptedPassword, phoneNumber, roleId);

        boolean success = registerService.registerUser(user);

        if (success) {
            // Set success attribute and redirect to login page
            request.getSession().setAttribute("registrationSuccess", true);
            response.sendRedirect(request.getContextPath() + "/login");
        } else {
            // If registration fails, show error message
            request.setAttribute("errorMessages", "Registration failed. Please try again.");
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
        }
    }

    private String validateInputs(String firstName, String lastName, String username,
            String email, String password, String retypePassword,
            String phoneNumber) {

        if (validationUtil.isNullOrEmpty(firstName) || validationUtil.isNullOrEmpty(lastName) || 
            validationUtil.isNullOrEmpty(username) || validationUtil.isNullOrEmpty(email) ||
            validationUtil.isNullOrEmpty(password) || validationUtil.isNullOrEmpty(retypePassword)) {
            return "All fields are required";
        }

        if (!validationUtil.isAlphabetic(firstName)) {
            return "First name should contain only letters";
        }

        if (!validationUtil.isAlphabetic(lastName)) {
            return "Last name should contain only letters";
        }

        if (!validationUtil.isAlphanumericStartingWithLetter(username)) {
            return "Username must be 4-20 alphanumeric characters and start with a letter";
        }

        if (!validationUtil.isValidEmail(email)) {
            return "Invalid email format";
        }

        if (!validationUtil.isValidPassword(password)) {
            return "Password must be at least 8 characters long, with uppercase, lowercase, a digit, and a special character";
        }

        if (!validationUtil.doPasswordsMatch(password, retypePassword)) {
            return "Passwords do not match";
        }

        if (!validationUtil.isValidPhoneNumber(phoneNumber)) {
            return "Phone number must start with 98 and be 10 digits long";
        }

        return null;
    }
}