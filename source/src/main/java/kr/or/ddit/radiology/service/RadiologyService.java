package kr.or.ddit.radiology.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commons.vo.FilmCateVO;
import kr.or.ddit.commons.vo.PagingVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;
import kr.or.ddit.enumpkg.ServiceResult;

/**
 * <pre>
 * 촬영기록관리(CRUD)를 위한 Persistence Layer
 * </pre>
 * @author 이하예
 * @since 2023. 2. 3.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                       수정자                                수정내용
 * --------     --------    ----------------------
 * 2023. 2. 3.   이하예                               최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */ 
public interface RadiologyService {

	public List<FilmCateVO> retrieveFilmRecodeList(Map<String, String> map);
	
	
	/**
	 * 영상 기록 상세 조회
	 * @param filmCd
	 * @return
	 */
	public FilmCateVO retrieveFilmRecode(String filmCd);

	public List<FilmCateVO> retrieveFilmList();
	
	
	/**
	 * xray대기실 상황
	 * @return
	 */
	public List<WaitHistoryVO> selectXrayList();

	/**
	 * MRI대기실 상황
	 * @return
	 */
	public List<WaitHistoryVO> selectMRIList();

	/**
	 * CT대기실 상황
	 * @return
	 */
	public List<WaitHistoryVO> selectCTList();

	/**
	 * 초음파대기실 상황
	 * @return
	 */
	public List<WaitHistoryVO> selectUltraList();


	/**
	 * 전체 촬영실 대기상태
	 * @return
	 */
	public List<WaitHistoryVO> selectRadiAllList();


}
