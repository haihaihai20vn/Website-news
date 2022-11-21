package com.javaweb.converter;

import org.springframework.stereotype.Component;

import com.javaweb.dto.CategoryDTO;
import com.javaweb.entity.CategoryEntity;

@Component
public class CategoryConverter {
	public CategoryDTO toDto(CategoryEntity categoryEntity) {
		CategoryDTO result = new CategoryDTO();
		result.setId(categoryEntity.getId());
		result.setCode(categoryEntity.getCode());
		result.setName(categoryEntity.getName());
		return result;
	}
	
	public CategoryEntity toEntity(CategoryDTO categoryDTO) {
		CategoryEntity entity = new CategoryEntity();
		entity.setCode(categoryDTO.getCode());
		entity.setName(categoryDTO.getName());
		return entity;
	}
}
