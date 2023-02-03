package kr.or.ddit.commons.service;

import java.util.List;

import kr.or.ddit.commons.vo.PagingVO;
import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.enumpkg.ServiceResult;

/**
 * 환자관리(CRUD)를 위한 Business Logic Layer
 * @author 위대현
 * @since 2023. 2. 3.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 *   수정일                 수정자                         수정내용
 * --------     --------    ----------------------
 * 2023. 2. 3.    위대현                         최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
public interface PatientService {
	/**
	 * 신규환자등록
	 * @param patient
	 * @return 중복등록으로 인한 실패(PKDUPLICATED), 등록 성공(OK), 등록 실패(FAIL)
	 */
	public ServiceResult createPatient(PatientVO patient);
	
	public List<PatientVO> retrievePatientList(PagingVO<PatientVO> pagingVO);
	
	/**
	 * 환자 정보 상세 조회
	 * @param paNo
	 * @return 
	 */
	public PatientVO retrievePatient(int paNo);
	
	/**
	 * 환자 정보 수정
	 * @param patient
	 * @return 존재 부(NOTEXIST), 성공(OK), 실패(FAIL)
	 */
	public ServiceResult modifyPatient(PatientVO patient);
	
	/**
	 * 환자 정보 삭제
	 * @param patient
	 * @return 존재 부(NOTEXIST), 비번 인증 실패(INVALIDPASSWORD), 성공(OK), 실패(FAIL)
	 */
	public ServiceResult removePatient(PatientVO patient);
}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	