package com.tagosolution.service.model;

import com.tagoplus.model.GeneralModel;

public class HistoryHostVO implements GeneralModel{

	 /**
		 * 
		 */
		private static final long serialVersionUID = -5953017039090683176L;
		
		private int historyHostIdx;
		
		private String hitDate;
		
		private String hitTime;
		
		private String hitHost;
		
				
		private int hitCnt;
		
		
		
		public int getHistoryHostIdx() {
			return historyHostIdx;
		}

		public void setHistoryHostIdx(int historyHostIdx) {
			this.historyHostIdx = historyHostIdx;
		}

		public String getHitDate() {
			return hitDate;
		}

		public void setHitDate(String hitDate) {
			this.hitDate = hitDate;
		}

		public String getHitTime() {
			return hitTime;
		}

		public void setHitTime(String hitTime) {
			this.hitTime = hitTime;
		}

		public String getHitHost() {
			return hitHost;
		}

		public void setHitHost(String hitHost) {
			this.hitHost = hitHost;
		}

		public int getHitCnt() {
			return hitCnt;
		}

		public void setHitCnt(int hitCnt) {
			this.hitCnt = hitCnt;
		}

		

		
}
