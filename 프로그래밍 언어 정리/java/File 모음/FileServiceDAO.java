package com.uhygeramgr.file.service.impl;


import org.springframework.stereotype.Repository;

import com.uhygeramgr.file.model.FileVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("FileServiceDAO")
public class FileServiceDAO extends EgovAbstractMapper {
	
	public void insertFile(FileVO fileVO) throws Exception{ 
		insert("insertFile",fileVO); 
	} 
	public int selectFileSeq(FileVO fileVO) throws Exception { 
		return selectOne("selectFileSeq", fileVO); 
	}
	public String selectFilePath(FileVO fileVO)throws Exception{ 
		return selectOne("selectFilePath", fileVO); 
	}
	public void fileDelete(FileVO fileVO) throws Exception{ 
		delete("fileDelete",fileVO); 
	}
	 
}
