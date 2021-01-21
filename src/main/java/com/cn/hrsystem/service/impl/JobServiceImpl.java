package com.cn.hrsystem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.hrsystem.dao.JobDao;
import com.cn.hrsystem.domain.Dept;
import com.cn.hrsystem.domain.Job;
import com.cn.hrsystem.service.JobService;

//业务逻辑层
@Service("jobService")
public class JobServiceImpl implements JobService{

	@Autowired
	private JobDao jobDao;
	
	
	
	@Override
	public List<Job> findAllJob() {
		List<Job> list = jobDao.findAllJob();
		return list;
	}



	@Override
	public void addJob(Job job) {
		jobDao.addJob(job);
		
	}



	@Override
	public void updateJob(Job job) {
		jobDao.update(job);
		
	}



	@Override
	public void deleteJob(int id) {
		jobDao.deleteJob(id);
		
	}



	@Override
	public Job findJobById(int id) {
		Job job = jobDao.findJobById(id);
		return job;
	}



	@Override
	public List<Job> moHuSearch(Job job) {
		List<Job> list = jobDao.moHuSearch(job);
		return list;
	}



	@Override
	public List<Dept> findAllDept() {
		List<Dept> list = jobDao.findAllDept();
		return list;
	}



	@Override
	public List<Job> findJobIdAndName() {
		List<Job> list = jobDao.findJobIdAndName();
		return list;
	}

	
	
	
}
