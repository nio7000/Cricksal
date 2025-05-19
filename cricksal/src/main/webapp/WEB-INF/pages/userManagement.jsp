<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.cricksal.model.UserModel" %>

<%
@SuppressWarnings("unchecked")
List<UserModel> userList = (List<UserModel>) request.getAttribute("userList");
String message = (String) request.getSession().getAttribute("message");
UserModel selectedUser = (UserModel) request.getAttribute("selectedUser");

// Clear the session message after retrieving it
if (message != null) {
    request.getSession().removeAttribute("message");
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Management</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userManagement.css" />
    <style>
        /* Enhanced dropdown styling */
        select {
            appearance: none;
            background-color: #f8f9fa;
            border: 1px solid #ddd;
            border-radius: 6px;
            padding: 12px 15px;
            width: 100%;
            font-size: 15px;
            cursor: pointer;
            box-shadow: 0 2px 5px rgba(0,0,0,0.08);
            transition: all 0.3s;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%235c6ac4' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 20px;
        }
        
        select:hover, select:focus {
            border-color: #5c6ac4;
            box-shadow: 0 3px 8px rgba(92, 106, 196, 0.15);
            outline: none;
        }
        
        /* Enhanced action buttons */
        .btn-container {
            display: flex;
            justify-content: space-between;
            margin-top: 25px;
            gap: 15px;
        }
        
        .action-btn {
            flex: 1;
            padding: 14px 0;
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 3px 6px rgba(0,0,0,0.1);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .create-btn {
            background-color: #28a745;
            color: white;
        }
        
        .update-btn {
            background-color: #007bff;
            color: white;
        }
        
        .delete-btn {
            background-color: #dc3545;
            color: white;
        }
        
        .clear-btn {
            background-color: #6c757d;
            color: white;
        }
        
        .action-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 10px rgba(0,0,0,0.2);
            filter: brightness(110%);
        }
        
        .action-btn:active {
            transform: translateY(0);
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
    </style>
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

    <!-- Sidebar Menu -->
    <aside class="sidebar" id="sidebar">
        <nav class="nav-menu">
            <ul>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/admin" data-page="dashboard">
                        <i class="fas fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li class="nav-item active">
                    <a href="${pageContext.request.contextPath}/users" data-page="members">
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

    <div class="main-content">
        <% if (message != null) { %>
        <div class="message <%= message.startsWith("Error") ? "error" : "success" %>">
            <%= message %>
        </div>
        <% } %>

        <!-- For the form section -->
        <div class="section-header">
            <h2>Member Credentials</h2>
            <p>Add or update member information and access credentials</p>
        </div>

        <div class="form-container">
            <form id="userForm" action="users" method="post">
                <input type="hidden" id="userId" name="userId" value="<%= selectedUser != null ? selectedUser.getUserId() : "" %>">
                <input type="hidden" id="action" name="action" value="">

                <div class="form-row">
                    <div class="form-group">
                        <label for="firstName">First Name</label>
                        <input type="text" id="firstName" name="firstName" value="<%= selectedUser != null ? selectedUser.getFirstName() : "" %>" required>
                    </div>
                    <div class="form-group">
                        <label for="lastName">Last Name</label>
                        <input type="text" id="lastName" name="lastName" value="<%= selectedUser != null ? selectedUser.getLastName() : "" %>" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" value="<%= selectedUser != null ? selectedUser.getUsername() : "" %>" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" value="<%= selectedUser != null ? selectedUser.getEmail() : "" %>" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="phoneNumber">Phone Number</label>
                        <input type="text" id="phoneNumber" name="phoneNumber" value="<%= selectedUser != null ? selectedUser.getPhoneNumber() : "" %>" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" <%= selectedUser == null ? "required" : "" %> placeholder="<%= selectedUser != null ? "Leave blank to keep current password" : "Enter password" %>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="roleId">Role</label>
                        <select id="roleId" name="roleId" required>
                            <option value="1" <%= selectedUser != null && selectedUser.getRoleId() == 1 ? "selected" : "" %>>Admin</option>
                            <option value="2" <%= selectedUser != null && selectedUser.getRoleId() == 2 ? "selected" : "" %>>User</option>
                        </select>
                    </div>
                </div>

                <div class="btn-container">
                    <button type="button" class="action-btn create-btn" onclick="submitForm('create')">Create</button>
                    <button type="button" class="action-btn update-btn" onclick="submitForm('update')">Update</button>
                    <button type="button" class="action-btn delete-btn" onclick="submitForm('delete')">Delete</button>
                    <button type="button" class="action-btn clear-btn" onclick="clearForm()">Clear</button>
                </div>
            </form>
        </div>

        <!-- For the table section -->
        <div class="section-header">
            <h2>Member List</h2>
            <p>View and manage all registered members</p>
        </div>

        <div class="table-container">
            <table class="user-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Role</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (userList != null && !userList.isEmpty()) {
                        int index = 1;
                        for (UserModel user : userList) { %>
                    <tr data-id="<%= user.getUserId() %>" onclick="selectUser(this)">
                        <td><%= index++ %></td>
                        <td><%= user.getFirstName() %> <%= user.getLastName() %></td>
                        <td><%= user.getUsername() %></td>
                        <td><%= user.getEmail() %></td>
                        <td><%= user.getPhoneNumber() %></td>
                        <td><%= user.getRoleName() %></td>
                    </tr>
                    <% }
                    } else { %>
                    <tr>
                        <td colspan="6">No users found.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        // Store user data for client-side operations
        const users = [
            <% if (userList != null && !userList.isEmpty()) {
                for (UserModel user : userList) { %>
            {
                id: <%= user.getUserId() %>,
                firstName: "<%= user.getFirstName() %>",
                lastName: "<%= user.getLastName() %>",
                username: "<%= user.getUsername() %>",
                email: "<%= user.getEmail() %>",
                phoneNumber: "<%= user.getPhoneNumber() %>",
                roleId: <%= user.getRoleId() %>
            },
            <% }
            } %>
        ];

        let selectedRow = null;

        // Function to update the dashboard data
        function updateDashboardData() {
            // Save the total number of members
            localStorage.setItem('totalMembers', users.length);
            
            // Save the 10 most recent members (or all if less than 10)
            const recentMembers = users.slice(-10).reverse();
            localStorage.setItem('recentMembers', JSON.stringify(recentMembers));
        }

        function selectUser(row) {
            // Clear previous selections
            const rows = document.querySelectorAll('.user-table tbody tr');
            rows.forEach(r => r.classList.remove('selected'));

            // Mark this row as selected
            row.classList.add('selected');
            selectedRow = row;

            // Get the userId from the selected row
            const userId = row.getAttribute('data-id');

            // Find the user in our data array
            const user = users.find(u => u.id == userId);
            if (user) {
                // Populate the form with the user data
                document.getElementById('userId').value = user.id;
                document.getElementById('firstName').value = user.firstName;
                document.getElementById('lastName').value = user.lastName;
                document.getElementById('username').value = user.username;
                document.getElementById('email').value = user.email;
                document.getElementById('phoneNumber').value = user.phoneNumber;
                document.getElementById('roleId').value = user.roleId;
                document.getElementById('password').value = ''; // Always clear password
            }
        }

        function clearForm() {
            // Clear form fields
            document.getElementById('userForm').reset();
            document.getElementById('userId').value = '';

            // Clear row selection
            if (selectedRow) {
                selectedRow.classList.remove('selected');
                selectedRow = null;
            }
        }

        function submitForm(action) {
            const form = document.getElementById('userForm');
            const userId = document.getElementById('userId').value;

            // Set the action
            document.getElementById('action').value = action;

            // For delete and update, we need a selected user
            if ((action === 'delete' || action === 'update') && !userId) {
                alert('Please select a user first');
                return;
            }

            // For delete action, confirm with the user
            if (action === 'delete') {
                if (!confirm('Are you sure you want to delete this user?')) {
                    return;
                }
            }

            // Update dashboard data before submitting
            updateDashboardData();

            // Submit the form
            form.submit();
        }
        
        // Toggle sidebar
        document.getElementById('menuToggle').addEventListener('click', function() {
            document.getElementById('sidebar').classList.toggle('collapsed');
            document.querySelector('.main-content').classList.toggle('expanded');
        });

        // Update dashboard data when the page loads
        document.addEventListener('DOMContentLoaded', function() {
            updateDashboardData();
        });
    </script>

</body>
</html>