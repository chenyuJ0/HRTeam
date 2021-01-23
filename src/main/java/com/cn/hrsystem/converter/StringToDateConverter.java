package com.cn.hrsystem.converter;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class StringToDateConverter implements Converter<String, Date>{

	public Date convert(String source) {
	
		if(source == null) {
			throw new RuntimeException("请输入数据");
		}
		DateFormat df =  new SimpleDateFormat("yyyy-MM-dd");
		try {
			return df.parse(source);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("输入得日期有误");
		}
		
		
	}

	
	
	
}
