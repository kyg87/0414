package com.newlecture.web.data.dao;


import java.util.List;

import com.newlecture.web.data.entity.LanguageVer;




public interface LanguageVerDao {
	List<LanguageVer> getList();
	LanguageVer get(String code);
	int add(LanguageVer langver);
	int update(LanguageVer langver);
	int delete(String code);
}
