package com.javaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.javaweb.constant.SystemConst;
import com.javaweb.dto.MyAccount;
import com.javaweb.entity.RoleEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.repository.IUserRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	@Autowired
	private IUserRepository userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserEntity userEntity = userRepository.findOneByUserNameAndStatus(username, SystemConst.ACTIVE_STATUS);
		if(userEntity == null) {
			throw new UsernameNotFoundException("Không tìm thấy tài khoản");
		}
		List<GrantedAuthority> authorities = new ArrayList<>();
		for(RoleEntity role:userEntity.getRoles()) {
			authorities.add(new SimpleGrantedAuthority(role.getCode()));
		}
		//gửi thông tin vào security để duy trì thông tin đó khi user login vào hệ thống
		// Giống sessionUtil
		MyAccount myAccount = new MyAccount(userEntity.getUserName(), userEntity.getPassword(), true, true, true,true, authorities);
		myAccount.setFullname(userEntity.getFullName());
		return myAccount;
	}

}
