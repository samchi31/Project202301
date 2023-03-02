package kr.or.ddit.nurse.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.vo.DiagHistoryVO;
import kr.or.ddit.commons.vo.OperationInfomationVO;
import kr.or.ddit.nurse.dao.NewWardDAO;

@Service
public class NewWardServiceImpl implements NewWardService {

	@Inject
	private NewWardDAO newWardDao;
	
	@Override
	public List<OperationInfomationVO> retrievePatientSearch(Map<String, String> map) {
		return newWardDao.selectPatientSearch(map);
	}

	@Override
	public List<DiagHistoryVO> retrieveDiagnosisList(Map<String, String> map) {
 		return newWardDao.selectDiagnosisList(map);
	}

}
