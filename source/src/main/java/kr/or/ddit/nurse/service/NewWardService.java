package kr.or.ddit.nurse.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commons.vo.DiagHistoryVO;
import kr.or.ddit.commons.vo.OperationInfomationVO;

public interface NewWardService {

	/**
	 * 환자 이름 또는 생년월일로 환자 검색
	 * @param map
	 * @return
	 */
	public List<OperationInfomationVO> retrievePatientSearch(Map<String, String> map);
	
	/**
	 * 진료차트를 이용해 진단된 상병코드 리스트 조회
	 * @param map
	 * @return
	 */
	public List<DiagHistoryVO> retrieveDiagnosisList(Map<String, String> map);

}
