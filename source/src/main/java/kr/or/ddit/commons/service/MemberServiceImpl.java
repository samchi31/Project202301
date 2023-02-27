package kr.or.ddit.commons.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.dao.MemberDAO;
import kr.or.ddit.commons.vo.EmployeeVO;
import kr.or.ddit.enumpkg.ServiceResult;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	private MemberDAO memberDAO;
	@Inject
	private AuthenticationManager authenticationManager;
	@Inject
	private PasswordEncoder encoder;
	
	public void init() {
		log.info("주입된 객체 : {}, {}, {}", memberDAO, authenticationManager, encoder);
	}

	@Override
	public ServiceResult createMember(EmployeeVO member) {
		
		return null;
	}

	@Override
	public List<EmployeeVO> retrieveMemberList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EmployeeVO retrieveMember(int empNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ServiceResult modifyMember(EmployeeVO member) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ServiceResult removeMember(EmployeeVO member) {
		// TODO Auto-generated method stub
		return null;
	}

}
