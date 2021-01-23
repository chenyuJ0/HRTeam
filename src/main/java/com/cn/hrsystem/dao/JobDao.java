package com.cn.hrsystem.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.cn.hrsystem.domain.Dept;
import com.cn.hrsystem.domain.Job;

@Repository
public interface JobDao {

	//查找job表所有信息
	@Select("select * from job")
	@Results(id="jobMap",value= {
			@Result(id=true,column="id",property="id"),
			@Result(column="jobno",property="jobno"),
			@Result(column="jobname",property="jobname"),
			@Result(column="dept_id",property="depts",many=@Many(select="com.cn.hrsystem.dao.JobDao.findAllDeptById"))
	})
	public List<Job> findAllJob(); 
	
	//根据id查询dept表
	@Select("select * from dept where id=#{id}")
	public List<Dept> findAllDeptById(int id);
	
	
	//添加职位
	@Insert("insert into job(id,jobno,jobname,des,dept_id) values(null,#{jobno},#{jobname},#{des},#{dept_id})")
	public void addJob(Job job);
	//添加职位1
	@Insert("insert into job(id,jobno,jobname,des,dept_id) values(null,#{jobno},#{jobname},#{des},null)")
	public void addJob1(Job job);
	
	
	//修改职位信息
	@Update("update job set jobno=#{jobno},jobname=#{jobname},des=#{des},dept_id=#{dept_id} where id=#{id}")
	public void updateJob(Job job);
	//修改职位信息1
	@Update("update job set jobno=#{jobno},jobname=#{jobname},des=#{des},dept_id=null where id=#{id}")
	public void updateJob1(Job job);
	
	
	
	//根据id删除职位
	@Delete("delete from job where id=#{id}")
	public void deleteJob(int id);
	
	
	
	//根据id查询job信息
	@Select("select * from job where id=#{id}")
	public Job findJobById(int id);
	
	
	
	//模糊查询
	@Select("<script>"+
				" select * from job where 1=1 "+
				"<if test= \"dept_id != null and dept_id != 0  \"> and dept_id=#{dept_id}</if>"+
				"<if test= \"jobname != null and jobname != '' \"> and jobname like CONCAT('%',#{jobname},'%') </if>"+
				"<if test= \"des != null and des != '' \"> and des like CONCAT('%',#{des},'%')</if>"+
            "</script>"
    )
	@ResultMap("jobMap")
	public List<Job> moHuSearch(Job job);
	
	
	
	//查询所有部门信息
	@Select("select * from dept")
	public List<Dept> findAllDept();
	
	
	
	
	
	//jungle要的查询职位id和名字
	@Select("select id,jobname from job")
	public List<Job> findJobIdAndName();
	
	//jungle要的查询所有职位数量
	@Select("select count(*) from job")
	public int findJobCount();
	
	
	
	
	
}
