package com.cn.hrsystem.service;

import java.util.List;

import com.cn.hrsystem.domain.Dept;



//业务逻辑层实现类的接口
public interface DeptService {

		//查询所有部门
		public List<Dept> findAllDept();
		
		//添加部门
		public void addDept(Dept dept);
		
		//修改部门信息
		public void updateDept(Dept dept);
		
		//删除部门信息
		public void deleteDept(int id);
	
		//根据id查找部门信息
		public Dept findDeptById(int id);
		
		//模糊查询
		public List<Dept> moHuSearch(Dept dept);
		
		//jungle要的查询部门id和名字
		public List<Dept> findDeptIdAndName();
		
		
}
