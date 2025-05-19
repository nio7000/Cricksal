<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/account.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
  <title>Cricket Management System - Member Profile</title>
</head>
<body>
  <jsp:include page="header.jsp" />
  <br><br><br>
  <main class="container">
    <h1 class="page-title">My Account</h1>

    <c:if test="${param.success == '1'}">
      <p class="success-msg">✅ Profile updated successfully!</p>
    </c:if>
    <c:if test="${param.error == '1'}">
      <p class="error-msg">❌ Failed to update profile. Please try again.</p>
    </c:if>

    <div class="tab-content" id="personal-tab">
      <form id="profile-form" action="${pageContext.request.contextPath}/update" method="post">
        <div class="form-section">
          <h3>Personal Information</h3>
          <div class="form-grid">
            <div class="form-group">
              <label class="form-label" for="first-name">First Name</label>
              <input type="text" class="form-control" id="first-name" name="firstName" value="${member.firstName}" required />
            </div>
            <div class="form-group">
              <label class="form-label" for="last-name">Last Name</label>
              <input type="text" class="form-control" id="last-name" name="lastName" value="${member.lastName}" required />
            </div>
            <div class="form-group">
              <label class="form-label" for="email">Email</label>
              <input type="email" class="form-control" id="email" name="email" value="${member.email}" required />
            </div>
            <div class="form-group">
              <label class="form-label" for="phone">Phone</label>
              <input type="tel" class="form-control" id="phone" name="phone" value="${member.phoneNumber}" required />
            </div>
            <div class="form-group">
              <label class="form-label" for="birth-date">Date of Birth</label>
              <input type="date" class="form-control" id="birth-date" name="birthDate" value="${member.birthDate}" required />
            </div>
            <div class="form-group">
              <label class="form-label" for="gender">Gender</label>
              <select class="form-control form-select" id="gender" name="gender">
                <option value="male" ${member.gender == 'male' ? 'selected' : ''}>Male</option>
                <option value="female" ${member.gender == 'female' ? 'selected' : ''}>Female</option>
              </select>
            </div>
            <div class="form-group">
              <label class="form-label" for="role">Role</label>
              <select class="form-control form-select" id="role" name="role">
                <option value="batsman" ${member.playerRole == 'batsman' ? 'selected' : ''}>Batsman</option>
                <option value="bowler" ${member.playerRole == 'bowler' ? 'selected' : ''}>Bowler</option>
                <option value="all-rounder" ${member.playerRole == 'all-rounder' ? 'selected' : ''}>All-rounder</option>
                <option value="wicket-keeper" ${member.playerRole == 'wicket-keeper' ? 'selected' : ''}>Wicket Keeper</option>
              </select>
            </div>
            <div class="form-group">
              <label class="form-label" for="experience">Experience</label>
              <select class="form-control form-select" id="experience" name="experience">
                <option value="less-than-1" ${member.experience == 'less-than-1' ? 'selected' : ''}>Less than 1 year</option>
                <option value="less-than-3" ${member.experience == 'less-than-3' ? 'selected' : ''}>Less than 3 years</option>
                <option value="more-than-3" ${member.experience == 'more-than-3' ? 'selected' : ''}>3+ years</option>
              </select>
            </div>
            <div class="form-group">
              <label class="form-label" for="team-name">Team Name</label>
              <input type="text" class="form-control" id="team-name" name="teamName" value="${member.teamName}" />
            </div>
          </div>
        </div>

        <div class="form-section">
          <h3>Account Security</h3>
          <div class="form-grid">
            <div class="form-group">
              <label class="form-label" for="current-password">Current Password</label>
              <input type="password" class="form-control" id="current-password" name="currentPassword" />
            </div>
            <div class="form-group">
              <label class="form-label" for="new-password">New Password</label>
              <input type="password" class="form-control" id="new-password" name="newPassword" />
            </div>
            <div class="form-group">
              <label class="form-label" for="confirm-password">Confirm New Password</label>
              <input type="password" class="form-control" id="confirm-password" name="confirmPassword" />
            </div>
          </div>
        </div>

        <div class="form-actions">
          <button type="button" class="btn btn-secondary" onclick="history.back()">Cancel</button>
          <button type="submit" class="btn btn-primary">Save Changes</button>
        </div>
      </form>
    </div>
  </main>
  <br><br><br><br>
  <jsp:include page="footer.jsp" />
</body>
</html>
