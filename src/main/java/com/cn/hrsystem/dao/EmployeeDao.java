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
	@Select("<script>"+"select * from employee where (deletestatus != 1 or deletestatus is null) "
			+ "<if test=\"jobnum != null and jobnum != ''\">and jobnum like '%${jobnum}%'</if>"
			+ "<if test=\"dept_id != 0\">and dept_id = #{dept_id}</if>"
			+ "<if test=\"job_id != 0\">and job_id = #{job_id}</if>"
			+ "<if test=\"empname != null and empname != ''\">and empname like '%${empname}%'</if>"
			+ "<if test=\"work_status != 0\">and work_status = #{work_status}-1</if>"
			+ "<if test=\"work_message != 0\">and work_message = #{work_message}-1</if>"
			+"</script>")
	@Results(id="empMap",value= {
			// dept映射
			@Result(id=true,column="dept_id",property="dept_id"),
			@Result(property="dept",column="dept_id",one = @One(select= "com.cn.hrsystem.dao.DeptDao.findDeptById",fetchType=FetchType.EAGER)),
			// job映射
			@Result(id=true,column="job_id",property="job_id"),
			@Result(property="job",column="job_id",one = @One(select="com.cn.hrsystem.dao.JobDao.findJobById",fetchType=FetchType.EAGER)),
			// user映射
			@Result(id=true,column="recorder",property="recorder"),
			@Result(property="user",column="recorder",one = @One(select="com.cn.hrsystem.dao.UserDao.findUserById",fetchType=FetchType.EAGER)),
	})
	public List<Employee> findEmpsByCondition(Employee employee);
	
	/**
	 * 根据员工id查询员工信息
	 * @param id
	 * @return
	 */
	@ResultMap("empMap")
	@Select("select * from employee where (deletestatus != 1 OR deletestatus IS NULL) and id=#{id}")
	public Employee findEmpById(int id);
	
	/**
	 * 查询员工人数
	 * @return
	 */
	@Select("select count(id) from employee where (deletestatus != 1 OR deletestatus IS NULL)")
	public int findEmpCounts();
	
	/**
	 * 查询员工记录中最大的员工编号
	 * @return
	 */
	@Select("select max(jobnum) from employee")
	public String findMaxJobnum();
	
	/**
	 * 修改员工信息
	 * @param employee
	 */
	@Update("update employee set empname=#{empname },empID=#{empID },birth=#{birth },gender=#{gender },"
			+ "dept_id=#{dept_id },job_id=#{job_id },work_status=#{work_status },work_message=#{work_message },"
			+ "hiredate=#{hiredate },introducer=#{introducer },comment=#{comment } where id=#{id }")
	public int updateEmp(Employee employee);
	
	/**
	 * 添加员工
	 * @param employee
	 */
	@Insert("insert into employee(empname,empID,jobnum,birth,gender,job_id,dept_id,work_status,work_message,"
			+ "hiredate,introducer,comment,recorder)"
			+ "values(#{empname },#{empID },#{jobnum },#{birth },#{gender },#{job_id },#{dept_id },#{work_status },"
			+ "#{work_message },#{hiredate },#{introducer },#{comment },#{recorder })")
	public int addEmp(Employee employee);
	
	/**
	 * 员工转正
	 * @param employee
	 */
	@Update("update employee set changerecorder=#{changerecorder },work_message=#{work_message },"
			+ "changetype=#{changetype },changedate=#{changedate },changecomment=#{changecomment } where id=#{id }")
	public int changeWorkMessage(Employee employee);
	
	/**
	 * 员工离职
	 * @param employee
	 * @return
	 */
	@Update("update employee set work_status=#{work_status },leavedate=#{leavedate },leavereason=#{leavereason },"
			+ "leavetype=#{leavetype },leavecomment=#{leavecomment } where id=#{id }")
	public int dimission(Employee employee);
	
	/**
	 * 前台删除员工时，修改该员工的deletestatus
	 * @param employee
	 * @return
	 */
	@Update("update employee set deletestatus=1 where id=#{id }")
	public int modifiedDeletestatus(Employee employee);
}
