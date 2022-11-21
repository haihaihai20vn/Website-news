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
import com.javaweb.service.ICategoryService;
import com.javaweb.service.INewsService;
import com.javaweb.utils.MessageUtils;

@Controller(value = "newsControllerOfAdmin")
public class NewsController {
	
	@Autowired
	private INewsService newsService;
	
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private MessageUtils messageUtil;

	@RequestMapping(value = "/quan-tri/bai-viet/danh-sach", method = RequestMethod.GET)
	public ModelAndView showList(@RequestParam("page") int page, @RequestParam("limit") int limit, HttpServletRequest request) {
		NewsDTO model = new NewsDTO();
		model.setPage(page);
		model.setLimit(limit);
		ModelAndView mav = new ModelAndView("admin/news/list");
		Pageable pageable = new PageRequest(page-1, limit);
		model.setListResult(newsService.findAll(pageable));
		model.setTotalItem(newsService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double)model.getTotalItem()/model.getLimit()));
		if(request.getParameter("message")!=null) {
			/*if(request.getParameter("message").equals("update_success")) {
				mav.addObject("message", "Cập nhật thành công");
				mav.addObject("alert", "success");
			} else if (request.getParameter("message").equals("add_success")) {
				mav.addObject("message", "Thêm mới thành công");
				mav.addObject("alert", "success");
			} else if (request.getParameter("message").equals("error_system")) {
				mav.addObject("message", "Lỗi hệ thống");
				mav.addObject("alert", "danger");
			}*/
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/bai-viet/chinh-sua", method = RequestMethod.GET)
	public ModelAndView editNews(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {
		//required = false: Ktra id != null thì request vào, còn id = null thì ko lấy
		ModelAndView mav = new ModelAndView("admin/news/edit");
		NewsDTO newsDTO = new NewsDTO();
		if(id!=null) {
			newsDTO = newsService.findById(id);
		}
		if(request.getParameter("message")!=null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("categories", categoryService.findAll());
		mav.addObject("newsDTO", newsDTO);
		return mav;
	}
}
