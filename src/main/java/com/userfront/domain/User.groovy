package com.userfront.domain

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.userfront.domain.security.Authority;
import com.userfront.domain.security.UserRole;

@Entity
public class User implements UserDetails{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "userId", nullable = false, updatable = false)
    Long userId;
    String username;
    String password;
    String firstName;
    String lastName;

    @Column(name = "email", nullable = false, unique = true)
    String email;
    String phone;

    boolean enabled = true;

    @OneToOne
    PrimaryAccount primaryAccount;

    @OneToOne
    SavingsAccount savingsAccount;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JsonIgnore
    List<Appointment> appointmentList;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    List<Recipient> recipientList;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JsonIgnore
    Set<UserRole> userRoles = new HashSet<>();

    public String getPassword() {
        password
    }

    public String getUsername() {
        username
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", appointmentList=" + appointmentList +
                ", recipientList=" + recipientList +
                ", userRoles=" + userRoles +
                '}';
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Set<GrantedAuthority> authorities = new HashSet<>();
        userRoles.each { UserRole userRole ->
            authorities.add(new Authority(userRole.getRole().getName()))
        }
        authorities;
    }

    public boolean isAccountNonExpired() {
        return true;
    }

    public boolean isAccountNonLocked() {
        return true;
    }

    public boolean isCredentialsNonExpired() {
        return true;
    }

    public boolean isEnabled() {
        return enabled;
    }

}
