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

import com.javaweb.dto.CategoryDTO;
import com.javaweb.dto.CommentDTO;
import com.javaweb.dto.NewsDTO;
import com.javaweb.service.ICommentService;
import com.javaweb.utils.MessageUtils;

@Controller(value = "commentControllerOfAdmin")
public class CommentController {
	@Autowired
	ICommentService commentService;
	
	@Autowired
	private MessageUtils messageUtil;
	
	@RequestMapping(value = "/quan-tri/bai-viet/binh-luan", method = RequestMethod.GET)
	public ModelAndView showComment(HttpServletRequest request) {
	
		ModelAndView mv = new ModelAndView("admin/comment/ListComment");
		NewsDTO newsDTO = new NewsDTO();
		CategoryDTO category = new CategoryDTO();
		CommentDTO comment = new CommentDTO();
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
