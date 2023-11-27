
package com.project.tnet.config.auth;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.project.tnet.dto.MemberVO;


public class PrincipalDetails implements UserDetails {

    private static final long serialVersionUID = -951226953749557253L;
	private MemberVO user;

    public PrincipalDetails(MemberVO user) {
        this.user = user;
    }

    public MemberVO getUser() {
        return user;
    }

    public String getAge_range(MemberVO user) {
    	return user.getAge_range();
    }
    
    public String getGender(MemberVO user) {
    	return user.getGender();
    }
    
    @Override
    public String getPassword() {
        return user != null ? user.getPwd() : "";
    }

    @Override
    public String getUsername() {
        return user != null ? user.getEmail() : "";
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<GrantedAuthority> authorities = new ArrayList<>();
        user.getRoleList().forEach(r -> {
            authorities.add(() -> {
                return "ROLE_" + r;
            });
        });
        return authorities;
    }
}
