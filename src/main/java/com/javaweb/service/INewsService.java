package com.javaweb.service;


import java.util.List;

import org.springframework.data.domain.Pageable;

import com.javaweb.dto.NewsDTO;

public interface INewsService {
	List<NewsDTO> findAll(Pageable pageable);
	List<NewsDTO> findAll();
	List<NewsDTO> findByLatestNews(boolean latestNews);
	List<NewsDTO> findByBreakingNews(boolean breakingNews);
	List<NewsDTO> findByCategoryId(Long categoryId, Pageable pageable);
	int getTotalItem();
	int getTotalItemByCategoryId(Long categoryId);
	NewsDTO findById(long id);
	NewsDTO save(NewsDTO newsDTO);
	void delete(long[] ids);
	List<NewsDTO> findAllByCategoryId(Long categoryId);
	NewsDTO findOneByCategoryId(Long categoryId);
}
