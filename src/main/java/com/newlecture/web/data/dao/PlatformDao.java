package com.newlecture.web.data.dao;



import java.util.List;

import com.newlecture.web.data.entity.Platform;



public interface PlatformDao {
	List<Platform> getList();
	Platform get(String code);
	int add(Platform plartform);
	int update(Platform plartform);
	int delete(String code);
}
