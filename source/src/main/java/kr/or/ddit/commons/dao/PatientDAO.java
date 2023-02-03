package kr.or.ddit.commons.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.vo.PagingVO;
import kr.or.ddit.commons.vo.PatientVO;

/**
 * 
 * <pre>
 * 환자관리(CRUD)를 위한 Persistence Layer
 * </pre>
 * @author 위대현
 * @since 2023. 2. 3.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 *   수정일                    수정자                          수정내용
 * --------       --------    ----------------------
 * 2023. 2. 3.      위대현                        최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface PatientDAO {
	public int selectTotalRecord(PagingVO<PatientVO> pagingVO);
	/**
	 * 환자 신규 등록
	 * @param patient
	 * @return 등록된 레코드 수(rowcnt) > 0 : 성공, <=0 : 실패
	 */
	public int insertPatient(PatientVO patient);
	
	/**
	 * 환자 목록 조회
	 * @param pagingVO
	 * @return size == 0인 경우, 조건에 맞는 레코드 없음.
	 */
	public List<PatientVO> selectPatientList(PagingVO<PatientVO> pagingVO);
	
	/**
	 * 환자 상세 조회
	 * @param paNo
	 * @return 조건에 맞는 레코드 없는 경우, null 반환
	 */
	public PatientVO selectPatient(@Param("paNo") int paNo);
	
	/**
	 * 환자 정보 수정
	 * @param patient
	 * @return 수정된 레코드 수(rowcnt) > 0 : 성공, <= 0 : 실패 
	 */
	public int updatePatient(PatientVO patient);
	
	/**
	 * 환자 정보 삭제
	 * @param paNo
	 * @return 삭제된 레코드 수(rowcnt) > 0 : 성공, <= 0 : 실패  
	 */
	public int deletePatient(Integer paNo);
}


































