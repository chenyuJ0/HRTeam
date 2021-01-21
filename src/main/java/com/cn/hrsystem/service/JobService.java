package com.cn.hrsystem.service;

import java.util.List;

import com.cn.hrsystem.domain.Dept;
import com.cn.hrsystem.domain.Job;

//业务逻辑层实现的接口
public interface JobService {

	//查找job表所有信息
	public List<Job> findAllJob(); 
	
	
	//添加职位
	public void addJob(Job job);
	
	
	//修改职位信息
	public void updateJob(Job job);
	
	
	//根据id删除职位
	public void deleteJob(int id);
	
	//根据id查询job信息
	public Job findJobById(int id);
	
	
	//根据页面传的数据进行模糊查询
	public List<Job> moHuSearch(Job job);
	
	
	//查询所有部门信息
	public List<Dept> findAllDept();
	
	
	//jungle要的查询职位id和名字
	public List<Job> findJobIdAndName();
	
	
	
}
