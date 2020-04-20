package com.tagosolution.service.impl;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import com.google.api.services.analytics.Analytics;
import com.google.api.services.analytics.model.GaData;
import com.tagosolution.controller.admin.statistic.StatisticController;
import com.tagosolution.service.dao.GeneralDAOImpl;
import com.tagosolution.service.model.HistoryHitVO;
import com.tagosolution.service.model.HistoryHostVO;

@Service("AccessStatisticService")
public class AccessStatisticServiceImpl  extends BaseServiceImpl  {
	
	
	private static final Logger logger = LoggerFactory.getLogger(StatisticController.class);
	@Resource
	GeneralDAOImpl _gDao;
	HistoryHitVO _HistoryHitVO ;
	

	public static GaData executeDataQuery(Analytics analytics, String profileId, String filterDate, String metrics, String dimensions) throws IOException {
		  
		  String stringFormatDate = filterDate.substring(0, 4)+"-"+filterDate.substring(4, 6)+"-"+filterDate.substring(6, 8);		  
		    return analytics.data().ga().get("ga:" + profileId, // Table Id. ga: + profile id.
		    		stringFormatDate, // Start date.
		    		stringFormatDate, // End date.
		    		metrics) // Metrics. "ga:pageviews"
		        .setDimensions(dimensions)//"ga:dateHour,ga:source"
//		        .setSort("-ga:visits,ga:source")
//		        .setFilters("ga:medium==organic")
//		        .setMaxResults(25)
		        .execute();
		  }
	 
	 private static String downOneDayCalendar(String date) 
			    throws ParseException {
			  
			  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			  Calendar c = Calendar.getInstance();
			  c.setTime(sdf.parse(date));
			  c.add(Calendar.DATE, -1);
			  return sdf.format(c.getTime());
			  }
		
		public String checkImportAnalycisDataHistoryHit(String checkDate)  {
			HistoryHitVO	historyHit = new HistoryHitVO();		
			try {	
				String stringYesterday = downOneDayCalendar(checkDate);
				historyHit.setHitDate(stringYesterday);
				HistoryHitVO lastDay = (HistoryHitVO) _gDao.selectOne("historyHit.selectLastDay",historyHit);
				if(lastDay==null)
				{
					return stringYesterday;
				}
				else
					{
					if(stringYesterday.equals(lastDay.getHitDate())  ){
						return "NO";					
					}
					else return stringYesterday;
					}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return null;
		}

		
		
		public String checkImportAnalycisDataHistoryHost(String checkDate){
			HistoryHostVO	historyHost = new HistoryHostVO();
			try {	
				String stringYesterday = downOneDayCalendar(checkDate);
				historyHost.setHitDate(stringYesterday);
				HistoryHostVO lastDay = (HistoryHostVO) _gDao.selectOne("historyHost.selectLastDay", historyHost);
				if(lastDay==null)
				{
					return stringYesterday;
				}
				else
					{
					if(stringYesterday.equals(lastDay.getHitDate())  ){
						return "NO";					
					}
					else return stringYesterday;
					}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return null;
		}
		  /**
		   * Prints the output from the Core Reporting API. The profile name is printed along with each
		   * column name and all the data in the rows.
		   *
		   * @param results data returned from the Core Reporting API.
		   */
		public  void insertDbGaDataHistoryHit(GaData results,int siteSeq) throws Exception  {
			

			if (results.getRows() == null || results.getRows().isEmpty()) {
				logger.debug("No results Found.");
			} else {

				// Print actual data.
				int i =0;
				for (List<String> row : results.getRows()) {
					HistoryHitVO vo1 = new HistoryHitVO();
					
					String localHitDate = row.get(0).substring(0, 8);
					String localHitTime = row.get(0).substring(8, 10);
					
					vo1.setHitDate(localHitDate);
					vo1.setHitTime(localHitTime);
					vo1.setHitCnt(Integer.parseInt(row.get(1)));
					
					try{
					 _gDao.insert("historyHit.insert",vo1);
					} catch (Exception e) {
						logger.error(e.getMessage(), e);
					}
					i++;
				}

				
			}
		}
		
		
		  /**
		   * Prints the output from the Core Reporting API. The profile name is printed along with each
		   * column name and all the data in the rows.
		   *
		   * @param results data returned from the Core Reporting API.
		   */
		public  void insertDbGaDataHistoryHost(GaData results, int siteSeq) throws Exception  {
			

			if (results.getRows() == null || results.getRows().isEmpty()) {
				logger.debug("No results Found.");
			} else {

				// Print actual data.
				int i =0;
				for (List<String> row : results.getRows()) {
					HistoryHostVO vo1 = new HistoryHostVO();
					
					String localHostDate = row.get(0).substring(0, 8);
					String localHostTime = row.get(0).substring(8, 10);
					
					vo1.setHitDate(localHostDate);
					vo1.setHitTime(localHostTime);
					vo1.setHitHost(row.get(1));
					
					vo1.setHitCnt(Integer.parseInt(row.get(2)));
					
					try{
					 _gDao.insert("historyHost.insert",vo1);
					} catch (Exception e) {
						logger.error(e.getMessage(), e);
					}
					i++;
				}			
			}
		}	 
}
