package kr.or.ddit.commons.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.dao.PatientDAO;
import kr.or.ddit.commons.vo.PagingVO;
import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.enumpkg.ServiceResult;

@Service
public class PatientServiceImpl implements PatientService {
	
	@Inject
	private PatientDAO patientDAO;
	
	@Override
	public ServiceResult createPatient(PatientVO patient) {
		ServiceResult result = null;
		
		int rowcnt = patientDAO.insertPatient(patient);
		result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;

		return result;
	}

	@Override
	public List<PatientVO> retrievePatientList(PagingVO<PatientVO> pagingVO) {
		pagingVO.setTotalRecord(patientDAO.selectTotalRecord(pagingVO));
		
		List<PatientVO> patientList = patientDAO.selectPatientList(pagingVO);
		
		pagingVO.setDataList(patientList);
		
		return patientList;
	}

	@Override
	public PatientVO retrievePatient(int paNo) {
		PatientVO patient = patientDAO.selectPatient(paNo);
		return patient;
	}

	@Override
	public ServiceResult modifyPatient(PatientVO patient) {
		int rowcnt = patientDAO.updatePatient(patient);
		ServiceResult result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	
		return result;
	}

	@Override
	public ServiceResult removePatient(PatientVO patient) {
		
		int rowcnt = patientDAO.deletePatient(patient.getPaNo());
		ServiceResult result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	
	return result;
	}

}
