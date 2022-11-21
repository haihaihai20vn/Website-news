package com.javaweb.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.javaweb.dto.NewsDTO;
import com.javaweb.service.INewsService;

@RestController(value = "newsAPIofAdmin")
public class NewsAPI {
	//@RestController: đánh dấu class là api
	/* HTTP method:
	 * POST: thêm dữ liệu
	 * PUT: Cập nhật dữ liệu
	 * DELETE: Xóa
	 * GET: Lấy dữ liệu
	 * client-> DTO -> api -> service -> repository
	 * Để call api ở front-end dùng ajax*/
	
	@Autowired
	private INewsService newsService;
	
	@PostMapping("/api/news")
	public NewsDTO createNews(@RequestBody NewsDTO addNews) {
		return newsService.save(addNews);
	}
	
	@PutMapping("/api/news")
	public NewsDTO updateNews(@RequestBody NewsDTO updateNews) {
		return newsService.save(updateNews);
	}
	
	@DeleteMapping("/api/news")
	public void deleteNews(@RequestBody long[] ids) {
		newsService.delete(ids);
	}
}
