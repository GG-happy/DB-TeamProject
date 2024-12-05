package edu.deu.dbprogramming.DBP_financeMgmt_Team11.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Table(name = "USERS")
public class User {
    @Id
    @Size(max = 50)
    @Column(name = "USERNAME", nullable = false, length = 50)
    private String username;

    @Size(max = 100)
    @NotNull
    @Column(name = "PASSWORD", nullable = false, length = 100)
    private String password;

    @Size(max = 20)
    @ColumnDefault("NULL")
    @Column(name = "ROLE", length = 20)
    private String role;

    @NotNull
    @ColumnDefault("1")
    @Column(name = "ENABLED", nullable = false)
    private Boolean enabled = false;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "CLIENT_CODE")
    private Company clientCode;

    @Size(max = 50)
    @Column(name = "NAME", length = 50)
    private String name;

    @Size(max = 20)
    @Column(name = "TITLE", length = 20)
    private String title;

    @Size(max = 15)
    @Column(name = "PHONE", length = 15)
    private String phone;

    @Size(max = 50)
    @Column(name = "EMAIL", length = 50)
    private String email;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public Company getClientCode() {
        return clientCode;
    }

    public void setClientCode(Company clientCode) {
        this.clientCode = clientCode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}