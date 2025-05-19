<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cricksal - Home</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
</head>
<body>

    <jsp:include page="header.jsp" />

    <!-- Hero Section -->
    <div class="hero-section">
        <div class="overlay">
            <div class="hero-content">
                <h1>Welcome to <span class="highlight">Cricksal</span></h1>
                <p>Where the thrill of cricket meets the speed of futsal.</p>
                <a href="#" class="cta-button">Join a Match</a>
            </div>
        </div>
    </div>

    <!-- Features Section -->
    <section class="features">
        <h2>Why Choose Cricksal?</h2>
        <div class="feature-cards">
            <div class="card">
                <img src="${pageContext.request.contextPath}/resources/images/system/Image 1.jpg" alt="Cricketers" />
                <h3>Fast & Furious</h3>
                <p>Experience short-format cricket in an enclosed arena with high energy and intensity.</p>
            </div>
            <div class="card">
                <img src="${pageContext.request.contextPath}/resources/images/system/Indoor Cricket Background.jpg" alt="Indoor Cricket" />
                <h3>Indoor Setup</h3>
                <p>No weather worries – play under roof with pro nets, lighting, and padded walls.</p>
            </div>
            <div class="card">
                <img src="${pageContext.request.contextPath}/resources/images/system/community.jpeg" alt="Team" />
                <h3>Community Driven</h3>
                <p>Join a community of passionate players and enjoy weekly tournaments and leagues.</p>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <jsp:include page="footer.jsp" />
</body>
</html>
