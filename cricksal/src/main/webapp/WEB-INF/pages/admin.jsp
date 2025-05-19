<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page import="com.cricksal.model.UserModel" %>

<%
@SuppressWarnings("unchecked")
List<UserModel> userList = (List<UserModel>) request.getAttribute("userList");
Integer totalMembers = (userList != null) ? userList.size() : 0;
List<UserModel> recentMembers = (userList != null) ? userList.stream()
    .sorted((u1, u2) -> Integer.compare(u2.getUserId(), u1.getUserId()))
    .limit(10)
    .collect(Collectors.toList()) : null;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cricksal Admin Dashboard</title>
    <link rel="stylesheet" href="css/admin.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-left">
            <button class="menu-toggle" id="menuToggle">
                <i class="fas fa-bars"></i>
            </button>
            <div class="logo">
                <i class="fas fa-cricket-ball"></i>
                <span>Cricksal</span>
            </div>
        </div>
        <div class="header-center">
            <div class="search-container">
                <i class="fas fa-search"></i>
                <input type="text" placeholder="Search members..." class="search-input">
            </div>
        </div>
        <div class="header-right">
            <div class="admin-profile">
                <img src="resources/images/system/team4.png" alt="Admin" class="profile-img">
                <span class="admin-name">Nikesh Oli</span>
            </div>
        </div>
    </header>

    <!-- Sidebar -->
    <aside class="sidebar" id="sidebar">
        <nav class="nav-menu">
            <ul>
                <li class="nav-item active">
                    <a href="${pageContext.request.contextPath}/admin">
                        <i class="fas fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/users">
                        <i class="fas fa-users"></i>
                        <span>Members</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/login" onclick="logout()">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>Logout</span>
                    </a>
                </li>
            </ul>
        </nav>
    </aside>

    <!-- Main Content -->
    <main class="main-content">
        <!-- Dashboard -->
        <div id="dashboard" class="page active">
            <div class="page-header">
                <h1>Dashboard Overview</h1>
            </div>

            <!-- Stats Cards -->
            <div class="stats-grid">
                <div class="stat-card members">
                    <div class="stat-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <div class="stat-info">
                        <div class="stat-label">Active Members</div>
                        <div class="stat-value"><%= totalMembers %></div>
                        <div class="stat-change positive">Current registered members</div>
                    </div>
                </div>
            </div>

            <!-- Recently Added Members Table -->
            <div class="card large-table">
                <div class="card-header">
                    <h3>Recently Added Members</h3>
                    <div class="card-actions">
                        <a href="${pageContext.request.contextPath}/users" class="btn btn-text">View All</a>
                    </div>
                </div>
                <div class="card-content">
                    <div class="table-container">
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>Full Name</th>
                                    <th>Username</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if (recentMembers != null && !recentMembers.isEmpty()) {
                                    for (UserModel user : recentMembers) { %>
                                <tr>
                                    <td>
                                        <div class="member-info">
                                            <img src="resources/images/system/team<%= (user.getUserId() % 4) + 1 %>.png" alt="<%= user.getFirstName() %>" class="member-avatar">
                                            <span><%= user.getFirstName() %> <%= user.getLastName() %></span>
                                        </div>
                                    </td>
                                    <td><%= user.getUsername() %></td>
                                    <td><%= user.getEmail() %></td>
                                    <td><%= user.getRoleName() %></td>
                                </tr>
                                <% }
                                } else { %>
                                <tr>
                                    <td colspan="4" style="text-align: center">No recent members found</td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script>
        function logout() {
            // Client-side logout logic or redirect (if needed)
        }

        document.getElementById('menuToggle').addEventListener('click', function() {
            document.getElementById('sidebar').classList.toggle('collapsed');
            document.querySelector('.main-content').classList.toggle('expanded');
        });
    </script>
</body>
</html>
