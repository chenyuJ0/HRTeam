package com.cn.hrsystem.web.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	// 将从前台传过来的String类型日期格式转换成Date类型
	@InitBinder
	public void initDateformat(WebDataBinder dataBinder) {
		dataBinder.addCustomFormatter(new DateFormatter("yyyy-MM-dd"));
	}
	
	/**
	 * 分页查询所有员工信息、根据用户输入条件模糊查询员工信息
	 * @param pn
	 * @param emp
	 * @param model
	 * @return
	 */
	@RequestMapping("/findAllEmps")
	public String findAllEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Employee emp, HttpServletRequest request, Model model) {
		PageHelper.startPage(pn, 5);
		List<Employee> list = employeeService.findEmpsByCondition(emp);
		// 获取页码信息
		PageInfo<Employee> info = new PageInfo<Employee>(list);

		model.addAttribute("emp", emp);
		model.addAttribute("info", info);
		return "forward:/pages/employee/index.jsp";
	}
	
	/**
	 * 根据员工id查询员工信息，用于操作员工信息时，回显操作前的员工信息
	 * @param req
	 * @param res
	 * @throws IOException
	 * @throws ServletException
	 */
	@RequestMapping("/findEmpById")
	public void findEmpById(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
		Integer id = Integer.valueOf(req.getParameter("id"));
		Employee emp = employeeService.findEmpById(id);
		if(emp != null) {
			Date hiredate = emp.getHiredate();
			// 获取原转正日期（原转正日期显示为入职日期推后3个月的日期）
			Date rechangedate = new Date();
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(hiredate);
			calendar.add(calendar.MONTH, +3);
			rechangedate = calendar.getTime();
			
			req.setAttribute("rechangedate", rechangedate);
			req.setAttribute("emp", emp);
			if("edit".equals(req.getParameter("action"))) {
				req.getRequestDispatcher("/pages/employee/edit.jsp").forward(req, res);
			}else if("changer".equals(req.getParameter("action"))) {
				req.getRequestDispatcher("/pages/employee/changer.jsp").forward(req, res);
			}else if("dimission".equals(req.getParameter("action"))) {
				req.getRequestDispatcher("/pages/employee/dimission.jsp").forward(req, res);
			}else if("showInfo".equals(req.getParameter("action"))) {
				req.getRequestDispatcher("/pages/employee/showInfo.jsp").forward(req, res);
			}
		}
	}
	
	/**
	 * 添加员工
	 * @param employee
	 * @return
	 */
	@RequestMapping("/addEmp")
	public String addEmp(Employee employee) {
		employeeService.addEmp(employee);
		return "redirect:/emp/findAllEmps";
	}
	
	/**
	 * 修改员工信息
	 * @param employee
	 * @return
	 */
	@RequestMapping("/updateEmp")
	public String updateEmp(Employee employee) {
		employeeService.updateEmp(employee);
		return "redirect:/emp/findAllEmps";
	}
	
	/**
	 * 员工转正
	 * @param employee
	 * @return
	 */
	@RequestMapping("/change")
	public String changeWorkMessage(Employee employee, HttpServletRequest request) {
		employeeService.changeWorkMessage(employee);
		return "redirect:/emp/findAllEmps";
	}
	
	/**
	 * 员工离职
	 * @param employee
	 * @return
	 */
	@RequestMapping("/dimission")
	public String dimission(Employee employee) {
		employeeService.dimission(employee);
		return "redirect:/emp/findAllEmps";
	}
	
	/**
	 * 前台删除员工时，修改该员工的deletestatus
	 * @param employee
	 * @return
	 */
	@RequestMapping("/modifiedDeletestatus")
	public String modifiedDeletestatus(Employee employee) {
		employeeService.modifiedDeletestatus(employee);
		return "redirect:/emp/findAllEmps";
	}

}
