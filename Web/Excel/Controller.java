

	/**
	 * 이력사항
   * 엑셀클릭시 컨트롤러에서 엑셀뷰를 불러주는 메소드
   * 송혜미 
   * 2022.01.14
	 */
	@RequestMapping(value = "/statistic/aiRawdataExcel.do")
	public ModelAndView rawdataExcel(@ModelAttribute RawdataVO rawdataVO, HttpServletRequest request, ModelMap model,
			ModelAndView mv) throws Exception {
		String result = "OK";
		String now = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());

		// 엑셀 파일명
		String fileName = "AiRawdata_" + now;

		// 첫번째 시트
		String title = "";

		List<?> list = null;

		List<Object> excelList = new ArrayList<Object>();
		String[] header = null;

		super.initSearchStartDate();

		if ("".equals(rawdataVO.getStartDt())) {
			rawdataVO.setStartDt(super.getStartDt());
			rawdataVO.setEndDt(super.getEndDt());
		}

		String patternTypeName = rawdataVO.getPatternTypeName();
		// 만일 패턴명 텍스트에 특수문자 ( 예시) &->&amp) 변환 하여 넣어주기
		String patternTypeNameResult = StringEscapeUtils.unescapeHtml(patternTypeName);

		list = statisticService.aiRawdataList(rawdataVO);

		title = "AI Rawdata List";
		header = new String[] { "순번", "RAWDATA SEQ", "CLIENT UID", "DEVICE UID", "R VALUE", "C VALUE", "L체결", "R체결",
				"시간", "패턴명", "패턴코드값" };

		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				EgovMap rVO = (EgovMap) list.get(i);

				LinkedHashMap<String, Object> v = new LinkedHashMap<String, Object>();

				v.put("seq", i + 1);
				v.put("rawdataSeq", rVO.get("seq"));
				v.put("clientUid", rVO.get("clientUid"));
				v.put("deviceUid", rVO.get("deviceUid"));
				v.put("rVal", rVO.get("rVal"));
				v.put("cVal", rVO.get("cVal"));
				v.put("connResistanceLeft", rVO.get("connResistanceLeft"));
				v.put("connResistanceRight", rVO.get("connResistanceRight"));
				v.put("collectedAt", rVO.get("collectedAt"));
				v.put("patternTypeName", patternTypeNameResult);
				v.put("patternType", rawdataVO.getPatternType());

				excelList.add(i, v);
			}
		}

		Map<String, Object> sheetMap1 = new HashMap<String, Object>();
		sheetMap1.put("title", title);
		sheetMap1.put("header", header);
		sheetMap1.put("list", excelList);
		// 시트 취합
		List<Map<String, Object>> sheetList = new ArrayList<Map<String, Object>>();
		sheetList.add(sheetMap1);
		// 파일명, 시트리스트 최종 셋팅
		Map<String, Object> excelMap = new HashMap<String, Object>();
		excelMap.put("fileName", fileName);
		excelMap.put("sheetList", sheetList);

		return new ModelAndView("excelView", "excelMap", excelMap);
	}
