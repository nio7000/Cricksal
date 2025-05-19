package com.cricksal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cricksal.config.DbConfig;
import com.cricksal.model.UserModel;

public class UserDAO {
    private Connection dbConn;

    public UserDAO() {
        try {
            dbConn = DbConfig.getDbConnection();
            System.out.println("DB Connection established successfully.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<UserModel> getAllUsers() {
        List<UserModel> users = new ArrayList<>();

        String query = "SELECT u.user_id, u.first_name, u.last_name, u.username, u.email, u.password, u.phone_number, " +
                       "u.birth_date, u.gender, u.player_role, u.experience, u.team_name, " +
                       "u.role_id, r.role_name " +
                       "FROM user u LEFT JOIN role r ON u.role_id = r.role_id";

        try (PreparedStatement stmt = dbConn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                UserModel user = new UserModel(
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
                    rs.getString("role_name") != null ? rs.getString("role_name") : "User"
                );
                users.add(user);
            }

            System.out.println("DAO returned users: " + users.size());

        } catch (Exception e) {
            System.err.println("Error fetching users:");
            e.printStackTrace();
        }

        return users;
    }
}
