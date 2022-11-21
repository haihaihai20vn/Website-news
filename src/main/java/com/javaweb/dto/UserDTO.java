package com.javaweb.dto;

import java.util.ArrayList;
import java.util.List;

import com.javaweb.entity.RoleEntity;

public class UserDTO extends AbstractDTO<UserDTO> {
	private String userName;
	private String password;
	private String fullName;
	private String email;
	private Integer status;
	private Long roleId;
	private List<RoleEntity> roles = new ArrayList<>();
	
	
	public UserDTO() {
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	public List<RoleEntity> getRoles() {
		return roles;
	}
	public void setRoles(List<RoleEntity> roles) {
		this.roles = roles;
	}
	
	
	
	
	
	
	
	
}
