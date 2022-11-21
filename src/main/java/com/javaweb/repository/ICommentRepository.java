package com.javaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.javaweb.entity.CommentEntity;

public interface ICommentRepository extends JpaRepository<CommentEntity, Long>  {
	List<CommentEntity> findAllByNewsId(Long newsId);
	int countCommentByNewsId(Long newsId);
}
