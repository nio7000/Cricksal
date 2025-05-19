package com.cricksal.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cricksal.config.DbConfig;
import com.cricksal.model.UserModel;
import com.cricksal.util.PasswordUtil;

public class UserManagementService {
    private Connection dbConn;

    public UserManagementService() {
        try {
            dbConn = DbConfig.getDbConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<UserModel> getAllUsers() {
        List<UserModel> users = new ArrayList<>();
        String query = """
            SELECT u.user_id, u.first_name, u.last_name, u.username, u.email, u.password,
                   u.phone_number, u.birth_date, u.gender, u.player_role, u.experience, u.team_name,
                   u.role_id, r.role_name
            FROM user u
            LEFT JOIN role r ON u.role_id = r.role_id
        """;

        try (PreparedStatement stmt = dbConn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                users.add(new UserModel(
                    rs.getInt("user_id"),
                    rs.getString("first_name"),
                    rs.getString("last_name"),
                    rs.getString("username"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("phone_number"),
                    rs.getString("birth_date"),
                    rs.getString("gender"),
                    rs.getString("player_role"),
                    rs.getString("experience"),
                    rs.getString("team_name"),
                    rs.getInt("role_id"),
                    rs.getString("role_name")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    public UserModel getUserById(int userId) {
        String query = """
            SELECT u.user_id, u.first_name, u.last_name, u.username, u.email, u.password,
                   u.phone_number, u.birth_date, u.gender, u.player_role, u.experience, u.team_name,
                   u.role_id, r.role_name
            FROM user u
            LEFT JOIN role r ON u.role_id = r.role_id
            WHERE u.user_id = ?
        """;

        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new UserModel(
                    rs.getInt("user_id"),
                    rs.getString("first_name"),
                    rs.getString("last_name"),
                    rs.getString("username"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("phone_number"),
                    rs.getString("birth_date"),
                    rs.getString("gender"),
                    rs.getString("player_role"),
                    rs.getString("experience"),
                    rs.getString("team_name"),
                    rs.getInt("role_id"),
                    rs.getString("role_name")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public boolean createUser(String firstName, String lastName, String username, String email,
                              String password, String phoneNumber, int roleId) {
        String query = """
            INSERT INTO user (first_name, last_name, username, email, password, phone_number, role_id)
            VALUES (?, ?, ?, ?, ?, ?, ?)
        """;

        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, username);
            stmt.setString(4, email);
            stmt.setString(5, PasswordUtil.encrypt(username, password));
            stmt.setString(6, phoneNumber);
            stmt.setInt(7, roleId);

            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateUser(int userId, String firstName, String lastName, String username,
                              String email, String password, String phoneNumber, int roleId) {
        String query = """
            UPDATE user SET first_name=?, last_name=?, username=?, email=?,
            password=?, phone_number=?, role_id=? WHERE user_id=?
        """;

        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, username);
            stmt.setString(4, email);
            stmt.setString(5, PasswordUtil.encrypt(username, password));
            stmt.setString(6, phoneNumber);
            stmt.setInt(7, roleId);
            stmt.setInt(8, userId);

            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteUser(int userId) {
        String query = "DELETE FROM user WHERE user_id = ?";

        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
