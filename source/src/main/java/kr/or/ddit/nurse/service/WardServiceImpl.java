package kr.or.ddit.nurse.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.vo.HospitalizationVO;
import kr.or.ddit.commons.vo.IntakeOutputVO;
import kr.or.ddit.commons.vo.VitalVO;
import kr.or.ddit.nurse.dao.WardDAO;
import kr.or.ddit.nurse.vo.NrecVO;
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

	


}
