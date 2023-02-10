package kr.or.ddit.pt.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.commons.vo.PtAssinmentVO;
import kr.or.ddit.commons.vo.ReceptionVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;
import kr.or.ddit.enumpkg.ServiceResult;

/**
 * @author 장예지
 * @since 2023. 2. 3.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * 
 *      <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 3.      장예지       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 *      </pre>
 */
@Mapper
public interface PtAssinmentDAO {

	/**
	 * 물리치료실 대기 환자 목록 조회
	 * 
	 * @param ptAssinmentVO
	 * @return
	 */
	public List<PtAssinmentVO> selectPtAssinmentList(PtAssinmentVO ptAssinmentVO);

	/**
	 * 물리치료실 bed 상태
	 * 
	 * @param ptAssinmentVO
	 * @return
	 */
	public List<PtAssinmentVO> ptBedList();

	/**
	 * 물리치료실 bed에 환자 배정
	 * 
	 * @param
	 * @return
	 */
	public int ptBedFull(PtAssinmentVO ptAssinmentVO);

	/**
	 * 물리치료실 bed 치료완료처리
	 * 
	 * @param
	 * @return
	 */
	public int ptBedEmpty(PtAssinmentVO ptAssinmentVO);

	/**
	 * 환자조회
	 * 
	 * @param map
	 * @return
	 */
	public List<PatientVO> selectPatientList(Map<String, String> map);

	/**
	 * 대기히스토리 추가(대기중->치료중)
	 * 
	 * @param waitHistoryVO
	 */
	public int cureListChangeInsert(WaitHistoryVO waitHistoryVO);

	/**
	 * 대기히스토리 추가(대기중->치료중)
	 * 
	 * @param waitHistoryVO
	 */
	public int completionChangeInsert(WaitHistoryVO waitHistoryVO);

	public ReceptionVO selectPatient(int rcpNo);

}
