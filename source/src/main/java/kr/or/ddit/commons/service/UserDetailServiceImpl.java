package kr.or.ddit.commons.service;

import javax.inject.Inject;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.dao.MemberDAO;
import kr.or.ddit.commons.vo.EmployeeVO;
import kr.or.ddit.commons.vo.MemberVOWrapper;

@Service("userDetailService")
public class UserDetailServiceImpl implements UserDetailsService {
	
	@Inject
	private MemberDAO memberDAO;
	
	private MessageSourceAccessor accessor;
	
	/* 유저 잇는지 없는지
	 * @see org.springframework.security.core.userdetails.UserDetailsService#loadUserByUsername(java.lang.String)
	 */
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	
		int empNo = Integer.parseInt(username);	// parse error? 발생할수도
	
		EmployeeVO member = memberDAO.selectMember(empNo);
		
		LocaleContextHolder.getLocale();	// ?? 왜쓰신거지...
		if(member == null) {
			// member 없을 시 exception throw
			String exceptionMessage = accessor.getMessage("JdbcDaoImpl.notFound", new Object[] {username});
			throw new UsernameNotFoundException(exceptionMessage);
		}
		
		UserDetails user = new MemberVOWrapper(member);
		return user;
	}

}
