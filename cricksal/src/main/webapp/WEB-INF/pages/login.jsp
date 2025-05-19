<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login to Your Account</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="login-container">
        <div class="overlay">
            <div class="login-box">
                <h2>Login</h2>

                <%-- Error message display --%>
                <c:if test="${not empty error}">
                    <div class="error-message">
                        ${error}
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/login" method="post">
                    <div class="row">
                        <div class="col">
                            <label for="username">Username:</label>
                            <input type="text" id="username" name="username" placeholder="Enter your username" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="password">Password:</label>
                            <input type="password" id="password" name="password" placeholder="Enter your password" required>
                        </div>
                    </div>
                    <div class="row">
                        <button type="submit" class="login-button">
                            Login
                        </button>
                    </div>
                </form>

                <div class="row">
                    <a href="${pageContext.request.contextPath}/forgotpassword" class="forgot-button">
                        Forgot Password
                    </a>
                </div>
                <div class="row">
                    <a href="${pageContext.request.contextPath}/register" class="register-button">
                        Create new account
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>