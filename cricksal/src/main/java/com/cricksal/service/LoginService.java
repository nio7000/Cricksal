package com.cricksal.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.cricksal.config.DbConfig;
import com.cricksal.model.UserModel;
import com.cricksal.util.PasswordUtil;

public class LoginService {

    private Connection dbConn;

    public LoginService() {
        try {
            dbConn = DbConfig.getDbConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Validate login credentials using username and password.
     */
    public boolean loginUser(String username, String password) {
        if (username == null || password == null) return false;

        String query = "SELECT password FROM user WHERE username = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String encryptedPassword = rs.getString("password");
                String decryptedPassword = PasswordUtil.decrypt(encryptedPassword, username);
                return password.equals(decryptedPassword);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Fetch full user data after successful login.
     */
    public UserModel getUserByUsername(String username) {
        String query = "SELECT * FROM user WHERE username = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, username);
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
                    rs.getInt("role_id")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Gets role_id of user by username
     */
    public int getRoleIdByUsername(String username) {
        String query = "SELECT role_id FROM user WHERE username = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt("role_id");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
}
