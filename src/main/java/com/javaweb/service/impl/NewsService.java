package com.javaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.javaweb.converter.NewsConverter;
import com.javaweb.dto.NewsDTO;
import com.javaweb.entity.CategoryEntity;
import com.javaweb.entity.NewsEntity;
import com.javaweb.repository.ICategoryRepository;
import com.javaweb.repository.INewsRepository;
import com.javaweb.service.INewsService;

@Service
public class NewsService implements INewsService {
	@Autowired
	private INewsRepository newsRepository;
	
	@Autowired
	private ICategoryRepository categoryRepository;
	
	@Autowired
	private NewsConverter newsConverter;
	
	@Override
	public List<NewsDTO> findAll(Pageable pageable) {
		List<NewsDTO> models = new ArrayList<>();
		List<NewsEntity> newsEntities = newsRepository.findAll(pageable).getContent(); //findAll(): Thực thi câu sql: select * from news
		for(NewsEntity item:newsEntities) {
			/*NewsDTO newsDTO = new NewsDTO();
			newsDTO.setTitle(item.getTitle());
			newsDTO.setShortDescription(item.getShortDescription());
			models.add(newsDTO);*/
			NewsDTO newsDTO = newsConverter.toDto(item);
			models.add(newsDTO);
		}
		return models;
	}


	@Override
	public int getTotalItem() {
		return (int) newsRepository.count(); //hàm count chạy câu lệnh sql = "SELECT count(*) FROM news"
	}


	@Override
	public NewsDTO findById(long id) {
		NewsEntity entity = newsRepository.findOne(id);
		return newsConverter.toDto(entity);
	}


	@Override
	@Transactional
	public NewsDTO save(NewsDTO newsDTO) {
		CategoryEntity category = categoryRepository.findOneByCode(newsDTO.getCategoryCode());
		NewsEntity newsEntity = new NewsEntity();
		if(newsDTO.getId()!=null) {
			//cập nhật
			NewsEntity oldNews = newsRepository.findOne(newsDTO.getId());
			oldNews.setCategory(category);
			newsEntity = newsConverter.toEntity(oldNews, newsDTO);
		} else {
			//Thêm mới
			newsEntity = newsConverter.toEntity(newsDTO);
			newsEntity.setCategory(category);
		}
		return newsConverter.toDto(newsRepository.save(newsEntity));
	}


	@Override
	@Transactional
	public void delete(long[] ids) {
		for(long id:ids) {
			newsRepository.delete(id);
		}
	}


	@Override
	public List<NewsDTO> findAll() {
		List<NewsDTO> models = new ArrayList<>();
		List<NewsEntity>newsEntities = newsRepository.findAll();
		for(NewsEntity item: newsEntities) {
			NewsDTO newsDTO =  newsConverter.toDto(item);
			models.add(newsDTO);
		}
		return models;
	}


	@Override
	public List<NewsDTO> findByLatestNews(boolean latestNews) {
		List<NewsDTO> models = new ArrayList<>();
		List<NewsEntity>newsEntities = newsRepository.findByLatestNews(latestNews);
		for(NewsEntity item: newsEntities) {
			NewsDTO newsDTO =  newsConverter.toDto(item);
			models.add(newsDTO);
		}
		return models;
	}


	@Override
	public List<NewsDTO> findByBreakingNews(boolean breakingNews) {
		List<NewsDTO> models = new ArrayList<>();
		List<NewsEntity>newsEntities = newsRepository.findByLatestNews(breakingNews);
		for(NewsEntity item: newsEntities) {
			NewsDTO newsDTO =  newsConverter.toDto(item);
			models.add(newsDTO);
		}
		return models;
	}


	@Override
	public List<NewsDTO> findByCategoryId(Long categoryID, Pageable pageable) {
		List<NewsDTO> models = new ArrayList<>();
		List<NewsEntity>newsEntities = newsRepository.findAllByCategoryId(categoryID, pageable).getContent();
		for(NewsEntity item: newsEntities) {
			NewsDTO newsDTO =  newsConverter.toDto(item);
			models.add(newsDTO);
		}
		return models;
	}


	@Override
	public int getTotalItemByCategoryId(Long categoryId) {
		 return (int) newsRepository.countByCategoryId(categoryId);
	}


	@Override
	public List<NewsDTO> findAllByCategoryId(Long categoryId) {
		List<NewsDTO> models = new ArrayList<>();
		NewsDTO news = new NewsDTO();
		news.setCategoryId(categoryId);
		Long category = news.getCategoryId();
		List<NewsEntity>newsEntities = newsRepository.findAllByCategoryId(category);
		for(NewsEntity item: newsEntities) {
			NewsDTO newsDTO =  newsConverter.toDto(item);
			models.add(newsDTO);
		}
		return models;
	}


	@Override
	public NewsDTO findOneByCategoryId(Long categoryId) {
		NewsEntity entity = newsRepository.findOne(categoryId);
		return newsConverter.toDto(entity);
	}



}
