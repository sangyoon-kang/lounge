package com.tagoplus.util;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.auth.oauth2.TokenResponse;
import com.google.api.client.auth.oauth2.TokenResponseException;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeTokenRequest;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.googleapis.auth.oauth2.GoogleRefreshTokenRequest;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.services.analytics.Analytics;
import com.google.api.services.analytics.AnalyticsScopes;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.tagosolution.service.model.MemberInfoVO;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;

import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/**

 */
public class GoogleAPIAuth {
	
	  /** Global instance of the HTTP transport. */
	  private static HttpTransport httpTransport;
	  
	 
	  /**
	   * Be sure to specify the name of your application. If the application name is {@code null} or
	   * blank, the application will log a warning. Suggested format is "MyCompany-ProductName/1.0".
	   */
	  private static final String APPLICATION_NAME = "";

	
	private static final Logger logger = LoggerFactory.getLogger(GoogleAPIAuth.class);
	
	private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
	
	private static HttpTransport HTTP_TRANSPORT;
	
	private static final List<String> SCOPES = Arrays.asList(AnalyticsScopes.ANALYTICS_READONLY);
	
	static {
		try {
            HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
        } catch (Throwable t) {
            t.printStackTrace();
        }
    }
	
	public static Credential authorize(String code, String ApiFileName, String Url) throws Exception {
			String accessToken = "", refreshToken;
			InputStream in = GoogleAPIAuth.class.getResourceAsStream(ApiFileName);
			// Exchange auth code for access token
			GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(JSON_FACTORY, 
					new InputStreamReader(in));
	
	
			GoogleTokenResponse tokenResponse = new GoogleAuthorizationCodeTokenRequest(
					  HTTP_TRANSPORT,
		              JSON_FACTORY,
		              "https://www.googleapis.com/oauth2/v3/token",
		              clientSecrets.getDetails().getClientId(),
		              clientSecrets.getDetails().getClientSecret(),
		              code,
		              Url)  // Specify the same redirect URI that you use with your web
		                             // app. If you don't have a web version of your app, you can
		                             // specify an empty string.
					  .setScopes(SCOPES)
		              .execute();
		
			accessToken = tokenResponse.getAccessToken();
			refreshToken = tokenResponse.getRefreshToken();
			GoogleCredential credential = new GoogleCredential.Builder()
					.setJsonFactory(JSON_FACTORY)
					.setTransport(HTTP_TRANSPORT)
					.setClientSecrets(clientSecrets)
					.build()
					.setAccessToken(accessToken)
					.setRefreshToken(refreshToken)
					.setExpiresInSeconds(tokenResponse.getExpiresInSeconds());
			Analytics analyics = new Analytics.Builder(HTTP_TRANSPORT, JSON_FACTORY, credential).setApplicationName(
			        "Tago Plus Solution Authorized").build();
			 
			return credential;
	  }
	
	public static Credential refreshAccessToken(String refreshToken, String ApiFileName) throws IOException {
		GoogleCredential credential = new GoogleCredential();
		try {
			InputStream in = GoogleAPIAuth.class.getResourceAsStream(ApiFileName);
			// Exchange auth code for access token
			GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(JSON_FACTORY, 
					new InputStreamReader(in));
			
		  TokenResponse response =
		  new GoogleRefreshTokenRequest(
				  HTTP_TRANSPORT, 
				  JSON_FACTORY,
				  refreshToken, 
				  clientSecrets.getDetails().getClientId(), 
				  clientSecrets.getDetails().getClientSecret())
		  .setScopes(SCOPES)
		  .execute();
		  
		  credential = new GoogleCredential.Builder().build()
				  .setAccessToken(response.getAccessToken())
				  .setExpiresInSeconds(response.getExpiresInSeconds());
		  return credential;
		} catch (TokenResponseException e) {
		  if (e.getDetails() != null) {
		    logger.error(e.getMessage(), e.getDetails().getError());
		    if (e.getDetails().getErrorDescription() != null) {
		      logger.error(e.getMessage(), e.getDetails().getErrorDescription());
		    }
		    if (e.getDetails().getErrorUri() != null) {
		    	logger.error(e.getMessage(), e.getDetails().getErrorUri());
		    }
		  } else {
			  logger.error(e.getMessage());
		  }
		}
		return credential;
	}
	
	public static MemberInfoVO getGoogleProfileInfo(String idTokenString) {
		MemberInfoVO obj_User_Profile= new MemberInfoVO();
		try {
			GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(HTTP_TRANSPORT, JSON_FACTORY)
				    // Specify the CLIENT_ID of the app that accesses the backend:
					//.setAudience(Collections.singletonList(CLIENT_ID))
				    // Or, if multiple clients access the backend:
				    //.setAudience(Arrays.asList(CLIENT_ID_1, CLIENT_ID_2, CLIENT_ID_3))
				    .build();
			GoogleIdToken idToken = verifier.verify(idTokenString);
			if (idToken != null) {
			  Payload payload = idToken.getPayload();

			  // Print user identifier
			  String userId = payload.getSubject();
			  logger.debug("User ID: " + userId);

			  // Get profile information from payload
			  obj_User_Profile.setUserId(userId);
			  obj_User_Profile.setEmail(payload.getEmail());
			  obj_User_Profile.setUserName((String)payload.get("name"));
			  obj_User_Profile.setAddr1((String) payload.get("locale"));
			}
			  
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return obj_User_Profile;
	}
	
	
	  /**
	   * Performs all necessary setup steps for running requests against the API.
	   *
	   * @return An initialized Analytics service object.
	   *
	   * @throws Exception if an issue occurs with OAuth2Native authorize.
	   */
	  public static Analytics initializeAnalytics(Credential credential) throws Exception {
		   
		  httpTransport = GoogleNetHttpTransport.newTrustedTransport();

		    // Set up and return Google Analytics API client.
		    return new Analytics.Builder(httpTransport, JSON_FACTORY, credential).setApplicationName(
		        APPLICATION_NAME).build();
		  }

}
