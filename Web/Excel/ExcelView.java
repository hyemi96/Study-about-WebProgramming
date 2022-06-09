/**

 * 시스템      : 코어
 * 단위 시스템 :
 * 프로그램 명 : 엑셀 다운로드
 * 파일명      : ExcelView.java
 * 설명        :
 */
package egovframework.util;




import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.hssf.util.HSSFColor.GREEN;
import org.apache.poi.sl.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.uhygeramgr.file.web.FileController;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;


/**
 * 이력사항
 * 송혜미
 * 2022.01.
 */
public class ExcelView extends AbstractExcelView {
	
	Logger logger = LogManager.getLogger(ExcelView.class);

	/**
	 * 엑셀 다운로드 (시트별)
	 * @see org.springframework.web.servlet.view.document.AbstractExcelView#buildExcelDocument(java.util.Map, org.apache.poi.hssf.usermodel.HSSFWorkbook, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 * @param model
	 * @param wb
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook wb, HttpServletRequest request, HttpServletResponse response) throws Exception {

		Map<String, Object> excelMap = (Map<String, Object>) model.get("excelMap");

		//Excel FileName
		String fileName = (String) excelMap.get("fileName");
		String enFileName = URLEncoder.encode(fileName, "utf-8");
		response.setHeader("Content-Disposition", "attachment; filename=" + enFileName + ".xls");
	
		//Excel Sheet List
		List<?> sheetList = (List<?>) excelMap.get("sheetList");

		//Font
		HSSFFont font = wb.createFont();
		font.setFontHeightInPoints((short) 10);
		font.setFontName("돋움");
		
		HSSFFont font2 = wb.createFont();
		font2.setFontHeightInPoints((short) 10);
		font2.setFontName("돋움");
		font2.setBoldweight((short) font2.BOLDWEIGHT_BOLD);
		
		HSSFFont font3 = wb.createFont();
		font3.setFontHeightInPoints((short) 11);
		font3.setFontName("돋움");

		//Excel Cell Style OutLine
		HSSFCellStyle cs = wb.createCellStyle();
		cs.setBorderTop((short)1);
		cs.setBorderBottom((short)1);
		cs.setBorderLeft((short)1);
		cs.setBorderRight((short)1);
		cs.setFont(font);

		//Excel Cell Style OutLine (HEADER)
		HSSFCellStyle hCS =  wb.createCellStyle();
		hCS.setBorderTop((short)1);
		hCS.setBorderBottom((short)1);
		hCS.setBorderLeft((short)1);
		hCS.setBorderRight((short)1);
		hCS.setFont(font2);
		
		//Excel Cell Style OutLine (TITLE)
		HSSFCellStyle tCS =  wb.createCellStyle();
		tCS.setFont(font3);

		for(Object sheetObj:sheetList) {
			Map<String, Object> sheetMap = (Map<String, Object>) sheetObj;
			String stitle = (String) sheetMap.get("title");
			String[] sheader = (String[]) sheetMap.get("header");
			List<?> slist = (List<?>) sheetMap.get("list");

			HSSFCell scell = null;
			HSSFSheet ssheet = wb.createSheet(stitle);
			//ssheet.setDefaultColumnWidth((short) 12);

			//Set Title
			scell = getCell(ssheet, 0, 0);
			scell.setCellStyle(tCS);
			setText(scell, stitle);

			//Set Header
			for(int h = 0; h < sheader.length; h++) {
				HSSFCell cell = null;
			    cell = getCell(ssheet, 2, h);

				hCS.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);	// 배경
				hCS.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);				// 채움
				cell.setCellStyle(hCS);
				setText(cell, sheader[h]);
				//setText(getCell(ssheet, 2, h), sheader[h]);
			}

			//Set Data
			for(int i = 0; i < slist.size(); i++) {
				Map<String, Object> map = (Map<String, Object>) slist.get(i);
				Set<String> keySet =  map.keySet();
		        String tempKey = null;
		        String tempValue = null;
		        int j = 0;
		        for( Map.Entry<String, Object> elem : map.entrySet() ){
		            tempKey = elem.getKey();
		            tempValue = EgovStringUtil.isNullToString(elem.getValue());		      
                    scell = getCell(ssheet, 3 + i, j);
		            scell.setCellStyle(cs);
					setText(scell, tempValue);
					j++;
		        }
		        
			}
			
			
			// 컬럼 자동지정
			for(int h=0; h < sheader.length; h++){
				ssheet.autoSizeColumn((short) h);
			}
			//엑셀로 잘 만들었으면 이걸 파일로 만들어서 다운시킨다 여기까지 성공
	

		}
       // Flush byte array to servlet output stream.
		response.setContentType("ms-vnd/excel");
		// 엑셀 출력
		ServletOutputStream out = response.getOutputStream();
        wb.write(out);
        out.flush();
		wb.close();
	    logger.info("==============[ FILE FINISH ]==================");
	    // Don't close the stream - we didn't open it, so let the container handle it.
	    // http://stackoverflow.com/questions/1829784/should-i-close-the-servlet-outputstream
	   
	    }
	
	
       
	}

