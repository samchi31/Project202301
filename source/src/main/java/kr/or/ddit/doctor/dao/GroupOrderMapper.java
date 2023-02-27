package kr.or.ddit.doctor.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.doctor.vo.GroupOrderVO;

/**
 * @author 박시윤
 * @since 2023. 2. 16.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 16.      박시윤       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface GroupOrderMapper {
	
	/**
	 * 현재 전체 그룹오더 리스트 전체
	 * @return
	 */
	public List<GroupOrderVO> selectGOList();
	
	/**
	 * 그룹오더 하나 
	 * @param goCd 그룹오더 코드
	 * @return
	 */
	public GroupOrderVO selectGO(String goCd);
	
	/**
	 * 그룹오더 작성
	 * @param groupOrder 그룹오더 정보 + 상병목록 + 처방목록 + 증상목록
	 * @return
	 */
	public int insertGO(GroupOrderVO groupOrder);
	public int insertGODisList(GroupOrderVO groupOrder);
	public int insertGOPreList(GroupOrderVO groupOrder);
	public int insertGOSymList(GroupOrderVO groupOrder);
	
	/**
	 * 그룹코드 삭제
	 * @param goCd
	 * @return
	 */
	public int deleteGO(String goCd);
	public int deleteGODisList(String goCd);
	public int deleteGOPreList(String goCd);
	public int deleteGOSymList(String goCd);
	
	/**
	 * 그룹코드 수정
	 * @param groupOrder
	 * @return
	 */
	public int updateGO(GroupOrderVO groupOrder);
}
