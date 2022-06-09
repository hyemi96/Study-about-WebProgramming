/* 설명 : 시스템 설정 파일 변수
 * 
 * 
 * 
 * 
 * 
 * */


package egovframework.util;

public class Globals {

	public static final String SECRET_KEY 				= EgovProperties.getProperty("Globals.secretKey");
	public static final String TOKEN_HOLD_TIME 	= EgovProperties.getProperty("Globals.tokenHoldTime");
	
	public static final String FILE_PATH 	            = EgovProperties.getProperty("Globals.fileStorePath");
	
	public static final String FILE_UPLOAD_PATH    = EgovProperties.getProperty("Globals.fileUploadPath");

	public static final String HOME_PATH	            = EgovProperties.getProperty("Globals.Home");
	
	public static final String PAGE_START             = EgovProperties.getProperty("Globals.pageFirstRow");
	
	public static final String PAGE_END		        = EgovProperties.getProperty("Globals.pageSize");
	
	public static final String SMARTRETURN 	        = EgovProperties.getProperty("Globals.smartEditor.returnPage");
	
	public static final String STREAM_URL				= EgovProperties.getProperty("Globals.stream.url");
	
	public static final String SITE_URL					= EgovProperties.getProperty("Globals.SiteUrl");
	
	
	 
}
