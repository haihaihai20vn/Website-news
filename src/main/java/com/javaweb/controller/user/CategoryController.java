package com.javaweb.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.javaweb.dto.CategoryDTO;
import com.javaweb.dto.NewsDTO;
import com.javaweb.service.ICategoryService;
import com.javaweb.service.INewsService;



@Controller(value = "categoryControllerOfUser")
public class CategoryController {
	
	@Autowired
	private INewsService newsService;
	
	@Autowired
	private ICategoryService categoryService;

	private int totalProductOnPage = 2;


	@RequestMapping(value="/the-loai/{id}", method=RequestMethod.GET)
	public ModelAndView Category(@PathVariable String id,  @RequestParam("page") int page, @RequestParam("limit") int limit, HttpServletRequest request) {
		CategoryDTO category = new CategoryDTO();
		NewsDTO news = new NewsDTO();
		news.setPage(page);
		news.setLimit(limit);
		ModelAndView mav = new ModelAndView("user/category");
		Pageable pageable = new PageRequest(page-1, limit);
		category.setListResult(categoryService.findAllData());
		news.setLimit(totalProductOnPage);
		news.setListCategoryID(newsService.findByCategoryId(Long.parseLong(id), pageable));
		news.setListResult(newsService.findAll(pageable));
		news.setTotalItem(newsService.getTotalItemByCategoryId(Long.parseLong(id)));
		news.setTotalPage((int) Math.ceil((double)news.getTotalItem()/news.getLimit()));
		news.setListBreakingNews(newsService.findByBreakingNews(true));
		mav.addObject("category", category);
		mav.addObject("news", news);
		mav.addObject("idCategory", id);
		return mav;
	
		
	}
}
