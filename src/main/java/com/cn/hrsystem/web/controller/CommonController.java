package com.cn.hrsystem.web.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cn.hrsystem.domain.Notice;
import com.cn.hrsystem.service.ContractService;
import com.cn.hrsystem.service.DeptService;
import com.cn.hrsystem.service.DocumentService;
import com.cn.hrsystem.service.EmployeeService;
import com.cn.hrsystem.service.JobService;
import com.cn.hrsystem.service.NoticeService;
import com.cn.hrsystem.service.UserService;

@Controller
public class CommonController {
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private ContractService contractService;
	@Autowired
	private DeptService deptService;
	@Autowired
	private JobService jobService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private UserService userService;
	@Autowired
	private DocumentService documentService;

	// 欢迎页面
	@RequestMapping("/welcome")
	public String welcome(Map<String, Object> map) {
		// 获取welcome页面用来展示的数据
		int users = userService.findAllUsers();
		int emps = employeeService.findEmpCounts();
		int depts = deptService.findDeptCount();
		int jobs = jobService.findJobCount();
		int documents = documentService.findDocumentCounts();
		int contracts = contractService.findContractCounts();
		Notice notice = noticeService.findNoticeState();
		map.put("users", users);
		map.put("emps", emps);
		map.put("depts", depts);
		map.put("jobs", jobs);
		map.put("documents", documents);
		map.put("contracts", contracts);

		map.put("readNoticeByState", notice);

		return "forward:/welcome.jsp";
	}

	@RequestMapping(value = "/{formName}")
	public String loginForm(@PathVariable String formName) {
		// 作为一个空方法，可以匹配任何无效输入，再跳转到404
		return formName;
//		String blank = "blank";
//		return blank;
	}

	@RequestMapping(value = "/")
	public String index() {
		String blank = "index";
		return blank;
	}

}
