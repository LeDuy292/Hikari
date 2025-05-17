
package model;

import java.time.LocalDate;

/**
 *
 * @author ADMIN
 */
public class UserAccount {
    private String userID;
    private String username;
    private String fullName;
    private String email;
    private String password;
    private String role;
    private LocalDate registrationDate;
    private String profilePicture;
    private String phone;
    private LocalDate birthDate;

    public UserAccount(String userID, String username, String fullName, String email, String password, String role, LocalDate registrationDate, String profilePicture, String phone, LocalDate birthDate) {
        this.userID = userID;
        this.username = username;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.role = role;
        this.registrationDate = registrationDate;
        this.profilePicture = profilePicture;
        this.phone = phone;
        this.birthDate = birthDate;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public LocalDate getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(LocalDate registrationDate) {
        this.registrationDate = registrationDate;
    }

    public String getProfilePicture() {
        return profilePicture;
    }

    public void setProfilePicture(String profilePicture) {
        this.profilePicture = profilePicture;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(LocalDate birthDate) {
        this.birthDate = birthDate;
    }

    @Override
    public String toString() {
        return "UserAccount{" + "userID=" + userID + ", username=" + username + ", fullName=" + fullName + ", email=" + email + ", password=" + password + ", role=" + role + ", registrationDate=" + registrationDate + ", profilePicture=" + profilePicture + ", phone=" + phone + ", birthDate=" + birthDate + '}';
    }
    
}
