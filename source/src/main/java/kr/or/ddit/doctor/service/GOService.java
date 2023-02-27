package kr.or.ddit.doctor.service;

import java.util.List;

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
public interface GOService {
	
	/**
	 * 전체 그룹오더 리스트
	 * @return
	 */
	public List<GroupOrderVO> retrieveGOList();
	
	/**
	 * 그룹오더 하나
	 * @return
	 */
	public GroupOrderVO retrieveGO(String goCd);
	
	/**
	 * 그룹오더 작성
	 * @param groupOrderVO
	 * @return
	 */
	public int createGO(GroupOrderVO groupOrderVO);
	
	public int createGODisList(GroupOrderVO groupOrderVO);
	public int createGOPreList(GroupOrderVO groupOrderVO);
	public int createGOSymList(GroupOrderVO groupOrderVO);
	
	/**
	 * 그룹오더 수정
	 * @param groupOrderVO
	 * @return
	 */
	public int modifyGO(GroupOrderVO groupOrderVO);
	
	/**
	 * 그룹오더 삭제
	 * @param goCd
	 * @return
	 */
	public int removeGO(String goCd);
}
