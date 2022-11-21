package com.javaweb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaweb.converter.CategoryConverter;
import com.javaweb.dto.CategoryDTO;
import com.javaweb.entity.CategoryEntity;
import com.javaweb.repository.ICategoryRepository;
import com.javaweb.service.ICategoryService;

@Service
public class CategoryService implements ICategoryService{
	
	@Autowired
	private ICategoryRepository categoryRepository;
	
	@Autowired
	private CategoryConverter categoryConverter;

	@Override
	public Map<String, String> findAll() {
		Map<String, String> result = new HashMap<>();
		List<CategoryEntity> categoryEntites = categoryRepository.findAll();
		for(CategoryEntity item:categoryEntites) {
			result.put(item.getCode(), item.getName());
		}
		return result;
	}

	@Override
	public List<CategoryDTO> findAllData() {
		List<CategoryDTO> models = new ArrayList<>();
		List<CategoryEntity> menuEntities = categoryRepository.findAll();
		for(CategoryEntity item: menuEntities) {
			CategoryDTO categoryDTO =  categoryConverter.toDto(item);
			models.add(categoryDTO);
		}
		return models;
	}

	@Override
	public CategoryDTO findById(long id) {
		CategoryEntity entity = categoryRepository.findOne(id);
		return categoryConverter.toDto(entity);
	}
	
	
}
