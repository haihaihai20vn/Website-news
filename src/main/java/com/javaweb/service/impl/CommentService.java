package com.javaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.javaweb.converter.CommentConverter;
import com.javaweb.dto.CommentDTO;
import com.javaweb.entity.CommentEntity;
import com.javaweb.entity.NewsEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.repository.ICommentRepository;
import com.javaweb.repository.INewsRepository;
import com.javaweb.repository.IUserRepository;
import com.javaweb.service.ICommentService;

@Service
public class CommentService implements ICommentService{
	
	@Autowired
	private ICommentRepository commentRepository;
	
	@Autowired
	private INewsRepository newsRepository;
	
	@Autowired
	private CommentConverter commentConverter;
	
	@Autowired
	private IUserRepository userRepository;

	@Override
	public List<CommentDTO> findByNewsId(Long newsId) {
		List<CommentDTO> models = new ArrayList<>();
		List<CommentEntity>commentEntities = commentRepository.findAllByNewsId(newsId);
		for(CommentEntity item: commentEntities) {
			CommentDTO commentDTO =  commentConverter.toDto(item);
			models.add(commentDTO);
		}
		return models;
	}

	@Override
	public int getTotalItemByNewsId(Long newsId) {
		return (int) commentRepository.countCommentByNewsId(newsId);
	}

	@Override
	@Transactional
	public CommentDTO save(CommentDTO commentDTO) {
		NewsEntity newsId = newsRepository.findOneById(commentDTO.getNewsId());
		UserEntity userId = userRepository.findOneById(commentDTO.getUserId());
		CommentEntity commentEntity = new CommentEntity();
		if(commentDTO.getId()!=null) {
			//cập nhật
			CommentEntity oldComment = commentRepository.findOne(commentDTO.getId());
			oldComment.setNewsId(newsId);
			oldComment.setUserId(userId);
			commentEntity = commentConverter.toEntity(oldComment, commentDTO);
		} else {
			//Thêm mới
			commentEntity = commentConverter.toEntity(commentDTO);
			commentEntity.setNewsId(newsId);
			commentEntity.setUserId(userId);
		}
		return commentConverter.toDto(commentRepository.save(commentEntity));
	}

	@Override
	@Transactional
	public void delete(long[] ids) {
		for(long id:ids) {
			commentRepository.delete(id);
		}
	}

	@Override
	public List<CommentDTO> findAll() {
		List<CommentDTO> models = new ArrayList<>();
		List<CommentEntity>commentEntities = commentRepository.findAll();
		for(CommentEntity item: commentEntities) {
			CommentDTO commentDTO =  commentConverter.toDto(item);
			models.add(commentDTO);
		}
		return models;
	}

}
