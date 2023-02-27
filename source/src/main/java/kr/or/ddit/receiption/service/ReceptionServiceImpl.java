package kr.or.ddit.receiption.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;
import kr.or.ddit.receiption.dao.ReceiptionDAO;
import kr.or.ddit.receiption.vo.ReadRegistVO;
import kr.or.ddit.receiption.vo.ReceiptionVO;
import kr.or.ddit.receiption.vo.RegistVO;
import kr.or.ddit.receiption.vo.SelectPatientVO;
import kr.or.ddit.receiption.vo.SmsVO;
import kr.or.ddit.receiption.vo.WaitListVO;
import kr.or.ddit.receiption.vo.SelectOperationListVO;

@Service
public class ReceptionServiceImpl implements ReceptionService {

	@Inject
	ReceiptionDAO DAO;

	@Override
	public List<ReceiptionVO> searchPatientList(Map<String, String> map) {
			List<ReceiptionVO> seekReceptionList = DAO.seekReceptionList(map);
		return seekReceptionList;
	}

	@Override
	public int createReceiption(RegistVO registVO) {
		int rowcnt = DAO.insertReceiption(registVO);
		return rowcnt;
	}

	@Override
	public int createWaitHistory() {
		int rowcnt = DAO.insertWaitHistory();
		return rowcnt;
	}

	@Override
	public int createPatient(PatientVO patientVO) {
		int rowcnt = DAO.insertPatient(patientVO);
		return rowcnt;
	}

	@Override
	public ReadRegistVO selectRegistVO(String paNo) {
		ReadRegistVO registVO = DAO.selectRegistVO(paNo);
		return registVO;
	}

	@Override
	public SelectPatientVO selectPatient() {
		SelectPatientVO selectPatient = DAO.selectPatient();
		return selectPatient;
	}

	@Override
	public List<WaitListVO> retrieveWaitList(String officeCd) {
		List<WaitListVO> list = DAO.selectWaitList(officeCd);
		return list;
	}

	@Override
	public List<SelectOperationListVO> retrieveOperationList(String operTf) {
		List<SelectOperationListVO> list = DAO.selectOperationList(operTf);
		return list;
	}

	@Override
	public int createSms(String smsCont) {
		int cnt = DAO.insertSms(smsCont);
		return cnt;
	}

	@Override
	public int modifySms(SmsVO smsVO) {
		int cnt = DAO.updateSms(smsVO);
		return cnt;
	}

	@Override
	public int removeSms(String sttCd) {
		int cnt = DAO.deleteSms(sttCd);
		return cnt;
	}

	@Override
	public List<SmsVO> retrieveSmsList() {
		List<SmsVO> list = DAO.selectSmsList();
		return list;
	}


}
