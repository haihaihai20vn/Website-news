package com.javaweb.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.javaweb.dto.CommentDTO;


public interface ICommentService {
	List<CommentDTO> findByNewsId(Long newsId);
	List<CommentDTO> findAll();
	int getTotalItemByNewsId(Long newsId);
	CommentDTO save(CommentDTO commentDTO);
	void delete(long[] ids);
}
