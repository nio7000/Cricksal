package com.cricksal.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.cricksal.config.DbConfig;
import com.cricksal.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update")
public class UpdateProfile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        System.out.println("🔄 UpdateProfile servlet triggered");

        // Fetch form values
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String birthDate = req.getParameter("birthDate");
        String gender = req.getParameter("gender");
        String playerRole = req.getParameter("role");
        String experience = req.getParameter("experience");
        String teamName = req.getParameter("teamName");

        // Session and user check
        HttpSession session = req.getSession();
        UserModel member = (UserModel) session.getAttribute("member");

        if (member == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        try (Connection conn = DbConfig.getDbConnection()) {
            String sql = """
                UPDATE user
                SET first_name = ?, last_name = ?, email = ?, phone_number = ?,
                    birth_date = ?, gender = ?, player_role = ?, experience = ?, team_name = ?
                WHERE user_id = ?
            """;

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, firstName);
                stmt.setString(2, lastName);
                stmt.setString(3, email);
                stmt.setString(4, phone);
                stmt.setString(5, birthDate);
                stmt.setString(6, gender);
                stmt.setString(7, playerRole);
                stmt.setString(8, experience);
                stmt.setString(9, teamName);
                stmt.setInt(10, member.getUserId());

                int rows = stmt.executeUpdate();
                System.out.println("✅ Rows updated: " + rows);

                // Update session object
                member.setFirstName(firstName);
                member.setLastName(lastName);
                member.setEmail(email);
                member.setPhoneNumber(phone);
                member.setBirthDate(birthDate);
                member.setGender(gender);
                member.setPlayerRole(playerRole);
                member.setExperience(experience);
                member.setTeamName(teamName);

                session.setAttribute("member", member);
                resp.sendRedirect(req.getContextPath() + "/account?success=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/account?error=1");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.sendRedirect(req.getContextPath() + "/account");
    }
}
