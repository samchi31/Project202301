package kr.or.ddit.commons.service;

import java.util.List;

import kr.or.ddit.commons.vo.EmployeeVO;
import kr.or.ddit.enumpkg.ServiceResult;

/**
 * @author 박시윤
 * @since 2023. 2. 20.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 20.      박시윤       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
public interface MemberService {
	
	/**
	 * 회원 가입
	 * @param member 
	 * @return 아이디 중복 실패, 가입성공, 가입실패 
	 */
	public ServiceResult createMember(EmployeeVO member);
	
	/**
	 * 회원 리스트
	 * @return
	 */
	public List<EmployeeVO> retrieveMemberList();
	
	/**
	 * 회원 정보 상세 조회
	 * @param empNo 사번
	 * @return 존재안함 예외, 정보
	 */
	public EmployeeVO retrieveMember(int empNo);
	
	/**
	 * 회원 수정
	 * @param member
	 * @return 존재 안함, 비번 인증 실패, 성공, 실패
	 */
	public ServiceResult modifyMember(EmployeeVO member);
	
	/**
	 * 회원 탈퇴
	 * @param member
	 * @return 존재 안함, 비번 인증 실패, 성공, 실패
	 */
	public ServiceResult removeMember(EmployeeVO member);
}
