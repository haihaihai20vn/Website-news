package com.javaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.javaweb.converter.UserConverter;
import com.javaweb.dto.UserDTO;
import com.javaweb.entity.UserEntity;
import com.javaweb.repository.IUserRepository;
import com.javaweb.service.IUserService;

@Service
public class UserService implements IUserService{

	
	@Autowired
	UserConverter userConverter;
	
	@Autowired
	IUserRepository userRepository;

	@Override
	@Transactional
	public UserDTO addAccount(UserDTO user) {
		UserEntity userEntity = new UserEntity();
		userEntity = userConverter.toEntity(user);
		userEntity.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(10)));
		userEntity.setStatus(1);
		return userConverter.toDto(userRepository.save(userEntity));
	}

	@Override
	@Transactional
	public UserDTO update(UserDTO user) {
		UserEntity userEntity = new UserEntity();
		UserEntity oldUser = userRepository.findOne(user.getId());
		userEntity = userConverter.toEntity(oldUser, user);
		return userConverter.toDto(userRepository.save(userEntity));
	}

	@Override
	@Transactional
	public void delete(long[] ids) {
		for(long id:ids) {
			userRepository.delete(id);
		}
	}

	@Override
	public List<UserDTO> findAll(Pageable pageable) {
		List<UserDTO> models = new ArrayList<>();
		List<UserEntity> userEntities = userRepository.findAll(pageable).getContent(); //findAll(): Thực thi câu sql: select * from user
		for(UserEntity item:userEntities) {
			UserDTO userDTO = userConverter.toDto(item);
			models.add(userDTO);
		}
		return models;
	}

	@Override
	public int getTotalItem() {
		return (int) userRepository.count();
	}

	@Override
	public UserDTO findById(long id) {
		UserEntity entity = userRepository.findOne(id);
		return userConverter.toDto(entity);
	}

}
