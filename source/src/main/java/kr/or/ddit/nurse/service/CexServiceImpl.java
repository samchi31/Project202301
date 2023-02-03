package kr.or.ddit.nurse.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.nurse.dao.CexDAO;

@Service
public class CexServiceImpl implements CexService {

	@Inject
	private CexDAO cexDAO;
	
	@Override
	public List<PatientVO> retrievePatientList(Map<String, String> map) {
		return cexDAO.selectPatientList(map);
	}

}
