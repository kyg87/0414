package com.newlecture.web.data.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.newlecture.web.data.entity.Notice;
import com.newlecture.web.data.entity.NoticeView;


public interface NoticeDao {
	String lastCode();
	@Select("SELECT* FROM NOTICE_VIEW WHERE CODE=#{code}")
	NoticeView get(String code);
	
	NoticeView getPrev(String code);
	NoticeView getNext(String code);
	
	public List<NoticeView> getList();
	public List<NoticeView> getList(int page);
	public List<NoticeView> getList(@Param("page") int page,
												@Param("field") String field, 
												@Param("query") String query);
	
	int getSize();
	int getSize(String field, String query);
	
	@SelectKey(statement="select max(cast(code as unsigned))+1 Code from NOTICE", 
					before=true, keyProperty="code",resultType=String.class)
	@Insert("INSERT INTO NOTICE(CODE,TITLE,WRITER,CONTENT)VALUES(#{code},#{title},#{writer},#{content})")
	int add(Notice notice);
	int add(String title, String content, String writer);
	
	int update(Notice notice);
	int update(String title, String content, String code);
	int delete(String code);
}
