package ca.jamesjeremyryan;

import java.io.Serializable;

/**
 * Created by james on 2015-11-29.
 */
public class UserBean implements Serializable {
    private Integer userId;
    private String firstName = "New User";
    private String lastName;
    private String email;
    private String telephone;
    private String password;
    private Boolean isAdmin = false;
    private Boolean isValid = false;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) { this.userId = userId; }

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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Boolean getAdmin() { return isAdmin; }

    public void setAdmin(Boolean admin) { isAdmin = admin; }

    public Boolean getValid() { return isValid; }

    public void setValid(Boolean valid) { isValid = valid; }
}
