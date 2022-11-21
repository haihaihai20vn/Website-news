package com.javaweb.controller.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.javaweb.dto.CategoryDTO;
import com.javaweb.dto.CommentDTO;
import com.javaweb.dto.NewsDTO;
import com.javaweb.service.ICategoryService;
import com.javaweb.service.ICommentService;
import com.javaweb.service.INewsService;
import com.javaweb.utils.MessageUtils;

@Controller(value = "newsControllerOfUser")
public class NewsController {
	
	@Autowired
	private INewsService newsService;
	
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private ICommentService commentService;
	
	@Autowired
	private MessageUtils messageUtil;
	
	@RequestMapping(value = { "/tin-tuc/{id}" })
	public ModelAndView NewsPage(@PathVariable long id, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("user/news");
		NewsDTO newsDTO = new NewsDTO();
		CategoryDTO category = new CategoryDTO();
		CommentDTO comment = new CommentDTO();
		newsDTO = newsService.findById(id);
		newsDTO.setCategoryId(id);
		long categoryId = newsDTO.getCategoryId();
		newsDTO.setListResult(newsService.findAllByCategoryId(categoryId));
		newsDTO.setListBreakingNews(newsService.findByBreakingNews(true));
		category.setListResult(categoryService.findAllData());
		comment.setListResult(commentService.findAll());
		if(request.getParameter("message")!=null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mv.addObject("message", message.get("message"));
			mv.addObject("alert", message.get("alert"));
		}
		mv.addObject("news",newsDTO);
		mv.addObject("category", category);
		mv.addObject("comment", comment);
		return mv;
	}
}
