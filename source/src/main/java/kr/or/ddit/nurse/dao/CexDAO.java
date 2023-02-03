package kr.or.ddit.nurse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.vo.PagingVO;
import kr.or.ddit.commons.vo.PatientVO;

/**
 * 
 * <pre>
 * 임상검사실 화면을 위한 Business Logic Layer
 * </pre>
 * @author 작성자명
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
@Mapper
public interface CexDAO {
	public int selectTotalRecord(PagingVO<PatientVO> pagingVO);
	
	/**
	 * 환자 목록 조회
	 * @param map
	 * @return
	 */
	public List<PatientVO> selectPatientList(Map<String, String> map);
}




























