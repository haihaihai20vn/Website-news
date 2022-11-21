package com.javaweb.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.javaweb.dto.UserDTO;
import com.javaweb.service.IUserService;

@RestController(value = "accountAPIofAdmin")
public class AccountAPI {
	@Autowired
	private IUserService userService;
	
	@PostMapping("/api/account")
	public UserDTO addAccountAdmin(@RequestBody UserDTO addAccount) {
		return userService.addAccount(addAccount);
	}
	
	@PutMapping("/api/account")
	public UserDTO updateAccount(@RequestBody UserDTO updateAccount) {
		return userService.update(updateAccount);
	}
	
	@DeleteMapping("/api/account")
	public void deleteAccount(@RequestBody long[] ids) {
		userService.delete(ids);
	}
}
