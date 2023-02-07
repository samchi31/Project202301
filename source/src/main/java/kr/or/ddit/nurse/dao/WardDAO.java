package kr.or.ddit.nurse.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.nurse.vo.WardVO;

/**
 * 
 * <pre>
 * 병실관리 화면을 위한 Persistence Layer
 * </pre>
 * @author 작성자명
 * @since 2023. 2. 7.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자                          수정내용
 * --------        --------    ----------------------
 * 2023. 2. 7.      위대현                           최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface WardDAO {
	public List<WardVO> selectWardPatientList();
}
