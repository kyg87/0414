package com.newlecture.web.data.dao;

import java.util.List;

import com.newlecture.web.data.entity.Lecture;




public interface LectureDao {
	List<Lecture> getList();
	Lecture get(String code);
	int add(Lecture lecture);
	int update(Lecture lecture);
	int delete(String code);
}
