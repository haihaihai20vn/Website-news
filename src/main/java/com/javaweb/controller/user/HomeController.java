package com.javaweb.controller.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.javaweb.dto.CategoryDTO;
import com.javaweb.dto.NewsDTO;
import com.javaweb.dto.UserDTO;
import com.javaweb.service.ICategoryService;
import com.javaweb.service.INewsService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.MessageUtils;

@Controller(value = "homeControllerOfUser")

public class HomeController {
	
	@Autowired
	private INewsService newsService;
	
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private MessageUtils messageUtil;
	
	@RequestMapping(value="/trang-chu", method=RequestMethod.GET)
	public ModelAndView homePage() {
		CategoryDTO category = new CategoryDTO();
		NewsDTO news = new NewsDTO();
		ModelAndView mv = new ModelAndView("user/home");
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

	@RequestMapping(value="/dang-nhap", method=RequestMethod.GET)
	public ModelAndView loginPage(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("login");
		UserDTO userDTO = new UserDTO();
		if(request.getParameter("message")!=null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mv.addObject("message", message.get("message"));
			mv.addObject("alert", message.get("alert"));
		}
		mv.addObject("user", userDTO);
		return mv;
	}
	
	@RequestMapping(value="/thoat", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/trang-chu");
	}
	
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		return new ModelAndView("redirect:/dang-nhap?accessDenied");
	}
}
