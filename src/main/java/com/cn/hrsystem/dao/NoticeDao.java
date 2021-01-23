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

import com.cn.hrsystem.domain.Job;
import com.cn.hrsystem.domain.Notice;
import com.cn.hrsystem.domain.User;

@Repository
public interface NoticeDao {

	
		//查询所有公告信息
		@Select("select * from notice")
		@Results(id="noticeMap",value= {
				@Result(id=true,column="id",property="id"),
				@Result(column="title",property="title"),
				@Result(column="context",property="context"),
				@Result(column="create_date",property="create_date"),
				@Result(column="lastModifiled",property="lastModifiled"),
				@Result(column="user_id",property="user",one=@One(select="com.cn.hrsystem.dao.DeptDao.findUserById"))
		})
		public List<Notice> findAllNotice();
	
		//根据id查询user所有属性
		@Select("select * from user where id=#{id}")
		public User findUserById(int id);
	
		
	
		//添加公告
		@Insert("insert into notice(id,title,context,create_date,user_id) values(null,#{title},#{context},#{create_date},#{user_id})")
		public void addNotice(Notice notice);
	
		
		//修改公告
		@Update("update notice set title=#{title},context=#{context},create_date=#{create_date},lastModifiled=#{lastModifiled} where id=#{id}")
		public void updateNotice(Notice notice);
	
	
		//根据id删除公告
		@Delete("delete from notice where id=#{id}")
		public void deleteNotice(int id);
		
		
		//根据id查询公告信息
		@Select("select * from notice where id=#{id}")
		public Notice findNoticeById(int id);
		
		
		//模糊查询
		@Select("<script>"+
					" select * from notice where 1=1 "+
					"<if test= \"title != null and title != '' \"> and title like CONCAT('%',#{title},'%') </if>"+
					"<if test= \"context != null and context != '' \"> and context like CONCAT('%',#{context},'%')</if>"+
	            "</script>"
	    )
		@ResultMap("noticeMap")
		public List<Notice> moHuSearch(Notice notice);
		
		
		
		//寻找状态为1的信息
		@Select("select * from notice where state=1")
		public Notice findNoticeState();
		
		//将所有状态码改为0
		@Update("update notice set state=0")
		public void updateNoticeStateZero();
		
		//根据id把状态码改为1
		@Update("update notice set state=1 where id=#{id}")
		public void updateNoticeStateOne(int id);
		
		
	
	
}
