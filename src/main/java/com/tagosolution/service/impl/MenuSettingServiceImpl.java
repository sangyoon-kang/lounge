package com.tagosolution.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.tagosolution.service.util.SeqGeneratorUtil;
import com.tagosolution.service.model.MenuAuthGroupSettingVO;
import com.tagosolution.service.model.MenuAuthoSettingVO;
import com.tagosolution.service.model.MenuSettingVO;
import com.tagosolution.service.model.search.MenuSettingSearchVO;

/**
 * 2018-12-11
 * @author G.Tenger
 *
 */
@Service("menuService")
public class MenuSettingServiceImpl extends BaseServiceImpl {

	/**
	 * Menu Ordering
	 * @param search
	 * @throws Exception
	 */
	public void menuOrderUpdate (MenuSettingSearchVO search, MenuSettingVO vo) throws Exception {
		String iOrdering1 = vo.getSortNum();
		
		List<MenuSettingVO> list = (List<MenuSettingVO>) super.getDAO().selectBySearch("menuSetting.selectOrderingForUpdate", search);
		MenuSettingVO vo2 = new MenuSettingVO();
		List<String> menus = new ArrayList<String>();
		if (list != null && list.size() > 0) {
			String iOrdering2 = list.get(0).getSortNum();
			if(vo.getMenuLevel() != 3){
				for(MenuSettingVO menu : list){
					menus.add(menu.getMenuIdx());	
				}
				vo2.setMenuIds(menus);		
				
			}else{
				vo2.setMenuIdx(list.get(0).getMenuIdx());
			}
			vo2.setSortNum(iOrdering1);
			vo2.setMenuLevel(vo.getMenuLevel());
			
			super.getDAO().update("menuSetting.updateOrdering", vo2);
			List<MenuSettingVO> seclist = new ArrayList<MenuSettingVO>();
			menus = new ArrayList<String>();
			if(vo.getMenuLevel() == 2)
				seclist  = (List<MenuSettingVO>) super.getDAO().selectList("menuSetting.selectOrderingSecondLevel", vo.getMenuIdx());
			else if(vo.getMenuLevel() == 1)
				seclist  = (List<MenuSettingVO>) super.getDAO().selectList("menuSetting.selectByLnb", vo.getMenuIdx());
			for(MenuSettingVO menu : seclist){
				menus.add(menu.getMenuIdx());	
			}
			if(menus.size() == 0){
				menus.add(vo.getMenuIdx());
			}
			vo.setSortNum(iOrdering2);
			vo.setMenuIds(menus);
			super.getDAO().update("menuSetting.updateOrdering", vo);
		}
	}
	
	/**
	 * Menu Setting Merge
	 * @param vo
	 * @throws Exception
	 */
	public void mergeMenu (MenuSettingSearchVO search,MenuSettingVO vo) throws Exception {
		Integer maxLevel = 0;
		String sortNum = "";
		String pid = "";
		if(vo.getMenuIdx().isEmpty()){
			search.setMenuLevel(vo.getMenuLevel());
			maxLevel = (Integer) super.getDAO().getCountBySearch("menuSetting.maxIdBylevel", search);
			sortNum = (String) super.getDAO().selectOne("menuSetting.maxSortNumBylevel", search);
			if(!vo.getParentIdx().isEmpty() && vo.getParentIdx() != null)
				pid = (vo.getMenuLevel() == 2) ? vo.getParentIdx().substring(0, 2) : vo.getParentIdx().substring(0, 4);
			vo.setMenuIdx(SeqGeneratorUtil.genMenuId(search.getMenuLevel(), maxLevel, pid));
			vo.setSortNum(sortNum);
		}else if(!vo.getMenuLevel().equals((short)3)){
			super.getDAO().update("menuSetting.updateChildFlag", vo);
		}
		super.getDAO().insert("menuSetting.merge", vo);
	}
	
	/**
	 * Menu Setting Group Merge
	 * @param vo
	 * @throws Exception
	 */
	public void mergeMenuAutho (MenuSettingSearchVO search,MenuAuthGroupSettingVO vo) throws Exception {
		
		super.getDAO().insert("menuAuthGroup.merge", vo);
		List<MenuAuthoSettingVO> ma = vo.getMenuAuthList();
		if( ma!= null && ma.size() > 0){
            for (MenuAuthoSettingVO v : ma) {
                v.setGroupId(vo.getIdX());
                super.getDAO().insert("menuAutho.merge", v);
            }
        }
	}
	
	/**
	 * Menu Setting Group delete
	 * @param vo
	 * @throws Exception
	 */
	public void deleteMenuAutho (MenuSettingSearchVO search) throws Exception {
		super.getDAO().delete("menuAuthGroup.delete", search);
	}
}
