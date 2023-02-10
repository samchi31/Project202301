package kr.or.ddit.doctor.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.vo.DiagHistoryVO;
import kr.or.ddit.commons.vo.DiseaseVO;
import kr.or.ddit.commons.vo.DivisionTreatVO;
import kr.or.ddit.commons.vo.EmployeeVO;
import kr.or.ddit.commons.vo.FilmCateVO;
import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.commons.vo.PrescriptionVO;
import kr.or.ddit.commons.vo.ReceptionVO;
import kr.or.ddit.commons.vo.SymptomVO;
import kr.or.ddit.commons.vo.TrmChartVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;
import kr.or.ddit.commons.vo.WaitStatusVO;
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
		return dao.selectRadiList();
	}

	@Override
	public List<GroupOrderVO> retrieveGOList() {
		return dao.selectGOList();
	}

	@Override
	public TrmChartVO retrieveTrmChart(int rcpNo) {
		/* 
		 * 환자번호에 해당하는 접수번호를 얻고
		 * 접수번호로 해당하는 진료차트 번호 조회
		 * 진단내역, 증상내역, 처방 내역, 촬영 내역을 진료차트 번호로 조회
		 */		
		return dao.selectTrmChart(rcpNo);
	}

	@Override
	public List<TrmChartVO> retrieveTrmChartList(int paNo) {
		/*
		 * 접수 번호에 해당하는 진료차트 전체 조회
		 */
		return dao.selectTrmChartList(paNo);
	}

	@Override
	public List<WaitHistoryVO> retrieveWaitHistory(int empNo) {
		/*
		 * 현재 waiting_history에서
		 * 의사번호에 해당하는 진료실로 된 
		 * 접수 번호 별로 순번이 가장 큰
		 */
		
		return dao.selectWaitHistory(empNo);
	}

	@Override
	public PatientVO retrievePaInfo(int paNo) {
		return dao.selectPaInfo(paNo);
	}

	@Override
	public int createTrmChart(TrmChartVO trmChartVO) {
		/*
		 * 진료 차트 작성
		 * 
		 * 접수번호, 사번 있는지 확인
		 */
		// 차트 삽입
		int cnt = dao.insertTrmChart(trmChartVO);
		// 진단 내역 삽입
		cnt += dao.insertDiagList(trmChartVO);
		// 증상 내역 삽입
		cnt += dao.insertSymList(trmChartVO);
		// 처방 내역 삽입
		cnt += dao.insertPreList(trmChartVO);
		// 촬영 내역 삽입
		cnt += dao.insertRadiList(trmChartVO);
		
		return cnt;
	}

	@Override
	public int createSymList(TrmChartVO trmChartVO) {
		/*
		 * 작성된 진료차트 코드로 증상내역 작성
		 */
		return 0;
	}

	@Override
	public int createDisList(List<DiagHistoryVO> diagHistoryVOList) {
		/*
		 * 작성된 진료차트 코드로 진단내역 작성
		 */
		return 0;
	}

	@Override
	public int createPreList(List<PrescriptionVO> prescriptionVOList) {
		/*
		 * 작성된 진료차트 코드로 처방내역 작성
		 */
		return 0;
	}

	@Override
	public int createRadiList(List<FilmCateVO> filmCateVOList) {
		/*
		 * 작성된 진료차트 코드로 영상촬영오더 내역 작성
		 */
		return 0;
	}

	@Override
	public int createWaitHistory(WaitHistoryVO waitHistoryVO) {
		/*
		 * 대기 상태 변경 시 대기 히스토리 추가
		 */
		return dao.insertWaitHistory(waitHistoryVO);
	}

	@Override
	public List<WaitStatusVO> retreiveWaitStatus() {
		return dao.selectWaitStatus();
	}

	@Override
	public List<DivisionTreatVO> retreiveDvTr() {
		return dao.selectDvTr();
	}
}
