package com.cn.hrsystem.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cn.hrsystem.domain.Employee;
import com.cn.hrsystem.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/emp")
public class EmployeeController {
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping("/findDim")
	public String findDim(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model) {
		PageHelper.startPage(pn,2);
		List<Employee> list = employeeService.findAllDimission();
		PageInfo<Employee> info = new PageInfo<Employee>(list);
		model.addAttribute("info",info);
		return "forward:/pages/contract/dimissionSelect.jsp";
	}
}
