package kr.or.ddit.nurse.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.nurse.vo.CexVO;

/**
 * 
 * <pre>
 * 임상검사실 화면을 위한 Business Logic Layer
 * </pre>
 * @author 위대현
 * @since 2023. 2. 3.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 *   수정일                   수정자                         수정내용
 * --------      --------    ----------------------
 * 2023. 2. 3.     위대현                        최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
public interface CexService {
	public List<CexVO> retrieveCexWaitList();
	
	/**
	 * 환자 목록 조회
	 * @param map
	 * @return
	 */
	public List<PatientVO> retrievePatientList(Map<String, String> map);
	
	/**
	 * 환자의 임상 검사 기록을 모두 조회
	 * @param paNo
	 * @return 임상기록 리스트
	 */
	public List<CexVO> retrieveCexHistoryList(int paNo);
	
	/**
	 * 임상검사 결과를 조회
	 * @param cexNo
	 * @return cexNO에 해당하는 검사결과를 CexVO에 넣어 반환
	 */
	public CexVO retrieveCexDetail(String cexNo);
	
	public int createCex(CexVO cex);
}






























