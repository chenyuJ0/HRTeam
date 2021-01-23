package com.cn.hrsystem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.hrsystem.dao.DeptDao;
import com.cn.hrsystem.domain.Dept;
import com.cn.hrsystem.domain.Employee;
import com.cn.hrsystem.service.DeptService;





//业务逻辑层实现类
@Service("deptService")
public class DeptServiceImpl implements DeptService{

	@Autowired
	private DeptDao deptDao;

	//查询所有部门信息
	@Override
	public List<Dept> findAllDept() {
		List<Dept> list = deptDao.findAllDept();
		return list;
	}

	//添加部门
	@Override
	public void addDept(Dept dept) {
		
		deptDao.addDept(dept);
	}
	@Override
	public void addDept1(Dept dept) {
		deptDao.addDept1(dept);
		
	}

	


	//修改部门信息
	@Override
	public void updateDept(Dept dept) {
		deptDao.updateDept(dept);
		
	}
	
	@Override
	public void updateDept1(Dept dept) {
		deptDao.updateDept1(dept);
	}


	//删除部门信息
	@Override
	public void deleteDept(int id) {
		deptDao.deleteDept(id);
		
	}

	//根据id查找部门信息
	@Override
	public Dept findDeptById(int id) {
		Dept dept = deptDao.findDeptById(id);
		return dept;
	}

	@Override
	public List<Dept> moHuSearch(Dept dept) {
		List<Dept> list = deptDao.moHuSearch(dept);
		return list;
	}

	

	@Override
	public List<Employee> findAllEmployee() {
		List<Employee> list = deptDao.findAllEmployee();
		return list;
	}
	
	
	
	

	//jungle要的查询部门id和名字
	@Override
	public List<Dept> findDeptIdAndName() {
		List<Dept> list = deptDao.findDeptIdAndName();
		return list;
	}
	@Override
	public int findDeptCount() {
		int count = deptDao.findDeptCount();
		return count;
	}

	




	
	
	
	
	
}
