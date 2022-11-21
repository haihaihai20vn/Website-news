package com.javaweb.converter;

import org.springframework.stereotype.Component;

import com.javaweb.dto.UserDTO;
import com.javaweb.entity.UserEntity;

@Component
public class UserConverter {
	public UserDTO toDto(UserEntity userEntity) {
		UserDTO result = new UserDTO();
		result.setId(userEntity.getId());
		result.setUserName(userEntity.getUserName());
		result.setPassword(userEntity.getPassword());
		result.setFullName(userEntity.getFullName());
		result.setEmail(userEntity.getEmail());
		result.setStatus(userEntity.getStatus());
		result.setRoles(userEntity.getRoles());
		return result;
	}
	
	//Convert data từ entity -> DTO (entity hoàn toàn mới)
	public UserEntity toEntity(UserDTO userDto) {
		UserEntity result = new UserEntity();
		result.setUserName(userDto.getUserName());
		result.setPassword(userDto.getPassword());
		result.setFullName(userDto.getFullName());
		result.setEmail(userDto.getEmail());
		result.setStatus(userDto.getStatus());
		result.setRoles(userDto.getRoles());
		return result;
	}
	
	// Trả về enity dựa trên entity đã có (cập nhật thông tin)
	public UserEntity toEntity(UserEntity userEntity, UserDTO userDto) {
		userEntity.setUserName(userDto.getUserName());
		userEntity.setPassword(userDto.getPassword());
		userEntity.setFullName(userDto.getFullName());
		userEntity.setEmail(userDto.getEmail());
		userEntity.setStatus(userDto.getStatus());
		userEntity.setRoles(userDto.getRoles());
		return userEntity;
	}
}
