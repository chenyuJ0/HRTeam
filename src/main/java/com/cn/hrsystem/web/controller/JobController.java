package com.cn.hrsystem.web.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cn.hrsystem.domain.Dept;
import com.cn.hrsystem.domain.Job;
import com.cn.hrsystem.service.JobService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/job")
public class JobController {

	@Autowired
	private JobService jobService;
	
	
	/**
	 * 查找所有job信息，给list页面展示
	 * @param model
	 * @return
	 */
	@RequestMapping("/findAllJob")
	public String findAllJob(Model model) {
		
		List<Job> list = jobService.findAllJob();
		
		
		model.addAttribute("list", list);
		return "forward:/pages/job/list.jsp";
	}
	
	
	/**
	 * 对job查询到的信息进行分页
	 * @param pn
	 * @param model
	 * @return
	 */
	@RequestMapping("/findAll")
	public String findAll(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model) {
		PageHelper.startPage(pn, 3);
		
		List<Job> list = jobService.findAllJob();
		
		PageInfo<Job> info = new PageInfo<Job>(list);
		model.addAttribute("info", info);
		
		List<Dept> list2 = jobService.findAllDept();
		model.addAttribute("list2", list2);
		
		List<Job> list3 = jobService.findAllJob();
		model.addAttribute("list3", list3);
		
		return "forward:/pages/job/list.jsp";
	}
	
	
	/**
	 * 添加职业
	 * @param job
	 * @return
	 */
	@RequestMapping("/addJob")
	public String addJob(Job job) {
		
		jobService.addJob(job);
		
		return "redirect:/pages/job/add.jsp";
	}
	
	/**
	 * 修改部门
	 * @param job
	 * @return
	 */
	@RequestMapping("updateJob")
	public String updateJob(Job job) {
		jobService.updateJob(job);
		
		return "redirect:/job/findAll";
	}
	
	/**
	 * 删除部门
	 * @param id
	 * @return
	 */
	@RequestMapping("/deleteJob")
	public String deleteJob(String id) {
		int ids = Integer.parseInt(id);
		jobService.deleteJob(ids);
		return "redirect:/job/findAll";
	}
	
	
	
//	/**
//	 * 跳转到job下的add.jsp页面
//	 * @return
//	 */
//	@RequestMapping("/add")
//	public String returnadd() {
//		
//		return "forward:/pages/job/add.jsp";
//	}
//	
	
	/**
	 * 根据id查找部门信息回显给update页面
	 * @return
	 */
	@RequestMapping("/update")
	public String returnUpdate(String id,Model model) {
		int byId = Integer.parseInt(id);
		
		Job job = jobService.findJobById(byId);
		model.addAttribute("job",job);
		return "forward:/pages/job/update.jsp";
	}

	
	
	
//	/**
//	 * 模糊查询
//	 * @param pn
//	 * @param job
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping("/moHuSearch")
//	public String moHuSearch(@RequestParam(value="pn",defaultValue="1")Integer pn,Job job,Model model) {
//		
//		PageHelper.startPage(pn, 3);
//		
//		System.out.println(job);
//		List<Job> list = jobService.moHuSearch(job);
//		
//		System.out.println(list);
//		
//		
//		//对模糊查询的结果进行分页
//		PageInfo<Job> info = new PageInfo<Job>(list);
//		model.addAttribute("info", info);
//		
//		return "forward:/pages/job/list.jsp";
//	}
//	
	
	
	/**
	 * 模糊查询
	 * @param pn
	 * @param job
	 * @param model
	 * @return
	 */
	@RequestMapping("/moHuSearch")
	public String moHuSearch(@RequestParam(value="pn",defaultValue="1")Integer pn,String des,String dept_id,String jobname, Model model) {
		
		PageHelper.startPage(pn, 3);
		Job job = new Job();
		
		System.out.println(dept_id);
		if(dept_id != null && !("".equals(dept_id))) {
			int dept_id1 = Integer.parseInt(dept_id);
			job.setDept_id(dept_id1);
		}
		
		job.setDes(des);
		job.setJobname(jobname);
		
		System.out.println(job);
		List<Job> list = jobService.moHuSearch(job);
		
		//对模糊查询的结果进行分页
		PageInfo<Job> info = new PageInfo<Job>(list);
		model.addAttribute("info", info);
		
		//保证下拉框有数据信息
		List<Dept> list2 = jobService.findAllDept();
		model.addAttribute("list2", list2);
		
		List<Job> list3 = jobService.findAllJob();
		model.addAttribute("list3", list3);
		
		return "forward:/pages/job/list.jsp";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
