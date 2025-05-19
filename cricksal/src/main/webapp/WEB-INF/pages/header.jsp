<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="header">
	<header class="header">
		<h1 class="logo">
			<a href=""><img src="${pageContext.request.contextPath}/resources/images/system/logooo.png" /></a>
		</h1>
		<ul class="main-nav">
			<li><a href="${pageContext.request.contextPath}/home">Home</a></li>
			<li><a href="${pageContext.request.contextPath}/about">About</a></li>
			<li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
			<li><a href="${pageContext.request.contextPath}/account">My Account</a></li>
			<li><a href="${pageContext.request.contextPath}/login">Log Out</a></li>
			<li><a href="${pageContext.request.contextPath}/register">Register</a></li>
		</ul>
	</header>
</div>