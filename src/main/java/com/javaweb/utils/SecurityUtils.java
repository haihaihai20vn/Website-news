package com.javaweb.utils;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import com.javaweb.dto.MyAccount;

public class SecurityUtils {
	
	public static MyAccount getPrincipal() {
		MyAccount myAccount = (MyAccount)(SecurityContextHolder.getContext()).getAuthentication().getPrincipal();
		return myAccount;
	}
	
	@SuppressWarnings("unchecked")
	public static List<String> getAuthorities(){
		List<String> results = new ArrayList<>();
		List<GrantedAuthority> authorities = (List<GrantedAuthority>)(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
        for (GrantedAuthority authority : authorities) {
            results.add(authority.getAuthority());
        }
		return results;
	}
}
