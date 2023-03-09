package kr.or.ddit.receiption.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;
import kr.or.ddit.receiption.dao.ReceiptionDAO;
import kr.or.ddit.receiption.vo.OutHospitalizationVO;
import kr.or.ddit.receiption.vo.ReadRegistVO;
import kr.or.ddit.receiption.vo.ReceiptionVO;
import kr.or.ddit.receiption.vo.RegistVO;
import kr.or.ddit.receiption.vo.SelectPatientVO;
import kr.or.ddit.receiption.vo.SmsVO;
import kr.or.ddit.receiption.vo.WaitListVO;
import kr.or.ddit.receiption.vo.WardRegistVO;
import lombok.extern.slf4j.Slf4j;
import kr.or.ddit.receiption.vo.SelectOperationListVO;

@Service
@Slf4j
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
	public List<SelectOperationListVO> retrieveOperationList() {
		List<SelectOperationListVO> list = DAO.selectOperationList();
		log.info("wardList>>>>>>>>ServiceImpl  {}", list);
		return list;
	}

	@Override
	public int createSms(SmsVO smsVO) {
		int cnt = DAO.insertSms(smsVO);
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

	@Override
	public int createWardRegist(WardRegistVO wardRegistVO) {
		int cnt = DAO.insertWardRegist(wardRegistVO);
		return cnt;
	}

	@Override
	public List<WardRegistVO> retrieveWardRegistedList() {
		List<WardRegistVO> list = DAO.selectWardRegistedList();
		return list;
	}

	@Override
	public List<OutHospitalizationVO> retrieveOutHsptList() {
		List<OutHospitalizationVO> list = DAO.selectOutHsptList();
		return list;
	}

	@Override
	public int modifyCancleHspt(Integer hsptNo) {
		int cnt = DAO.updateCancleHspt(hsptNo);
		return cnt;
	}

	@Override
	public int removeHsptList(Integer hsptNo) {
		int cnt = DAO.deleteHsptList(hsptNo);
		return cnt;
	}

	@Override
	public List<ReceiptionVO> retrieveFisrtShowAllPatientList() {
		List<ReceiptionVO> list = DAO.selectFisrtShowAllPatientLis();
		return list;
	}


}
