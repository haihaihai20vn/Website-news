package com.javaweb.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.javaweb.dto.NewsDTO;
import com.javaweb.dto.UserDTO;
import com.javaweb.service.IUserService;
import com.javaweb.utils.MessageUtils;

@Controller(value = "userControllerOfAdmin")
public class UserController {
	
	@Autowired
	private MessageUtils messageUtil;
	
	@Autowired
	private IUserService userService;
	
	@RequestMapping(value="/quan-tri/tai-khoan/danh-sach", method=RequestMethod.GET)
	public ModelAndView loginPage(@RequestParam("page") int page, @RequestParam("limit") int limit, HttpServletRequest request) {
		UserDTO userDTO = new UserDTO();
		userDTO.setPage(page);
		userDTO.setLimit(limit);
		ModelAndView mav = new ModelAndView("admin/account/ListAccount");
		Pageable pageable = new PageRequest(page-1, limit);
		userDTO.setListResult(userService.findAll(pageable));
		userDTO.setTotalItem(userService.getTotalItem());
		userDTO.setTotalPage((int) Math.ceil((double)userDTO.getTotalItem()/userDTO.getLimit()));
		if(request.getParameter("message")!=null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("user", userDTO);
		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/tai-khoan/chinh-sua", method = RequestMethod.GET)
	public ModelAndView editNews(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {
		//required = false: Ktra id != null thì request vào, còn id = null thì ko lấy
		ModelAndView mav = new ModelAndView("admin/account/StatusAccount");
		UserDTO userDTO = new UserDTO();
		if(id!=null) {
			userDTO = userService.findById(id);
		}
		if(request.getParameter("message")!=null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("userDTO", userDTO);
		return mav;
	}
}
