package com.cn.hrsystem.web.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cn.hrsystem.domain.Dept;
import com.cn.hrsystem.domain.Job;
import com.cn.hrsystem.service.DeptService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;



@Controller
@RequestMapping("/dept")
public class DeptController {

	@Autowired
	private DeptService deptService;
	
	
	
	
	/**
	 * 查询所有部门信息
	 * @param model
	 * @throws Exception 
	 */
	@RequestMapping("/findAllDept")
	public String findAllDept(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception {
		List<Dept> list = deptService.findAllDept();
		
		model.addAttribute("list",list);
		
		//request.getRequestDispatcher("/test.jsp").forward(request, response);
		
		return "forward:/pages/dept/list.jsp";
		//return "test";
	}
	
	
	/**
	 * 添加部门
	 * @param dept
	 * @param request
	 * @param response
	 */
	
	@RequestMapping("/addDept")
	public String addDept(Dept dept) {
		
		System.out.println(dept);
		deptService.addDept(dept);
		
		return "redirect:/pages/dept/add.jsp";
	}
	
	/**
	 * 修改部门
	 * @param dept
	 * @return
	 */
	@RequestMapping("updateDept")
	public String updateDept(Dept dept) {
		deptService.updateDept(dept);
		
		return "redirect:/dept/findAll";
	}
	
	/**
	 * 删除部门
	 * @param id
	 * @return
	 */
	@RequestMapping("/deleteDept")
	public String deleteDept(String id) {
		int ids = Integer.parseInt(id);
		deptService.deleteDept(ids);
		return "redirect:/dept/findAll";
	}
	
//	/**
//	 * 跳转到add.jsp页面
//	 * @return
//	 */
//	@RequestMapping("/add")
//	public String returnAdd() {
//		
//		return "forward:/pages/dept/add.jsp";
//	}
//	
	
	/**
	 * 根据id查找部门信息回显给update页面
	 * @return
	 */
	@RequestMapping("/update")
	public String returnUpdate(String id,Model model) {
		int byId = Integer.parseInt(id);
		Dept dept = deptService.findDeptById(byId);
		model.addAttribute("dept",dept);
		return "forward:/pages/dept/update.jsp";
	}
	
	
	/**
	 * 分页
	 * @param pn
	 * @param model
	 * @return
	 */
	@RequestMapping("/findAll")
	public String findAll(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model) {
		PageHelper.startPage(pn, 2);
		List<Dept> list = deptService.findAllDept();
		
		PageInfo<Dept> info = new PageInfo<Dept>(list);
		model.addAttribute("info", info);
		
		//保证下拉框有数据信息
		List<Dept> list2 = deptService.findAllDept();
		model.addAttribute("list2", list2);
		
		return "forward:/pages/dept/list.jsp";
	}
	
	
	/**
	 * 模糊查询
	 * @param pn
	 * @param job
	 * @param model
	 * @return
	 */
	@RequestMapping("/moHuSearch")
	public String moHuSearch(@RequestParam(value="pn",defaultValue="1")Integer pn,String des,String id, Model model) {
		
		PageHelper.startPage(pn, 3);
		Dept dept= new Dept();
		
		if(id != null && !("".equals(id))) {
			int id1 = Integer.parseInt(id);
			dept.setId(id1);
		}
		
		dept.setDes(des);
		
		
		List<Dept> list = deptService.moHuSearch(dept);
		
		//对模糊查询的结果进行分页
		PageInfo<Dept> info = new PageInfo<Dept>(list);
		model.addAttribute("info", info);
		
		//保证下拉框有数据信息
		List<Dept> list2 = deptService.findAllDept();
		model.addAttribute("list2", list2);
		
		
		return "forward:/pages/dept/list.jsp";
	}
	
	
	
	
	
}
