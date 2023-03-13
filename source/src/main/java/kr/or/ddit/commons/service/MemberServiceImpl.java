package kr.or.ddit.commons.service;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
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
	
	@PostConstruct
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
				
		ServiceResult result = null;
		try {
			/*
			 * empPw : 새비밀번호 -> 있으면 db 변경 후 새 authentication 생성
			 * authPass : 기존 비밀번호 (인증용)
			 */
			
			// 아이디와 비번을 담은 데이터 생성
			Authentication inputData = null;
			// 새 비밀번호가 없으면
			if(StringUtils.isBlank(member.getEmpPw())) {
				inputData = new UsernamePasswordAuthenticationToken(member.getEmpNo(), member.getAuthPass());
			} else {
				inputData = new UsernamePasswordAuthenticationToken(member.getEmpNo(), member.getEmpPw()); 	
				// 새 비밀번호 암호화
				String encoded = encoder.encode(member.getEmpPw());
				member.setEmpPw(encoded);
			}			
			
			int rowcnt = memberDAO.updateMember(member);
			
			// 데이터로 인증 후 인증 객체 생성 (userdetail principal -> membervowrapper)
			Authentication newAuthentication = authenticationManager.authenticate(inputData);
			// 현재 security session 정보 변경
			SecurityContextHolder.getContext().setAuthentication(newAuthentication);
			
			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		}catch (UsernameNotFoundException e) {
			result = ServiceResult.NOTEXIST;
		}catch (AuthenticationException e) {
			log.info("{}", e.getMessage());
			result = ServiceResult.INVALIDPASSWORD;
		}
		return result;
	}

	@Override
	public ServiceResult removeMember(EmployeeVO member) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public ServiceResult matchPassword(String inputPass, String savedPass) {
		if(! encoder.matches(inputPass, savedPass)) {
			return ServiceResult.INVALIDPASSWORD;
		}
		return ServiceResult.OK;
	}

}
