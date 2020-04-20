package com.tagosolution.controller.ajax;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.tagoplus.util.Encrypt;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.BoardServiceImpl;
import com.tagosolution.service.impl.ProductServiceImpl;
import com.tagosolution.service.model.SiteVO;

/**
 * 관리자용 ajax 컨트롤러
 * @author wimy
 *
 */
@RestController
@Controller
@RequestMapping
public class AdminAjaxController extends BaseController {
	
	@Resource
	GeneralDAOImpl _gDao;
	
	@Resource
	BoardServiceImpl _boardService;
	
	@Resource
	ProductServiceImpl _prdService;
	
	/**
	 * ajax - 라이선스 인증 요청
	 *  - 주의 : 관리자 URL 사용
	 * @param body
	 * @param key
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "#{globals['url.admin.root']}/ajax/license/certify", method = RequestMethod.POST)
	@ResponseBody
	public Object ajaxLicenseCertify(@RequestBody(required = false) String body, String key, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (key.equals(Encrypt.SHA256HashHex(request.getServerName()))) {
			SiteVO vo = new SiteVO();
			vo.setSiteDomain(request.getServerName());
			SiteVO site = (SiteVO) _gDao.selectOne("site.selectByServerName", vo.getSiteDomain());
			
			if (site != null) {
				vo.setSiteSeq(site.getSiteSeq());
				vo.setSiteCertKey(key);
				vo.setModDate(new Date());
				_gDao.update("site.updateByKeySelective", vo);
				map.put("result", true);	
			}
		}
		else {
			map.put("result", false);
		}
		
		//return new Gson().toJson(map);
		return map;
	}
}
