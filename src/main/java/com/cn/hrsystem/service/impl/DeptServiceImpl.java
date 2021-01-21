package com.cn.hrsystem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.hrsystem.dao.DeptDao;
import com.cn.hrsystem.domain.Dept;

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
		
//		//根据用户名查id，只显示名字就行，因为登录成功，所以表中用户名必定存在
//		int userId = deptDao.findUserIdByName(dept.getUser().getUsername());
//		dept.setUser_id(userId);
//		//员工表同理,但员工使用户输入，所以可能不在表中
//		int employeeId = deptDao.findemployeeIdByName(dept.getEmp().getEmpname());
//		if(employeeId == 0) {
//			
//		}else {
//			dept.setDeptManager(employeeId);
//			deptDao.addDept(dept);
//		}
		
		//根据用户名查id，只显示名字就行，因为登录成功，所以表中用户名必定存在
		int userId = deptDao.findUserIdByName(dept.getUser().getUsername());
		dept.setUser_id(userId);
		deptDao.addDept(dept);
		
	}


	//修改部门信息
	@Override
	public void updateDept(Dept dept) {
		deptDao.updateDept(dept);
		
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

	
	//jungle要的查询部门id和名字
	@Override
	public List<Dept> findDeptIdAndName() {
		List<Dept> list = deptDao.findDeptIdAndName();
		return list;
	}



	
	
	
	
	
}
