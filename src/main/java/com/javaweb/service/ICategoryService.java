package com.javaweb.service;

import java.util.List;
import java.util.Map;

import com.javaweb.dto.CategoryDTO;

public interface ICategoryService {
	Map<String, String> findAll(); //Dùng Map thay List vì Spring yêu cầu để sử dụng form:select trong jsp
	List<CategoryDTO> findAllData();
	CategoryDTO findById(long id);
}
