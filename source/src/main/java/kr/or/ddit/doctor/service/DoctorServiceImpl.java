package kr.or.ddit.doctor.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.vo.DiseaseVO;
import kr.or.ddit.commons.vo.FilmCateVO;
import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.commons.vo.PrescriptionVO;
import kr.or.ddit.commons.vo.SymptomVO;
import kr.or.ddit.commons.vo.TrmChartVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;
import kr.or.ddit.doctor.dao.DoctorDAO;
import kr.or.ddit.doctor.vo.GroupOrderVO;

@Service
public class DoctorServiceImpl implements DoctorService{

	@Inject
	DoctorDAO dao;
	
	@Override
	public List<DiseaseVO> retrieveDisList() {
		return dao.selectDisList();
	}

	@Override
	public List<SymptomVO> retrieveSymList() {
		return dao.selectSymList();
	}

	@Override
	public List<FilmCateVO> retrieveRadiList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GroupOrderVO> retrieveGOList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TrmChartVO retrieveTrmChart(int paNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TrmChartVO> retrieveTrmChartList(int paNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<WaitHistoryVO> retrieveWaitHistory(int docNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PatientVO> retrievePaInfo(int paNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int createTrmChart(TrmChartVO trmChartVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int createSymList(List<SymptomVO> symptomVOList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int createDisList(List<DiseaseVO> diseaseVOList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int createPreList(List<PrescriptionVO> prescriptionVOList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int createRadiList(List<FilmCateVO> filmCateVOList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int createWaitHistory(WaitHistoryVO waitHistoryVO) {
		// TODO Auto-generated method stub
		return 0;
	}
}
