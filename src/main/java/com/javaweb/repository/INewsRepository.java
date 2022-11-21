package com.javaweb.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.javaweb.entity.NewsEntity;

public interface INewsRepository extends JpaRepository<NewsEntity, Long>{
	//Thay cho INewsDAO
	//<NewsEntity, Long>: Long là kiểu của khóa chính id. 
	//JpaRepository đã có sẵn @Repository, giống IGenericDAO
	@Query(value = "SELECT * FROM news WHERE latestNews = ?1", nativeQuery = true)
	List<NewsEntity> findByLatestNews(boolean latestNews);
	
	@Query(value = "SELECT * FROM news WHERE breakingNews = ?1", nativeQuery = true)
	List<NewsEntity> findByBreakingNews(boolean breakingNews);
	
	
	Page<NewsEntity> findAllByCategoryId(Long categoryId, Pageable pageble);
	
	List<NewsEntity> findAllByCategoryId(Long categoryId);
	
	int countByCategoryId(Long categoryId);
	NewsEntity findOneByCategoryId(Long categoryId);
	NewsEntity findOneById(Long id);
}
