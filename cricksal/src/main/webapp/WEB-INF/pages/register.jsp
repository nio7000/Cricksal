<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Form</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Segoe+UI:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp" />

<!-- Hero Section with Background Image -->
<div class="hero-section">
    <div class="overlay">
        <div class="hero-content">
            <h1>Registration Form</h1>

            <!-- Show error messages if any -->
            <%
            String errorMessages = (String) request.getAttribute("errorMessages");
            if (errorMessages != null) {
            %>
            <div class="error-message">
                <%= errorMessages %>
            </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/register" method="post">
                <div class="row">
                    <div class="col">
                        <label for="firstName">First Name:</label>
                        <input type="text" id="firstName" name="firstName" placeholder=" " required>
                        <i class="validation-icon"></i>
                    </div>
                    <div class="col">
                        <label for="lastName">Last Name:</label>
                        <input type="text" id="lastName" name="lastName" placeholder=" " required>
                        <i class="validation-icon"></i>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col">
                        <label for="username">Username:</label>
                        <input type="text" id="username" name="username" placeholder=" " required>
                        <i class="validation-icon"></i>
                    </div>
                    <div class="col">
                        <label for="birthday">Date of Birth:</label>
                        <input type="date" id="birthday" name="dob" required>
                        <i class="validation-icon"></i>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col">
                        <label for="gender">Gender:</label>
                        <select id="gender" name="gender" required>
                            <option value="" disabled selected>Select Gender</option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                        </select>
                    </div>
                    <div class="col">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" placeholder=" " required>
                        <i class="validation-icon"></i>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col">
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" placeholder=" " required>
                        <i class="validation-icon"></i>
                    </div>
                    <div class="col">
                        <label for="retypePassword">Retype Password:</label>
                        <input type="password" id="retypePassword" name="retypePassword" placeholder=" " required>
                        <i class="validation-icon"></i>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col">
                        <label for="phone">Phone Number:</label>
                        <input type="tel" id="phone" name="phone" placeholder=" " required>
                        <i class="validation-icon"></i>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col">
                        <label for="image">Profile Picture</label>
                        <input type="file" id="image" name="image">
                    </div>
                </div>

                <!-- Buttons Row -->
                <div class="row buttons-row">
                    <button type="submit" class="submit-button">Submit</button>
                    <a href="${pageContext.request.contextPath}/login" class="login-button">Login</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>