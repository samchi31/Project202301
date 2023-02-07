package kr.or.ddit.nurse.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.nurse.dao.CexDAO;
import kr.or.ddit.nurse.vo.CexVO;

@Service
public class CexServiceImpl implements CexService {

	@Inject
	private CexDAO cexDAO;
	
	@Override
	public List<PatientVO> retrievePatientList(Map<String, String> map) {
		return cexDAO.selectPatientList(map);
	}

	@Override
	public List<CexVO> retrieveCexHistoryList(int paNo) {
		return cexDAO.selectCexHistory(paNo);
	}

	@Override
	public CexVO retrieveCexDetail(String cexNo) {
		return cexDAO.selectCexDetail(cexNo);
	}

	@Override
	public List<CexVO> retrieveCexWaitList() {
		return cexDAO.selectCexWaitList();
	}

	@Override
	public int createCex(CexVO cex) {
		return cexDAO.insertCex(cex);
	}

}
