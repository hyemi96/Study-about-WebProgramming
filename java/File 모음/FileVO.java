package com.uhygeramgr.file.model;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class FileVO implements Serializable {

	private int seq						= 0; /** file의 seq가 faq의 파일아디로 들어간다. */
	private String fileId				=""; /** 원본 파일명 */
	private String fileNm				=""; /** 원본 파일명 */
	private String fileTitle			=""; /** 내가저장하는 파일이름 : 물리적파일명physicalName */

	private long fileSize =				0L;    /** 파일 사이즈 */
	//private String fileSize				= "";

	private String filePath="";   /** 파일 주소 */
    private String fileExtsn = "";
    private String contentType = "";  /** ContextType */
    private String serverSubPath = "";/** 하위 디렉토리 지정 */
    
	private String createdAt			= "";
	private String createdId			= "";
	private String updatedAt			= "";
	private String updatedId			= "";

	
	

	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getFileNm() {
		return fileNm;
	}
	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}
	public String getFileTitle() {
		return fileTitle;
	}
	public void setFileTitle(String fileTitle) {
		this.fileTitle = fileTitle;
	}
	
	
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileExtsn() {
		return fileExtsn;
	}
	public void setFileExtsn(String fileExtsn) {
		this.fileExtsn = fileExtsn;
	}
    /**
     * contentType attribute 값을 설정한다.
     * @param contentType the contentType to set
     */
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	   /**
     * serverSubPath attribute를 리턴한다.
     * @return the serverSubPath
     */
	public String getServerSubPath() {
		return serverSubPath;
	}
    /**
     * serverSubPath attribute 값을 설정한다.
     * @param serverSubPath the serverSubPath to set
     */
	public void setServerSubPath(String serverSubPath) {
		this.serverSubPath = serverSubPath;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public String getCreatedId() {
		return createdId;
	}
	public void setCreatedId(String createdId) {
		this.createdId = createdId;
	}
	public String getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(String updatedAt) {
		this.updatedAt = updatedAt;
	}
	public String getUpdatedId() {
		return updatedId;
	}
	public void setUpdatedId(String updatedId) {
		this.updatedId = updatedId;
	}

	
	
	
}
