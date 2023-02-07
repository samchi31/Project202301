package kr.or.ddit.nurse.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.nurse.dao.WardDAO;
import kr.or.ddit.nurse.vo.WardVO;

@Service
public class WardServiceImpl implements WardService {

	@Inject
	private WardDAO wardDAO;
	
	@Override
	public List<WardVO> retrieveWardPatientList() {
		return wardDAO.selectWardPatientList();
	}

}
