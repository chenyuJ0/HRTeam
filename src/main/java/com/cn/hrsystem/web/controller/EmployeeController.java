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
	
	// ����ǰ̨��������String�������ڸ�ʽת����Date����
	@InitBinder
	public void initDateformat(WebDataBinder dataBinder) {
		dataBinder.addCustomFormatter(new DateFormatter("yyyy-MM-dd"));
	}
	
	/**
	 * ��ҳ��ѯ����Ա����Ϣ�������û���������ģ����ѯԱ����Ϣ
	 * @param pn
	 * @param emp
	 * @param model
	 * @return
	 */
	@RequestMapping("/findAllEmps")
	public String findAllEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Employee emp, HttpServletRequest request, Model model) {
		PageHelper.startPage(pn, 5);
		List<Employee> list = employeeService.findEmpsByCondition(emp);
		// ��ȡҳ����Ϣ
		PageInfo<Employee> info = new PageInfo<Employee>(list);

		model.addAttribute("emp", emp);
		model.addAttribute("info", info);
		return "forward:/pages/employee/index.jsp";
	}
	
	/**
	 * ����Ա��id��ѯԱ����Ϣ�����ڲ���Ա����Ϣʱ�����Բ���ǰ��Ա����Ϣ
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
			// ��ȡԭת�����ڣ�ԭת��������ʾΪ��ְ�����ƺ�3���µ����ڣ�
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
	 * ���Ա��
	 * @param employee
	 * @return
	 */
	@RequestMapping("/addEmp")
	public String addEmp(Employee employee) {
		employeeService.addEmp(employee);
		return "redirect:/emp/findAllEmps";
	}
	
	/**
	 * �޸�Ա����Ϣ
	 * @param employee
	 * @return
	 */
	@RequestMapping("/updateEmp")
	public String updateEmp(Employee employee) {
		employeeService.updateEmp(employee);
		return "redirect:/emp/findAllEmps";
	}
	
	/**
	 * Ա��ת��
	 * @param employee
	 * @return
	 */
	@RequestMapping("/change")
	public String changeWorkMessage(Employee employee, HttpServletRequest request) {
		employeeService.changeWorkMessage(employee);
		return "redirect:/emp/findAllEmps";
	}
	
	/**
	 * Ա����ְ
	 * @param employee
	 * @return
	 */
	@RequestMapping("/dimission")
	public String dimission(Employee employee) {
		employeeService.dimission(employee);
		return "redirect:/emp/findAllEmps";
	}
	
	/**
	 * ǰ̨ɾ��Ա��ʱ���޸ĸ�Ա����deletestatus
	 * @param employee
	 * @return
	 */
	@RequestMapping("/modifiedDeletestatus")
	public String modifiedDeletestatus(Employee employee) {
		employeeService.modifiedDeletestatus(employee);
		return "redirect:/emp/findAllEmps";
	}

}
