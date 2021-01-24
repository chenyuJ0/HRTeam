package com.cn.hrsystem.web.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cn.hrsystem.domain.Dept;
import com.cn.hrsystem.domain.Job;
import com.cn.hrsystem.domain.Notice;
import com.cn.hrsystem.service.NoticeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/notice")
@SessionAttributes(value= {"readNotice"})
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	
	/**
	 * 对notice查询到的信息进行分页
	 * @param pn
	 * @param model
	 * @return
	 */
	@RequestMapping("/findAll")
	public String findAll(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model) {
		PageHelper.startPage(pn, 5);
		
		List<Notice> list = noticeService.findAllNotice();
		PageInfo<Notice> info = new PageInfo<Notice>(list);
		model.addAttribute("info", info);
		
		
		
		return "forward:/pages/notice/list.jsp";
	}
	
	
	
	/**
	 * 跳转到notice下的add.jsp页面
	 * @return
	 */
	@RequestMapping("/add")
	public String returnadd() {
		
		return "forward:/pages/notice/add.jsp";
	}
	
	
	/**
	 * 添加公告
	 * @param notice
	 * @return
	 */
	@RequestMapping("/addNotice")
	public String  addNotice(Notice notice) {
		
		
		noticeService.addNotice(notice);
		
		return "redirect:/pages/notice/add.jsp";
	}
	
	
	
	
	
	/**
	 * 用于修改公告时回显信息
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/update")
	public String update(String id,Model model) {
		
		int id1 = Integer.parseInt(id);
		Notice notice = noticeService.findNoticeById(id1);
		model.addAttribute("notice", notice);
		
		return "forward:/pages/notice/update.jsp";
	}
	
	
	/**
	 * 修改公告
	 * @param notice
	 * @return
	 */
	@RequestMapping("/updateNotice")
	public String updateNotice(Notice notice) {
		
		//设置当前的时间为修改时间
		notice.setLastModifiled(new Date());
		
		noticeService.updateNotice(notice);
		return "redirect:/pages/notice/update.jsp";
	}
	
	
	/**
	 * 根据id删除公告
	 * @param id
	 * @return
	 */
	@RequestMapping("/deleteNotice")
	public String deleteNotice(Integer id) {
		
		noticeService.deleteNotice(id);
		return "redirect:/notice/findAll";
	}
	
	
	
	
	
	
	/**
	 * 模糊查询
	 * @param pn
	 * @param notice
	 * @param model
	 * @return
	 */
	@RequestMapping("/moHuSearch")
	public String moHuSearch(@RequestParam(value="pn",defaultValue="1")Integer pn,Notice notice,Model model) {
		PageHelper.startPage(pn, 5);
		
		//用于回显和保存模糊查询的条件
		model.addAttribute("notice1", notice);
		
		List<Notice> list = noticeService.moHuSearch(notice);
		//对模糊查询的结果进行分页
		PageInfo<Notice> info = new PageInfo<Notice>(list);
		model.addAttribute("info", info);
		
		
		return "forward:/pages/notice/list.jsp";
	}
	
	
	@RequestMapping("/readNotice")
	public String readNotice(Integer id,Map<String,Object> map) {
		
		noticeService.updateNoticeStateZero();
		noticeService.updateNoticeStateOne(id);
		
		
		Notice notice = noticeService.findNoticeById(id);
		
		map.put("readNotice", notice);
		
		return "forward:/pages/notice/readNotice.jsp";
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
