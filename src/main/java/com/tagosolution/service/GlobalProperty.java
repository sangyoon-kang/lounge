package com.tagosolution.service;

import javax.annotation.Resource;
import com.tagoplus.service.ConfigBean;

/**
 * globals.properties 모음 ParentController에서 로드하여 객체 접근 방법으로 코딩 가능 globals.properties를 추가하면 이 클래스에도 getter/setter를 추가해야 함.
 * 
 * @author wimy
 *
 */
@Resource(name="globalProperty")
public class GlobalProperty extends ConfigBean {
		
}
