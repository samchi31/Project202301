package kr.or.ddit.nurse.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.vo.HospitalizationVO;
import kr.or.ddit.commons.vo.IntakeOutputVO;
import kr.or.ddit.commons.vo.IntakeVO;
import kr.or.ddit.commons.vo.OutputVO;
import kr.or.ddit.commons.vo.VitalVO;
import kr.or.ddit.nurse.dao.WardDAO;
import kr.or.ddit.nurse.vo.DietCategoryVO;
import kr.or.ddit.nurse.vo.DietRecordVO;
import kr.or.ddit.nurse.vo.IntakeCategoryVO;
import kr.or.ddit.nurse.vo.NrecVO;
import kr.or.ddit.nurse.vo.OutputCategoryVO;
import kr.or.ddit.nurse.vo.WardVO;

@Service
public class WardServiceImpl implements WardService {

	@Inject
	private WardDAO wardDAO;
	
	@Override
	public List<WardVO> retrieveWardPatientList() {
		return wardDAO.selectWardPatientList();
	}

	@Override
	public WardVO retrieveWardPatient(int hsptNo) {
		return wardDAO.selectWardPatien(hsptNo);
	}

	@Override
	public int createNrec(NrecVO nrec) {
		return wardDAO.insertNrec(nrec);
	}

	@Override
	public List<NrecVO> retrieveNrecList(int hsptNo) {
		return wardDAO.selectNrecList(hsptNo);
	}

	@Override
	public int createVital(VitalVO vital) {
		return wardDAO.insertVital(vital);
	}

	@Override
	public List<HospitalizationVO> retrieveVitalList(int hsptNo) {
		return wardDAO.selectVitalList(hsptNo);
	}

	@Override
	public int ioduplicateCheck(IntakeOutputVO io) {
		return wardDAO.countIoList(io);
	}

	@Override
	public int ioCreate(IntakeOutputVO io) {
		return wardDAO.createIO(io);
	}

	@Override
	public List<IntakeOutputVO> retrieveIoList(IntakeOutputVO io) {
		return wardDAO.selectIoList(io);
	}

	@Override
	public int intakeCreate(IntakeVO intake) {
		return wardDAO.insertIntake(intake);
	}

	@Override
	public int outputCreate(OutputVO output) {
		return wardDAO.insertOutput(output);
	}
	
	@Override
	public List<IntakeCategoryVO> retrieveIntakeList() {
		return wardDAO.selectIntakeCategory();
	}

	@Override
	public List<OutputCategoryVO> retrieveOutputList() {
		return wardDAO.selectOutputCategory();
	}

	@Override
	public List<DietCategoryVO> retrieveDietCateList() {
		return wardDAO.selectDietCategory();
	}

	@Override
	public int dietCreate(DietRecordVO diet) {
		return wardDAO.insertDiet(diet);
	}

	@Override
	public List<DietRecordVO> retrieveDietList(int hsptNo) {
		return wardDAO.selectDietList(hsptNo);
	}


	


}
