package kr.or.ddit.commons.vo;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

public class MemberVOWrapper extends User{
	private EmployeeVO realMember;
	
	public MemberVOWrapper(EmployeeVO realMember) {
		super(realMember.getEmpNo().toString(), realMember.getEmpPw()
				, AuthorityUtils.createAuthorityList(realMember.getJobCd()));
		
		this.realMember = realMember;
	}
	
	public EmployeeVO getRealMember() {
		return realMember;
	}
	
	@Override
	public boolean isEnabled() {
		return realMember.getEmpRtdt() == null ? true : false ;
	}
}
