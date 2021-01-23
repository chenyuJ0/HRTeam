package com.cn.hrsystem.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.cn.hrsystem.domain.Dept;
import com.cn.hrsystem.domain.Employee;
import com.cn.hrsystem.domain.Job;
import com.cn.hrsystem.domain.User;


@Repository
public interface DeptDao {
//		//查询所有部门
//		@Select("SELECT d.id,d.deptno,d.deptname,d.create_date,d.des,z.count FROM dept d LEFT JOIN (SELECT e.`dept_id`,COUNT(*) 'count' FROM employee e GROUP BY e.dept_id  ) z ON z.dept_id=d.id ")
//		public List<Dept> findAllDept();
//		
		
		//添加部门
		@Insert("insert into dept(id,deptno,deptname,create_date,des,deptManager,user_id) values(null,#{deptno},#{deptname},#{create_date},#{des},#{deptManager},#{user_id})")
		public void addDept(Dept dept);
		//添加部门
		@Insert("insert into dept(id,deptno,deptname,create_date,des,deptManager,user_id) values(null,#{deptno},#{deptname},#{create_date},#{des},null,#{user_id})")
		public void addDept1(Dept dept);
		
		
		
		//修改部门信息
		@Update("update dept set deptno=#{deptno},deptname=#{deptname},create_date=#{create_date},des=#{des},deptManager=#{deptManager} where id=#{id}")
		public void updateDept(Dept dept);
		//修改部门信息1
		@Update("update dept set deptno=#{deptno},deptname=#{deptname},create_date=#{create_date},des=#{des},deptManager=null where id=#{id}")
		public void updateDept1(Dept dept);
		
		
		//删除部门信息
		@Delete("delete from dept where id=#{id}")
		public void deleteDept(int id);
		
		
		//根据id查找部门信息
		@Select("select * from dept where id=#{id}")
		public Dept findDeptById(int id); 
		
		
		
		//查询所有部门信息
		@Select("select * from dept")
		@Results(id="deptMap",value= {
				@Result(id=true,column="id",property="id"),
				@Result(column="deptno",property="deptno"),
				@Result(column="deptname",property="deptname"),
				@Result(column="create_date",property="create_date"),
				@Result(column="des",property="des"),
				@Result(column="create_date",property="create_date"),
				@Result(column="id",property="count",one=@One(select="com.cn.hrsystem.dao.DeptDao.findCountById")),
				@Result(column="deptManager",property="emp",one=@One(select="com.cn.hrsystem.dao.DeptDao.findEmpById")),
				@Result(column="user_id",property="user",one=@One(select="com.cn.hrsystem.dao.DeptDao.findUserById"))
		})
		public List<Dept> findAllDept();
		
		
		//根据id查询employee所有属性
		@Select("select * from employee where id=#{id}")
		public Employee findEmpById(int id);
		
		//根据id查询user所有属性
		@Select("select * from user where id=#{id}")
		public User findUserById(int id);
		
		//根据id查找部门得人数
		@Select("SELECT z.count FROM dept d LEFT JOIN (SELECT e.`dept_id`,COUNT(*) 'count' FROM employee e GROUP BY e.dept_id  ) z ON z.dept_id=d.id where d.id=#{id}")
		public int findCountById(int id);
		
		
		//在user表中根据用户名查id,名字可重复
		@Select("select id from user where username=#{username} limit 0,1")
		public int findUserIdByName(String username);
		
		//在employee表中根据用户名查id,名字可重复
		@Select("select id from employee where empname=#{empname} limit 0,1")
		public int findemployeeIdByName(String username);
		
		
		//模糊查询
		@Select("<script>"+
					" select * from dept where 1=1 "+
					"<if test= \"id != null and id != '' \"> and id=#{id} </if>"+
					"<if test= \"des != null and des != '' \"> and des like CONCAT('%',#{des},'%')</if>"+
	            "</script>"
	    )
		@ResultMap("deptMap")
		public List<Dept> moHuSearch(Dept dept);
		
		
		
		//查询所有员工的信息
		@Select("select * from employee")
		public List<Employee> findAllEmployee();
		
		
		
		
		
		//jungle要的查询部门id和名字
		@Select("select id,deptname from dept")
		public List<Dept> findDeptIdAndName();
		
		//jungle要的查询部门数量的信息
		@Select("select count(*) from dept")
		public int findDeptCount();
		
		
		
		
}
