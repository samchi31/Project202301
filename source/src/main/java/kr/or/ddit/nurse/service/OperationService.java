package kr.or.ddit.nurse.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commons.vo.EmployeeVO;
import kr.or.ddit.commons.vo.OperationInfomationVO;
import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.commons.vo.SymptomVO;
import kr.or.ddit.commons.vo.TrmChartVO;
import kr.or.ddit.nurse.vo.CexVO;
import kr.or.ddit.nurse.vo.OperationVO;

/**
 * 
 * <pre>
 *  수술검사 화면을 위한 Business Logic Layer
 * </pre>
 * @author 위대현
 * @since 2023. 2. 14.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 *   수정일                         수정자                         수정내용
 * --------         --------    ----------------------
 * 2023. 2. 14.      작성자명                       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
public interface OperationService {
	
	/**
	 * 수술 대상이지만 아직 예약되지 않은 환자리스트를 진단내역을 기준으로 출력한다
	 * @return 환자리스트
	 */
	public List<OperationInfomationVO> retrieveOperationList();

	public TrmChartVO retrieveDiagnosisDetail(Map<String, String> map);

	public List<SymptomVO> retrieveSymptomList(Map<String, String> map);
	
	/**
	 * 임상검사 생성(검사결과 등록은 하지 않음)
	 * @param map
	 * @return 성공, 실패
	 */
	public int createCex(Map<String, String> map);
	
	/**
	 * 임상검사 결과 중복검사
	 * @param trmCd, diseaseCd
	 * @return 차트코드와 상병코드와 일치하는 결과 의 갯수
	 */
	public int checkCexHistory(String trmCd, String diseaseCd);
	
	/**
	 * 검사대기중인 환자리스트 검색
	 * @return 환자ListVO
	 */
	public List<PatientVO> retrieveCexWaitList();

	/**
	 * 검사 완료된 환자리스트 검색
	 * @return 환자ListVO
	 */
	public List<PatientVO> retrieveCexCompleteList();
	
	/**
	 * 환자의 검사결과를 등록
	 * @param cex
	 * @return 성공 , 실패
	 */
	public int modifyCex(CexVO cex);

	/**
	 * 검사코드에 해당하는 검사결과
	 * @param cexNo가 담긴 cexVO
	 * @return 검사결과가 담긴 cexVO
	 */
	public CexVO retrieveCexDetail(CexVO cex);

	/**
	 * 환자의 검사기록을 조회함
	 * @param map
	 * @return 해당환자의 모든 검사리스트
	 */
	public List<CexVO> retrieveCexPatientList(Map<String, String> map);

	/**
	 * 예약된 수술기록 리스트를 조회
	 * @return List<OperationInfomationVO>
	 */
	public List<OperationInfomationVO> retrieveOperationInfoList();

	/**
	 * 수술 예약 정보를 생성
	 * @param operation
	 * @return 성공, 실패
	 */
	public int createOperation(Map<String, Object> map);

	/**
	 * 날짜가 예정된 수술 리스트 조회
	 * @return List<OperationInfomationVO>
	 */
	public List<OperationInfomationVO> retrieveOperReservList();

	/**
	 * 수술번호에 해당하는 수술정보를 조회
	 * @param opNo
	 * @return PatientVO
	 */
	public PatientVO retrieveOperationDetail(String opNo);
	
	/**
	 * 수술 셀렉트박스에 사용할 항목들 불러옴
	 * @return List<OperationVO>
	 */
	public List<OperationVO> retrieveOperationOption();

	/**
	 * 의사 선택 셀렉트박스에 사용할 항목들 불러옴
	 * @return List<EmployeeVO>
	 */
	public List<EmployeeVO> retrieveDocOption();

	/**
	 * 수술정보를 변경함
	 * @param map
	 * @return 성공, 실패
	 */
	public int modifyOperation(Map<String, String> map);

	/**
	 * 수술정보를 삭제함
	 * @param operation
	 * @return 성공, 실패
	 */
	public int removeOperation(OperationInfomationVO operation);

	/**
	 * 수술번호에 해당하는 수술정보를 조회
	 * @param operation
	 * @return OperationInfomationVO
	 */
	public OperationInfomationVO retrieveOperationReservDatail(OperationInfomationVO operation);

	/**
	 * 파라미터로 받은 수술번호에 해당하는 수술의 수술시작시간을 업데이트
	 * @param operation
	 * @return 성공/실패
	 */
	public int modifyOperationStarttime(OperationInfomationVO operation);

	/**
	 * 파라미터로 받은 수술번호에 해당하는 수술의 수술종료시간을 업데이트
	 * @param operation
	 * @return 성공/실패
	 */
	public int modifyOperationEndtime(OperationInfomationVO operation);

	/**
	 * 수술 완료된 환자들 리스트 조회
	 * @return List<OperationInfomationVO>
	 */
	public List<OperationInfomationVO> retrieveOperCompleteList();

	/**
	 * 수술 완료된 환자 검색
	 * @param map
	 * @return List<OperationInfomationVO>
	 */
	public List<OperationInfomationVO> retrieveOperHistory(Map<String, String> map);


}
