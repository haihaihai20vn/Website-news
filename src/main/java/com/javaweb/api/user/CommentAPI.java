package com.javaweb.api.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.javaweb.dto.CommentDTO;
import com.javaweb.service.ICommentService;

@RestController(value = "commentAPIofUser")
public class CommentAPI {
	@Autowired
	private ICommentService commentService;
	
	@PostMapping("/api/comment")
	public CommentDTO writeComment(@RequestBody CommentDTO writeComment) {
		return commentService.save(writeComment);
	}
	
	@PutMapping("/api/comment")
	public CommentDTO editComment(@RequestBody CommentDTO editComment) {
		return commentService.save(editComment);
	}
	
	@DeleteMapping("/api/comment")
	public void deleteComment(@RequestBody long[] ids) {
		commentService.delete(ids);
	}
}
