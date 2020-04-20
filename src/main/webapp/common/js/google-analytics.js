/** ****************** GLOBAL VARIABLES ******************* */
var SCOPES = [ 'https://www.googleapis.com/auth/analytics.readonly' ];

var googleAnalytics = {

	//** ****************** AUTHENTICATION AND PREPERATION ******************* *//
	handleClientLoad : function () {
		
		gapi.load('client:auth2', googleAnalytics.initClient);
		$('body').oLoader({
			  wholeWindow: true, //makes the loader fit the window size
			  lockOverflow: true, //disable scrollbar on body
			  backgroundColor: '#000',
			  fadeInTime: 1000,
			  fadeLevel: 0.4,
			  image: '../../../images/loading_6.gif',  
			  
			 });
		
	},

	// authorize apps
	initClient : function() {
//		  gapi.analytics.auth.authorize({
//		    'serverAuth': {
//		      'access_token': '{{ ACCESS_TOKEN_FROM_SERVICE_ACCOUNT }}'
//		    }
//		  });
		const script = document.querySelector('script[data-name="analytics"]');
		const client_id = script.getAttribute('client_id');
		gapi.client.init({
			clientId : client_id,
			scope : SCOPES.join(' ')
		}).then(function(){
			const token = script.getAttribute('token');
	        gapi.client.setToken({access_token: token});
		  // Listen for sign-in state changes.
		  //gapi.auth2.getAuthInstance().isSignedIn.listen(googleAnalytics.updateSigninStatus);
		
		  // Handle the initial sign-in state.
		  //googleAnalytics.updateSigninStatus(gapi.auth2.getAuthInstance().isSignedIn.get());
	        googleAnalytics.updateSigninStatus(true);		  
		}); 
	},
	
	//check the return authentication of the login is successful, we display the account panel box and hide the login box.
	updateSigninStatus: function(isSignedIn) {
		if (isSignedIn) {
			googleAnalytics.queryAccounts();
		} else {
			$('body').oLoader('hide');
			$('#ga-login-box').removeClass('hide');
		}
	},

	handleAuthClick: function(event) {
//		gapi.auth2.getAuthInstance().signIn();
		gapi.auth2.getAuthInstance().grantOfflineAccess().then(function(result){
			if (result.code) {
		    // Hide the sign-in button now that the user is authorized, for example:
		    //$('#signinButton').attr('style', 'display: none');

		    // Send the code to the server
		    $.ajax({
		      type: 'POST',
		      url: '/mgr/stat/manage/api/authorize',
		      // Always include an `X-Requested-With` header in every AJAX request,
		      // to protect against CSRF attacks.
		      headers: {
		        'X-Requested-With': 'XMLHttpRequest'
		      },
		      contentType: 'application/octet-stream; charset=utf-8',
		      success: function(result) {
		        // Handle or verify the server response.
		    	  $.Nav('self', null, null, true);
		      },
		      processData: false,
		      data: result.code
		    });
		  } else {
		    // There was an error.
		  }
		});
	},

	handleSignoutClick: function(event) {
		if(confirm("Are you sure you want to logout?")){
			gapi.auth2.getAuthInstance().signOut();
			$("#account-panel, #result").hide();
			$(".result-box").html("");
		}
	},
	
	
	//function to query google analytics account
	queryAccounts: function () {
		$('body').oLoader({
			  wholeWindow: true, //makes the loader fit the window size
			  lockOverflow: true, //disable scrollbar on body
			  backgroundColor: '#000',
			  fadeInTime: 1000,
			  fadeLevel: 0.4,
			  image: '../../../images/loading_6.gif',  
			  
			 });
		// Load the Google Analytics client library.
		gapi.client.load('analytics', 'v3').then(function() {
			// Get a list of all Google Analytics accounts for this user
			var request = gapi.client.analytics.management.accountSummaries.list();
			request.execute(googleAnalytics.handleAccountSummaryResponse);
		});
	},
	
	//handle the response of account summary
	handleAccountSummaryResponse: function (response) {
	  if (response && !response.error) {
		if (response.items) {
			googleAnalytics.queryProperties(response.result.items[0].id);
			 
		}
	  } else {
		  $.ajax({
		      type: 'POST',
		      url: '/mgr/stat/manage/api/refreshtoken',
		      // Always include an `X-Requested-With` header in every AJAX request,
		      // to protect against CSRF attacks.
		      headers: {
		        'X-Requested-With': 'XMLHttpRequest'
		      },
		      contentType: 'application/octet-stream; charset=utf-8',
		      success: function(result) {
		    	  $('#ga-login-box').toggleClass((result.complete === false) ? 'hide' : '');
		    	  if(result.complete === true){
		    		  $.Nav('self', null, null, true);
		    	  } 
		      },
		      processData: false
		  });
		console.log('There was an error: ' + response.message);
		$('body').oLoader('hide');
	  }
	},
	
	//account Properties
	queryProperties: function(accountId) {
		// Get a list of all the properties for the account.
		  gapi.client.analytics.management.webproperties.list({'accountId': accountId})
		  									.then(googleAnalytics.handleProperties)
		  									.then(null, function(err) {
										      // Log any errors.
										      console.log(err);
										      $('body').oLoader('hide');
		  });
	  
	},
	
	handleProperties : function (response) {
		// Handles the response from the webproperties list method.
		if (response.result.items && response.result.items.length) {

			 // Get the first Google Analytics account
			 var firstAccountId = response.result.items[0].accountId;
	
			 // Get the first property ID
			 var firstPropertyId = response.result.items[0].id;
	
			 // Query for Views (Profiles).
			 googleAnalytics.queryProfiles(firstAccountId, firstPropertyId);
		 } else {
			 console.log('No properties found for this user.');
			 $('body').oLoader('hide');
		 }
	},
	
	queryProfiles : function (accountId, propertyId) {
		// Get a list of all Views (Profiles) for the first property
		  // of the first Account.
		  gapi.client.analytics.management.profiles.list({
		      'accountId': accountId,
		      'webPropertyId': propertyId
		  })
		  .then(googleAnalytics.handleProfiles)
		  .then(null, function(err) {
		      // Log any errors.
		      console.log(err);
		      $('body').oLoader('hide');
		  });
	},
	
	handleProfiles : function(response) {
			// Handles the response from the profiles list method.
		  if (response.result.items && response.result.items.length) {
		    $.Nav('go', './stat_user'); 
		    $('body').oLoader('hide');
		  } else {
		    console.log('No views (profiles) found for this user.');
		    $('body').oLoader('hide');
		  }
	},
	
	//******************** END AUTHENTICATION AND PREPERATION  ********************//*
	
	prepClientLoad:function(){
		gapi.load('client:auth2', googleAnalytics.prepClientInit);
	} ,
	
	prepClientInit : function(){
		const script = document.querySelector('script[data-name="analytics"]');
		const client_id = script.getAttribute('client_id');
		gapi.client.init({
			clientId : client_id,
			scope : SCOPES.join(' ')
		}).then(function(){
			$('body').oLoader({
				  wholeWindow: true, //makes the loader fit the window size
				  lockOverflow: true, //disable scrollbar on body
				  
				  fadeInTime: 1000,
				  fadeLevel: 0.4,
				  image: '../../../images/loading_6.gif',
				  hideAfter: 1500
				 });
			//checking sing in or not 
			//if(gapi.auth2.getAuthInstance().isSignedIn.get()){
				//Query the Core Reporting API.
			const token = script.getAttribute('token');
			gapi.client.setToken({access_token: token});
		  	googleAnalytics.loadPreData();
//			} else {
//				$.Nav('go', './stat_list');
//			}
			
		})
	},
	
	
	
	// function to query search google analytics data
	searchQuery : function( sDate, eDate, metric, dimension, filter) {
		filter = filter || '';
		
		
		if(dimension == 'today'){
			sDate = 'today';
			eDate = 'today';
			dimension = 'ga:date'
		};
		
		//Validation date
		
		if( ((new Date(sDate)) > (new Date(eDate))) || sDate == '' || eDate == '' ){
			
			alert("END DATE must be later than START DATE Or Dates are must be entered");
			
			return;
		};
		
		//Preparing data for API
		var formattedMetric = [{ expression : metric}];
		var formattedDimension = [{ name : dimension}];
		var filterUse = true;
				
		if(filter != '') {
			filterUse = false;
		}
		
		console.log(sDate);
		console.log(eDate);
		console.log(formattedMetric);
		console.log(formattedDimension);
		console.log(filter);
		console.log(filterUse);
		$('body').oLoader({
			  wholeWindow: true, //makes the loader fit the window size
			  lockOverflow: true, //disable scrollbar on body
			  image: '../../../images/loading_6.gif',  
			 });	
		
		
			
		googleAnalytics.getReportQuery(sDate, eDate, formattedMetric, formattedDimension, filterUse, filter)
						.then(function (response) {
							if (response.result.reports.length > 0) {
								console.log(response);
								var td = "";
								
								for(var j = 0; j < response.result.reports[0].data.rows.length; j++  ){
									if(dimension == 'ga:fullReferrer' || dimension == 'ga:source'){
										td += '<tr onclick=" '+ " openPop('?statusName="+ response.result.reports[0].data.rows[j].dimensions[0] +"', 'statUrl') "+ ' "style="cursor:pointer">';
										td += "<td>" + (j+1) + "</td>";
										td += "<td>" + response.result.reports[0].data.rows[j].dimensions[0] +"</td>";
										td += "<td>" + response.result.reports[0].data.rows[j].metrics[0].values[0] + "명</td>";
										var percentage = Math.floor((parseInt(response.result.reports[0].data.rows[j].metrics[0].values[0]) / parseInt(response.result.reports[0].data.totals[0].values[0])) * 100);
										td += "<td>" + percentage  + "%" +  "</td>";
									}else {
										td += "<tr>";
										td += "<td>" + (j+1) + "</td>";
										if(dimension == 'ga:keyword') {
											td += "<td>" + response.result.reports[0].data.rows[j].dimensions[0] +"</td>";
											td += "<td>" + response.result.reports[0].data.rows[j].metrics[0].values[0] + "명</td>";
											var percentage = Math.floor((parseInt(response.result.reports[0].data.rows[j].metrics[0].values[0]) / parseInt(response.result.reports[0].data.totals[0].values[0])) * 100);
											td += "<td>" + percentage  + "%" +  "</td>";
											td += "<td class='left connect_conbar'><div class='poll_bar'><span style='width:" + percentage + "%' class='poll_cobar'></span></div></td>";
										
										} else {
											td += "<td>" + googleAnalytics.dateFormat(response.result.reports[0].data.rows[j].dimensions[0], dimension) +"</td>";
											td += "<td>" + response.result.reports[0].data.rows[j].metrics[0].values[0] + "명</td>";
										};
									};
									td += "<tr>";
									
									
									
									
								}
									$("#ga_result_table").removeClass('hide');
									$("#query_result").html(td);
							}
							$('body').oLoader('hide');	
						});
			
	 },

	

	// get the analytics query reports, we are using version 4.0
	getReportQuery : function(sDate, eDate, dataMetrics, dataDimensions , filterUse , filter) {
		
		dataDimensions = dataDimensions || [{name :'ga:date'}];
		
		if(filterUse === undefined) {
			filterUse = true;
		   };
		
		filter = filter || '';
		
		const script = document.querySelector('script[data-name="analytics"]');
		const view_id = script.getAttribute('view_id');
		
		return new Promise(function(resolve, reject) {
			gapi.client.request({
				path : '/v4/reports:batchGet',
				root : 'https://analyticsreporting.googleapis.com/',
				method : 'POST',
				body : {
					reportRequests : [{
						viewId : view_id,
						dateRanges : [ 
							{
								startDate : sDate,
								endDate : eDate
							}
						],	
							
						metrics : dataMetrics,
						dimensions : dataDimensions,
						dimensionFilterClauses: [
						    {
						      filters:[
						    	  {
						    		  dimensionName : "ga:source",
						    		  not: filterUse,
						    	  	  operator : "EXACT",
						    	  	  expressions : [filter]
						    	  }
						      ]
						    }
						  ],
								
					
					}]
				}
				
				
			}).then(function(response) {
				if (response != null) {
					resolve(response);
				} else {
					reject(Error("Error getting the data"));
					alert("error");
					$('body').oLoader('hide');
				}
			})
		});
		
	},
	
	//load with page refresh
	loadPreData : function() {
		const script = document.querySelector('script[data-name="analytics"]');
		const START_DATE = script.getAttribute('start_date');
		
				
		var expressions =[];
		var dimensions = [];
		$('.gAnalytics').each(function(){
			if($(this).is('[data-dim]')){
				var namesData = {
						name : $(this).attr('data-dim')
					}
				dimensions.push(namesData);
			}
		
			if($(this).is('[data-met]')) {
				var expressionData = {
						expression : $(this).attr('data-met')
					};
				expressions.push(expressionData);
			}
			
			
		});
		
		
		
		
		//User Analytics
		if($('.gAnalytics').attr('data-id') == "User") {
			
			//Getting total visitors
			googleAnalytics.getReportQuery(START_DATE, 'today', expressions)
							.then(function (response) {
								if (response.result.reports.length > 0) {
									var values = response.result.reports[0].data.totals[0].values;
									var reports = response.result.reports;
									$('#totalVisitors').html(values[0] + '명');
									var avg = Math.round(parseInt(values[0])/reports[0].data.rowCount);
									$('#avgVisitors').html(avg + '명');
								}
								
							});
			//Getting today's visitors
			googleAnalytics.getReportQuery('today', 'today', expressions)
							.then(function (response) {
								if (response.result.reports.length > 0) {
									var values = response.result.reports[0].data.totals[0].values;
									$('#tdayVisitors').html(values[0] + '명');
								}
							});
			//Getting yesterday's visitors
			googleAnalytics.getReportQuery('yesterday', 'yesterday', expressions)
							.then(function (response) {
								if (response.result.reports.length > 0) {
									var values = response.result.reports[0].data.totals[0].values;
									$('#ydayVisitors').html(values[0] + '명');
								}
							});
			//Number of visitors this month
			googleAnalytics.getReportQuery((new Date((new Date()).toISOString().split('T')[0].slice(0,7))).toISOString().split('T')[0], 'today', expressions)
							.then(function (response) {
								if (response.result.reports.length > 0) {
									var values = response.result.reports[0].data.totals[0].values;
									var reports = response.result.reports;
									$('#mVisitors').html(values[0] + '명');
									var avg = Math.round(parseInt(values[0])/reports[0].data.rowCount);
									$('#avgMVisitors').html(avg + '명');
								}
							});
			
		};
		//Path Analytics
		if($('.gAnalytics').attr('data-id') == "Path"){
			
			
			
			googleAnalytics.getReportQuery(START_DATE, 'today', expressions, dimensions)
							.then(function (response) {
								if (response.result.reports.length > 0) {
									var rows = response.result.reports[0].data.rows;
									var totals = parseInt(response.result.reports[0].data.totals[0].values[0]);
									console.log(response.result);
									
									var td = " ";
									
									for(var j = 0; j < rows.length; j++  ){
										td += '<tr onclick=" '+ " openPop('?statusName="+ rows[j].dimensions[0] +"', 'statUrl') "+ ' "style="cursor:pointer">';
										td += "<td>" + (j+1) + "</td>";
										td += "<td>" + rows[j].dimensions[0] + "</td>";
										td += "<td>" + rows[j].metrics[0].values[0] + "명</td>";
										var percentage = Math.floor((parseInt(rows[j].metrics[0].values[0]) / totals) * 100);
										td += "<td>" + percentage  + "%" +  "</td>";
										td += "<tr>";
									}
									
										$("#query_result").html(td);
										
								}
								
							});
			googleAnalytics.queryGroups();
			
		};
		
		//Path analytics Popup 
		if($('.gAnalytics').attr('data-id') == 'Path-Popup'){
			console.log($('input[name=statusName]').val());
			googleAnalytics.getReportQuery(START_DATE, 'today', expressions, dimensions, false, $('input[name=statusName]').val())
							.then(function(response){
								if (response.result.reports.length > 0) {
									var rows = response.result.reports[0].data.rows;
									var totals = parseInt(response.result.reports[0].data.totals[0].values[0]);
									console.log(response.result);
									
									var td = " ";
									
									for(var j = 0; j < rows.length; j++  ){
										td += '<tr>';
										td += "<td>" + (j+1) + "</td>";
										td += "<td>" + rows[j].dimensions[0] + "</td>";
										td += "<td>" + rows[j].metrics[0].values[0] + "명</td>";
										var percentage = Math.floor((parseInt(rows[j].metrics[0].values[0]) / totals) * 100);
										td += "<td>" + percentage  + "%" +  "</td>";
										td += "<tr>";
									}
									
										$("#query_result").html(td);
										
								}
							});
			
		}
		
		//Keyword Analytics
		if($('.gAnalytics').attr('data-id') == "Keyword") {

		
			
			googleAnalytics.getReportQuery(START_DATE, 'today', expressions, dimensions)
			.then(function (response) {
				if (response.result.reports.length > 0) {
					var rows = response.result.reports[0].data.rows;
					var totals = parseInt(response.result.reports[0].data.totals[0].values[0]);
					console.log(response.result);
					
					var td = "";
					
					for(var j = 0; j < rows.length; j++  ){
						td += "<tr>";
						
						td += "<td>" + (j+1) + "</td>";
						td += "<td>" + rows[j].dimensions[0] + "</td>";
						td += "<td>" + rows[j].metrics[0].values[0] + "명</td>";
						var percentage = Math.floor((parseInt(rows[j].metrics[0].values[0]) / totals) * 100);
						td += "<td>" + percentage  + "%" +  "</td>";
						td += "<td class='left connect_conbar'><div class='poll_bar'><span style='width:" + percentage + "%' class='poll_cobar'></span></div></td>";
						td += "<tr>";
					}
					
						$("#query_result").html(td);
						
				}
				
			});
			
			googleAnalytics.queryGroups();
			
		};
		
		//Operator Analytics
		if($('.gAnalytics').attr('data-id') == "Operator") {
			
			for (var i = 0; i < dimensions.length; i++) {
				
				googleAnalytics.getReportQuery(START_DATE, 'today', expressions, dimensions[i])
					.then(function (response) {
						if (response.result.reports.length > 0) {
							var rows = response.result.reports[0].data.rows;
							var totals = parseInt(response.result.reports[0].data.totals[0].values[0]);
							console.log(response.result);
							
							var td = "";
							
							for(var j = 0; j < rows.length; j++  ){
								td += "<tr>";
								td += "<td>" + rows[j].dimensions[0] + "</td>";
								td += "<td>" + rows[j].metrics[0].values[0] + "</td>";
								var percentage = Math.floor((parseInt(rows[j].metrics[0].values[0]) / totals) * 100);
								td += "<td>" + percentage  + "%" +  "</td>";
								td += "<td class='left connect_conbar'><div class='poll_bar'><span style='width:" + percentage + "%' class='poll_cobar'></span></div></td>";
								td += "<tr>";
							};
							
							if(response.result.reports[0].columnHeader.dimensions[0] == 'ga:browser') {
								$("#ga_browser").html(td);
							} else {
								$("#ga_operatingSystem").html(td);
							};
							
						};
						
					});
				
			};
								
		};
		
		
		
		
	},
	
	//format date to ISO standard
	dateFormat : function(data, type) {
		type = type || null;
		switch(type){
			case 'ga:date':
				return data.slice(0,4)+ '-' + data.slice(4, 6) + '-' + data.slice(6);
				break;
		   case 'ga:year':
				return data.slice(0,4);
				break;
		   case 'ga:yearMonth':
			   return data.slice(0,4)+ '-' + data.slice(4, 6);
			   break;
		   case 'ga:hour':
			   return data + '시';
			   break;
		   
		}
		
		
	},
	
	//Group selectiong query
	queryGroups : function () {
		const script = document.querySelector('script[data-name="analytics"]');
		const START_DATE = script.getAttribute('start_date');
		
		var expressions = [{expression: 'ga:users'}];
		var dimensions = [{name: 'ga:source'}]
		googleAnalytics.getReportQuery(START_DATE, 'today', expressions, dimensions)
						.then(function(response){
							console.log(response);
							if (response.result.reports.length > 0) {
								response.result.reports[0].data.rows;
								
								var options = "";
								options += "<option>::검색엔진 선택::</option>";
								for(var i = 0; i < response.result.reports[0].data.rows.length; i++  ){
									options += "<option value=" + response.result.reports[0].data.rows[i].dimensions[0] + ">";
									options += response.result.reports[0].data.rows[i].dimensions[0];
									options += "</option>"
								}
								
								$("#ga_group-result").html(options);
							};
						});
	}
	
	
	
	
	


}

