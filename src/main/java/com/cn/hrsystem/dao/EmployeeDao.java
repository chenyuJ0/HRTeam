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
	 * ��ҳ��ѯ����Ա����Ϣ�������û���������ģ����ѯԱ����Ϣ
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
			// deptӳ��
			@Result(id=true,column="dept_id",property="dept_id"),
			@Result(property="dept",column="dept_id",one = @One(select= "com.cn.hrsystem.dao.DeptDao.findDeptById",fetchType=FetchType.EAGER)),
			// jobӳ��
			@Result(id=true,column="job_id",property="job_id"),
			@Result(property="job",column="job_id",one = @One(select="com.cn.hrsystem.dao.JobDao.findJobById",fetchType=FetchType.EAGER)),
			// userӳ��
			@Result(id=true,column="recorder",property="recorder"),
			@Result(property="user",column="recorder",one = @One(select="com.cn.hrsystem.dao.UserDao.findUserById",fetchType=FetchType.EAGER)),
	})
	public List<Employee> findEmpsByCondition(Employee employee);
	
	/**
	 * ����Ա��id��ѯԱ����Ϣ
	 * @param id
	 * @return
	 */
	@ResultMap("empMap")
	@Select("select * from employee where (deletestatus != 1 OR deletestatus IS NULL) and id=#{id}")
	public Employee findEmpById(int id);
	
	/**
	 * ��ѯԱ������
	 * @return
	 */
	@Select("select count(id) from employee where (deletestatus != 1 OR deletestatus IS NULL)")
	public int findEmpCounts();
	
	/**
	 * ��ѯԱ����¼������Ա�����
	 * @return
	 */
	@Select("select max(jobnum) from employee")
	public String findMaxJobnum();
	
	/**
	 * �޸�Ա����Ϣ
	 * @param employee
	 */
	@Update("update employee set empname=#{empname },empID=#{empID },birth=#{birth },gender=#{gender },"
			+ "dept_id=#{dept_id },job_id=#{job_id },work_status=#{work_status },work_message=#{work_message },"
			+ "hiredate=#{hiredate },introducer=#{introducer },comment=#{comment } where id=#{id }")
	public int updateEmp(Employee employee);
	
	/**
	 * ���Ա��
	 * @param employee
	 */
	@Insert("insert into employee(empname,empID,jobnum,birth,gender,job_id,dept_id,work_status,work_message,"
			+ "hiredate,introducer,comment,recorder)"
			+ "values(#{empname },#{empID },#{jobnum },#{birth },#{gender },#{job_id },#{dept_id },#{work_status },"
			+ "#{work_message },#{hiredate },#{introducer },#{comment },#{recorder })")
	public int addEmp(Employee employee);
	
	/**
	 * Ա��ת��
	 * @param employee
	 */
	@Update("update employee set changerecorder=#{changerecorder },work_message=#{work_message },"
			+ "changetype=#{changetype },changedate=#{changedate },changecomment=#{changecomment } where id=#{id }")
	public int changeWorkMessage(Employee employee);
	
	/**
	 * Ա����ְ
	 * @param employee
	 * @return
	 */
	@Update("update employee set work_status=#{work_status },leavedate=#{leavedate },leavereason=#{leavereason },"
			+ "leavetype=#{leavetype },leavecomment=#{leavecomment } where id=#{id }")
	public int dimission(Employee employee);
	
	/**
	 * ǰ̨ɾ��Ա��ʱ���޸ĸ�Ա����deletestatus
	 * @param employee
	 * @return
	 */
	@Update("update employee set deletestatus=1 where id=#{id }")
	public int modifiedDeletestatus(Employee employee);
}
