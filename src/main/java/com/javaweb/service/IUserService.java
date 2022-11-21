package com.javaweb.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.javaweb.dto.UserDTO;

public interface IUserService {
	UserDTO addAccount(UserDTO user);
	UserDTO update(UserDTO user);
	void delete(long[] ids);
	List<UserDTO> findAll(Pageable pageable);
	int getTotalItem();
	UserDTO findById(long id);
}
