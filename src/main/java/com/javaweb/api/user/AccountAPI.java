package com.javaweb.api.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.javaweb.dto.UserDTO;
import com.javaweb.service.IUserService;

@RestController(value = "accountAPIofUser")
public class AccountAPI {
	//@RestController: đánh dấu class là api
		/* HTTP method:
		 * POST: thêm dữ liệu
		 * PUT: Cập nhật dữ liệu
		 * DELETE: Xóa
		 * GET: Lấy dữ liệu
		 * client-> DTO -> api -> service -> repository
		 * Để call api ở front-end dùng ajax*/
		
		@Autowired
		private IUserService userService;
		
		@PostMapping("/api/register")
		public UserDTO createAccount(@RequestBody UserDTO addNews) {
			return userService.addAccount(addNews);
		}
		
		/*@DeleteMapping("/api/news")
		public void deleteNews(@RequestBody long[] ids) {
			newsService.delete(ids);
		}*/
}
