package com.tagosolution.controller.admin.statistic;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;


import com.tagoplus.model.common.SearchVO;

import com.tagoplus.util.GoogleAPIAuth;
import com.tagosolution.controller.BaseController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.impl.AccessStatisticServiceImpl;
import com.tagosolution.service.model.SiteApiVO;
import com.tagosolution.service.model.CommGroupVO;
import com.tagosolution.service.model.HistoryHitVO;
import com.tagosolution.service.model.HistoryHostVO;
import com.google.api.services.analytics.Analytics;
import com.google.api.services.analytics.model.GaData;
import com.google.api.services.analytics.model.GaData.ColumnHeaders;

import java.io.IOException;
import java.net.InetAddress;

import com.google.api.client.auth.oauth2.Credential;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat ;
import java.util.Calendar;
import java.util.Date;

/*<!---->*/

/**
 * 통계관리
 */

@Controller
@EnableScheduling
@RequestMapping(value = "#{globals['url.admin.root']}/stat/manage")
public class StatisticController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(StatisticController.class);
	
	
	@Resource
	GeneralDAOImpl _gDao;
	HistoryHitVO _HistoryHitVO ;
	
	@Resource
	AccessStatisticServiceImpl _AccessStatistic;
	
	
	/**
	 
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping(value = "/stat_list")
	public String statAuthorize(SearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("접속통계  &gt; 접속자 분석", model);
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
//		Credential credential = GoogleAPIAuth.authorize(super.getSession().getServletContext().getRealPath("/client_secrets.json"));
		SiteApiVO set = (SiteApiVO) _gDao.selectOne("siteApi.selectByKey", super.getSiteSession().getSiteSeq());
		
		model.addAttribute("set", set);
		return super.getConfig().getAdminRoot() + "/stat/manage/auth";
	}
	@RequestMapping(value = "/stat_user")
	public String statUser(SearchVO search, BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("접속통계  &gt; 접속자 분석", model);
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		SiteApiVO set = (SiteApiVO) _gDao.selectOne("siteApi.selectByKey", super.getSiteSession().getSiteSeq());
		
		model.addAttribute("set", set);
		return super.getConfig().getAdminRoot() + "/stat/manage/user";
	}
	
	
	@RequestMapping(value="/stat_path")
	public String statPath(SearchVO search,BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("접속통계  &gt; 접속경로 분석", model);
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		
		SiteApiVO set = (SiteApiVO) _gDao.selectOne("siteApi.selectByKey", super.getSiteSession().getSiteSeq());
		
		model.addAttribute("set", set);
		return super.getConfig().getAdminRoot() + "/stat/manage/path";
		
		
	}
	
	/**
	 
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping(value = "/stat_keyword")
	public String statKeyword(SearchVO search,BindingResult result, Model model) throws Exception {
		super.setPageSubTitle("접속통계  &gt; 검색 키워드 분석", model);
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		SiteApiVO set = (SiteApiVO) _gDao.selectOne("siteApi.selectByKey", super.getSiteSession().getSiteSeq());
		
		model.addAttribute("set", set);
		return super.getConfig().getAdminRoot() + "/stat/manage/keyword";
	}
	
	/**
	 
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/stat_operator")
	public String statOperator(SearchVO search,BindingResult result, Model model) throws Exception {
		
		super.setPageSubTitle("접속통계  &gt; 접속경로 분석", model);
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		SiteApiVO set = (SiteApiVO) _gDao.selectOne("siteApi.selectByKey", super.getSiteSession().getSiteSeq());
		
		model.addAttribute("set", set);
		return super.getConfig().getAdminRoot() + "/stat/manage/operator";
	}
	
	/**
	 
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/path_popup")
	public String pathPopUp(SearchVO search, BindingResult result, Model model) throws Exception {
		
		super.setPageSubTitle("접속통계  &gt; OS/브라우저", model);
		
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		SiteApiVO set = (SiteApiVO) _gDao.selectOne("siteApi.selectByKey", super.getSiteSession().getSiteSeq());
		
		model.addAttribute("set", set);
		model.addAttribute("vo", search);
		
		return super.getConfig().getAdminRoot() + "/stat/manage/path_popup";
	}
	
	@RequestMapping(value = "/api/authorize")
	@ResponseBody
	public Object getAuthorize(@RequestBody(required = false) String body, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		String referrer = request.getRequestURL().toString();
		String path = referrer.replace(request.getServletPath(), "");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Credential credential = GoogleAPIAuth.authorize(body, super.getConfig().getGoogleApiSecret(), (!path.isEmpty()) ? path : "");
		try{
			SiteApiVO vo = new SiteApiVO();
			vo.setSiteCode(super.getSiteSession().getSiteSeq());
			vo.setGoogleAccessToken(credential.getAccessToken());
			vo.setGoogleRefreshToken(credential.getRefreshToken());
			_gDao.update("siteApi.updateByKeySelective", vo);
		}catch(Exception e){
			logger.error(e.getMessage(), e);
		}
		
		return map;
	}
	
	
	@RequestMapping(value = "/api/refreshtoken")
	@ResponseBody
	public Object extendAccessToken(@RequestBody(required = false) String body, BindingResult result, Model model) throws Exception {
		if (result.hasErrors())
			return super.setBindingResult(result, model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try{
			Byte siteSeq = super.getSiteSession().getSiteSeq();
			SiteApiVO set = (SiteApiVO) _gDao.selectOne("siteApi.selectByKey", siteSeq);
			if(set.getGoogleRefreshToken() == null){
				map.put("complete", false);
				return map;
			}
			Credential credential = GoogleAPIAuth.refreshAccessToken(set.getGoogleRefreshToken(), super.getConfig().getGoogleApiSecret());
			
			if(credential.getAccessToken() != null) {
				SiteApiVO vo = new SiteApiVO();
				vo.setSiteCode(siteSeq);
				vo.setGoogleAccessToken(credential.getAccessToken());
				_gDao.update("siteApi.updateByKeySelective", vo);
				map.put("complete", true);
			}else 
				map.put("complete", false);
		}catch(Exception e){
			logger.error(e.getMessage(), e);
		}
		
		return map;
	}
	
	
	
	/***************************************************************************************************************************************/
	//@Scheduled(fixedDelay = 50000)
	@Scheduled(cron = "0 0 4 * * *")
	public  void importAccessAnalycis()  {

		Date today = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		String stringDate = dateFormat.format(today);// = addOneDayCalendar("2018-11-22 11");
		String stringYesterday;
		
		try {

			do {		
				 stringYesterday = _AccessStatistic.checkImportAnalycisDataHistoryHit(stringDate);
				//stringYesterday = checkImportAnalycisDataHistoryHit(stringDate);
				stringDate = stringYesterday;
				
				if (stringYesterday != "NO") {

					// Byte siteSeq = super.getSiteSession().getSiteSeq();
					Byte siteSeq = 1;
					SiteApiVO set = (SiteApiVO) _gDao.selectOne("siteApi.selectByKey", siteSeq);

					Credential credential = GoogleAPIAuth.refreshAccessToken(set.getGoogleRefreshToken(),
							super.getConfig().getGoogleApiSecret());
					Analytics analytics = GoogleAPIAuth.initializeAnalytics(credential);
					String profileId = set.getGooglelogValue();

					if (credential.getAccessToken() != null) {

						GaData gaData = _AccessStatistic.executeDataQuery(analytics, profileId, stringYesterday,
								"ga:pageviews", "ga:dateHour");
						// GaData gaData = executeDataQueryHit(analytics,
						// profileId, stringYesterday);
						if ((gaData.get("rows") == null) || (gaData.get("rows") == "")) {
							stringYesterday = "NO";
						}

						_AccessStatistic.insertDbGaDataHistoryHit(gaData, siteSeq);
						// model.addAttribute("gaData", gaData.get("rows"));

					} else {
						logger.error("No Credential found.");
					}
				}
			} while (stringYesterday != "NO");
			
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}

	//	return super.getConfig().getAdminRoot() + "/stat/manage/import";
	}

	
	


	/**
	 * 
	 * @param search
	 * @param result
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@Scheduled(cron = "0 0 4 * * *")
	public void importAccessAnalycisHost() throws Exception {
		
		Date today = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		String stringDate = dateFormat.format(today);// = addOneDayCalendar("2018-11-22 11");
		String stringYesterday;
		
		try {
			do {	
				stringYesterday = _AccessStatistic.checkImportAnalycisDataHistoryHost(stringDate);
				
				stringDate = stringYesterday;
				if (stringYesterday != "NO") {

					//Byte siteSeq = super.getSiteSession().getSiteSeq();
					Byte siteSeq = 1;
					SiteApiVO set = (SiteApiVO) _gDao.selectOne("siteApi.selectByKey", siteSeq);

					Credential credential = GoogleAPIAuth.refreshAccessToken(set.getGoogleRefreshToken(),
							super.getConfig().getGoogleApiSecret());
					Analytics analytics = GoogleAPIAuth.initializeAnalytics(credential);
					String profileId = set.getGooglelogValue();

					if (credential.getAccessToken() != null) {
						
						GaData gaData =  _AccessStatistic.executeDataQuery(analytics, profileId, stringYesterday,"ga:pageviews","ga:dateHour,ga:source");						
						//GaData gaData = executeDataQueryHost(analytics, profileId, stringYesterday);
						if((gaData.get("rows")==null) || (gaData.get("rows")=="") )
						{stringYesterday = "NO"; 
							}
						_AccessStatistic.insertDbGaDataHistoryHost(gaData,siteSeq);						
						//model.addAttribute("gaData", gaData.get("rows"));
					} else {
						logger.error("No Credential found.");
					}
				} 
			} while (stringYesterday != "NO");
			
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}

	}

}
