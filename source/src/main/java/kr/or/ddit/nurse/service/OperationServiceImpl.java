package kr.or.ddit.nurse.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.vo.EmployeeVO;
import kr.or.ddit.commons.vo.OperationInfomationVO;
import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.commons.vo.SymptomVO;
import kr.or.ddit.commons.vo.TrmChartVO;
import kr.or.ddit.nurse.dao.OperationDAO;
import kr.or.ddit.nurse.vo.CexVO;
import kr.or.ddit.nurse.vo.OperationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OperationServiceImpl implements OperationService {
	
	@Inject
	private OperationDAO operationDAO;

	@Override
	public List<OperationInfomationVO> retrieveOperationList() {
		return operationDAO.selectOperationList();
	}

	@Override
	public TrmChartVO retrieveDiagnosisDetail(Map<String, String> map) {
		return operationDAO.selectDiagnosis(map);
	}

	@Override
	public List<SymptomVO> retrieveSymptomList(Map<String, String> map) {
		return operationDAO.selectSymptomList(map);
	}

	@Override
	public int createCex(Map<String, String> map) {
		String trmCd = map.get("trmCd");
		String diseaseCd = map.get("diseaseCd");

		int check = checkCexHistory(trmCd, diseaseCd);
		int result = 0;
		if(check == 0) {
			result = operationDAO.insertCex(map);
		}
		return result; 
	}

	@Override
	public int checkCexHistory(String trmCd, String diseaseCd) {
		return operationDAO.selectCexHistory(trmCd, diseaseCd);
	}

	@Override
	public List<PatientVO> retrieveCexWaitList() {
		return operationDAO.selectCexWaitList();
	}

	@Override
	public List<PatientVO> retrieveCexCompleteList() {
		return operationDAO.selectCexCompleteList();
	}
	
	@Override
	public int modifyCex(CexVO cex) {
		return operationDAO.updateCex(cex);
	}

	@Override
	public CexVO retrieveCexDetail(CexVO cex) {
		return operationDAO.selectCexDetail(cex);
	}

	@Override
	public List<CexVO> retrieveCexPatientList(Map<String, String> map) {
		return operationDAO.selectCexList(map);
	}

	@Override
	public List<OperationInfomationVO> retrieveOperationInfoList() {
		return operationDAO.selectOperInfoList();
	}

	@Override
	public int createOperation(Map<String, Object> map) {
		return operationDAO.insertOperation(map);
	}

	@Override
	public List<OperationInfomationVO> retrieveOperReservList() {
		return operationDAO.selectOperReservList();
	}

	@Override
	public PatientVO retrieveOperationDetail(String opNo) {
		return operationDAO.selectOperReservDetail(opNo);
	}

	@Override
	public List<OperationVO> retrieveOperationOption() {
		return operationDAO.selectOperationOption();
	}

	@Override
	public List<EmployeeVO> retrieveDocOption() {
		return operationDAO.selectDocOption();
	}

	@Override
	public int modifyOperation(Map<String, String> map) {
		//해당 수술에 직원이 들어가 있는지 검사
		int check = operationDAO.selectOperationJoin(map);
		// 들어가 있으면 삭제후 다시 입력
		if(check == 1) {
			int deleteResult = operationDAO.deleteOperationJoinMap(map);
		}
		int result = operationDAO.InsertOperationJoin(map);			
		
		return operationDAO.updateOperation(map);
	}

	@Override
	public int removeOperation(OperationInfomationVO operation) {
		int check = operationDAO.checkOperationJoin(operation);
		if(check > 0) {
			operationDAO.deleteOperationJoin(operation);
		}
		return operationDAO.deleteOperation(operation);
	}

	@Override
	public OperationInfomationVO retrieveOperationReservDatail(OperationInfomationVO operation) {
		return operationDAO.selectOperationReserv(operation);
	}

	@Override
	public int modifyOperationStarttime(OperationInfomationVO operation) {
		return operationDAO.updateOperationStarttime(operation);
	}

	@Override
	public int modifyOperationEndtime(OperationInfomationVO operation) {
		return operationDAO.updateOperationEndtime(operation);
	}

	@Override
	public List<OperationInfomationVO> retrieveOperCompleteList() {
		return operationDAO.selectOperCompleteList();
	}

	@Override
	public List<OperationInfomationVO> retrieveOperHistory(Map<String, String> map) {
		return operationDAO.selectOperationHistory(map);
	}


}
