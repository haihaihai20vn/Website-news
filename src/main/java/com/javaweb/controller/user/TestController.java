package com.javaweb.controller.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.javaweb.dto.CategoryDTO;
import com.javaweb.dto.CommentDTO;
import com.javaweb.dto.NewsDTO;
import com.javaweb.dto.UserDTO;
import com.javaweb.service.ICategoryService;
import com.javaweb.service.ICommentService;
import com.javaweb.service.INewsService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.MessageUtils;

@Controller(value = "testControllerOfUser")
public class TestController {

	@Autowired
	private INewsService newsService;
	
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private MessageUtils messageUtil;
	
	@Autowired
	private ICommentService commentService;
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public ModelAndView homePage() {
		CategoryDTO category = new CategoryDTO();
		NewsDTO news = new NewsDTO();
		ModelAndView mv = new ModelAndView("user1/home");
		category.setListResult(categoryService.findAllData());
		news.setListResult(newsService.findAll());
		news.setTotalItem(newsService.getTotalItem());
		news.setListLatestNews(newsService.findByLatestNews(true));
		news.setListBreakingNews(newsService.findByBreakingNews(true));
		news.setListVideo(newsService.findAllByCategoryId((long) 6));
		mv.addObject("categories", categoryService.findAll());
		mv.addObject("category", category);
		mv.addObject("news", news);
		return mv;
	}
	
	private int totalProductOnPage = 2;

	@RequestMapping(value="/test/category/{id}", method=RequestMethod.GET)
	public ModelAndView Category(@PathVariable String id,  @RequestParam("page") int page, @RequestParam("limit") int limit, HttpServletRequest request) {
		CategoryDTO category = new CategoryDTO();
		NewsDTO news = new NewsDTO();
		news.setPage(page);
		news.setLimit(limit);
		ModelAndView mav = new ModelAndView("user1/category");
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
	
	@RequestMapping(value = { "/test/news/{id}" })
	public ModelAndView WebNewsPage(@PathVariable long id, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("user1/news");
		NewsDTO newsDTO = new NewsDTO();
		CategoryDTO category = new CategoryDTO();
		CommentDTO comment = new CommentDTO();
		newsDTO = newsService.findById(id);
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
