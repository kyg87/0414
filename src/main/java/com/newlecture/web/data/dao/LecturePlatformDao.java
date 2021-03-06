package com.newlecture.web.data.dao;


import java.util.List;

import com.newlecture.web.data.entity.LecturePlatform;



public interface LecturePlatformDao {
	List<LecturePlatform> getList();
	LecturePlatform get(String code);
	int add(LecturePlatform lecturePlartform);
	int update(LecturePlatform lecturePlartform);
	int delete(String code);
}
