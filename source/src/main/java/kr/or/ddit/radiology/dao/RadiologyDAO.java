package kr.or.ddit.radiology.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.vo.FilmCateVO;
import kr.or.ddit.commons.vo.PagingVO;

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
@Mapper
public interface RadiologyDAO {
	
	public int selectTotalRecord(PagingVO<FilmCateVO> pagingVO);
	
	/**
	 * 전체 영상 기록 조회
	 * @param pagingVO
	 * @returnsize == 0인 경우, 조건에 맞는 레코드 없음.
	 */
	public List<FilmCateVO> selectFilmList(PagingVO<FilmCateVO> pagingVO);
	
	/**
	 * 영상 기록 선택 출력
	 * @param filmCd
	 * @return 조건에 맞는 레코드 없는 경우, null 반환
	 */
	public FilmCateVO selectPatient(@Param("filmCd") String filmCd);
}
