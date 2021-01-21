package com.cn.hrsystem.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import com.cn.hrsystem.domain.Employee;

@Repository
public interface EmployeeDao {
	/**
	 * 分页查询所有员工信息、根据用户输入条件模糊查询员工信息
	 * @return
	 */
	@Select("<script>"+"select * from employee where 1=1 "
			+ "<if test=\"jobnum != null and jobnum != ''\">and jobnum like '%${jobnum}%'</if>"
			+ "<if test=\"dept_id != 0\">and dept_id like '%${dept_id}%'</if>"
			+ "<if test=\"job_id != 0\">and job_id like '%${job_id}%'</if>"
			+ "<if test=\"empname != null and empname != ''\">and empname like '%${empname}%'</if>"
			+ "<if test=\"work_status != -1\">and work_status like '%${work_status}%'</if>"
			+ "<if test=\"work_message != -1\">and work_message like '%${work_message}%'</if>"
			+"</script>")
	@Results(id="empMap",value= {
			// dept映射
			@Result(id=true,column="dept_id",property="dept_id"),
			@Result(property="dept",column="dept_id",one = @One(select= "com.cn.hrsystem.dao.DeptDao.findDeptById",fetchType=FetchType.EAGER)),
			// job映射
			@Result(id=true,column="job_id",property="job_id"),
			@Result(property="job",column="job_id",one = @One(select="com.cn.hrsystem.dao.JobDao.findJobById",fetchType=FetchType.EAGER))
	})
	public List<Employee> findEmpsByCondition(Employee employee);
	
	/**
	 * 根据员工id查询员工信息
	 * @param id
	 * @return
	 */
	@ResultMap("empMap")
	@Select("select * from employee where id=#{id}")
	public Employee findEmpById(int id);
	
	/**
	 * 修改员工信息
	 * @param employee
	 */
	@Update("update employee set empname=#{empname },empID=#{empID },dept_id=#{dept_id },job_id=#{job_id },"
			+ "work_status=#{work_status },work_message=#{work_message },hiredate=#{hiredate },"
			+ "introducer=#{introducer },comment=#{comment } where id=#{id }")
	public void updateEmp(Employee employee);
	
	/**
	 * 添加员工
	 * @param employee
	 */
	@Insert("insert into employee(empname,empID,jobnum,birth,gender,dept_id,job_id,work_status,work_message,"
			+ "hiredate,introducer,comment)"
			+ " values(empname=#{empname },empID=#{empID },jobnum=#{jobnum },birth=#{birth },gender=#{gender },"
			+ "dept_id=#{dept_id },job_id=#{job_id },work_status=#{work_status },work_message=#{work_message },"
			+ "hiredate=#{hiredate },introducer=#{introducer },comment=#{comment })")
	public void addEmp(Employee employee);
	
}
