package com.cricksal.model;

public class UserModel {
    private int userId;
    private String firstName;
    private String lastName;
    private String username;
    private String email;
    private String password;
    private String phoneNumber;
    private String birthDate;
    private String gender;
    private String playerRole;
    private String experience;
    private String teamName;
    private int roleId;
    private String roleName; // Optional field for role name

    // Constructor for full profile with role name
    public UserModel(int userId, String firstName, String lastName, String username,
                     String email, String password, String phoneNumber, String birthDate, String gender,
                     String playerRole, String experience, String teamName, int roleId, String roleName) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.email = email;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.birthDate = birthDate;
        this.gender = gender;
        this.playerRole = playerRole;
        this.experience = experience;
        this.teamName = teamName;
        this.roleId = roleId;
        this.roleName = roleName;
    }

    // Constructor without roleName (optional)
    public UserModel(int userId, String firstName, String lastName, String username,
                     String email, String password, String phoneNumber, String birthDate, String gender,
                     String playerRole, String experience, String teamName, int roleId) {
        this(userId, firstName, lastName, username, email, password, phoneNumber,
             birthDate, gender, playerRole, experience, teamName, roleId, null);
    }

    // Constructor used during login
    public UserModel(String username, String password) {
        this.username = username;
        this.password = password;
    }

    // Constructor used during registration
    public UserModel(String firstName, String lastName, String username, String email,
                     String password, String phoneNumber, int roleId) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.email = email;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.roleId = roleId;
    }

    // Constructor for admin/user listing with partial fields
    public UserModel(int userId, String firstName, String lastName, String username,
                     String email, String phoneNumber, int roleId, String roleName) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.roleId = roleId;
        this.roleName = roleName;
    }

    // Getters and Setters
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPlayerRole() {
        return playerRole;
    }

    public void setPlayerRole(String playerRole) {
        this.playerRole = playerRole;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
