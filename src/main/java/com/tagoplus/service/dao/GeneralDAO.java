package com.tagoplus.service.dao;

import java.util.List;

import com.tagoplus.model.GeneralModel;
import com.tagoplus.model.common.SearchVO;

/**
 * dao 클래스 일반화를 위한 인터페이스
 * 
 * @author wimy
 *
 */
public interface GeneralDAO {

	int getCountBySearch(String sqlMapID, SearchVO search);

	Object selectByKey(String sqlMapID, Object key);

	// List<?> selectByObjects(String sqlMapID, Object...objects);

	List<?> selectBySearch(String sqlMapID, SearchVO search);
	
	List<?> selectBySearch(String sqlMapID, SearchVO search, String countQueryID);
	
	List<?> selectList(String sqlMapID, SearchVO search);
	
	List<?> selectList(String sqlMapID, GeneralModel model);
	
	List<?> selectList(String sqlMapID, Object obj);
	
	Object selectOne(String sqlMapID, Object obj);

	int insert(String sqlMapID, GeneralModel model);

	int update(String sqlMapID, GeneralModel model);

	int delete(String sqlMapID, Object key);
}
