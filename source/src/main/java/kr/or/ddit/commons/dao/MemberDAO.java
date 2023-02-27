package kr.or.ddit.commons.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.vo.EmployeeVO;

/**
 * @author 박시윤
 * @since 2023. 2. 20.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 20.  박시윤       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface MemberDAO {
	
	/**
	 * 사번으로 회원 조회
	 * @param empNo 사번
	 * @return
	 */
	public EmployeeVO selectMember(int empNo);
	
	/**
	 * 회원 등록
	 * @param member
	 * @return
	 */
	public int insertMember(EmployeeVO member);
	
	/**
	 * 회원 정보 수정
	 * @param member
	 * @return
	 */
	public int updateMember(EmployeeVO member);
	
	/**
	 * 회원삭제
	 * @param empNo
	 * @return
	 */
	public int deleteMember(int empNo);
	
	/**
	 * 회원 리스트 (필요시 pagingVO로 변경)
	 * @return
	 */
	public List<EmployeeVO> selectMemberList();
}
