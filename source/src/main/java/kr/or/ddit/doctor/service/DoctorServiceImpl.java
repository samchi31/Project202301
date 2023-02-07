package kr.or.ddit.doctor.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.vo.DiagHistoryVO;
import kr.or.ddit.commons.vo.DiseaseVO;
import kr.or.ddit.commons.vo.EmployeeVO;
import kr.or.ddit.commons.vo.FilmCateVO;
import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.commons.vo.PrescriptionVO;
import kr.or.ddit.commons.vo.ReceptionVO;
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
		return dao.selectRadiList();
	}

	@Override
	public List<GroupOrderVO> retrieveGOList() {
		return dao.selectGOList();
	}

	@Override
	public TrmChartVO retrieveTrmChart(int paNo) {
		/* 
		 * 환자번호에 해당하는 접수번호를 얻고
		 * 접수번호로 해당하는 진료차트 번호 조회
		 * 진단내역, 증상내역, 처방 내역을 진료차트 번호로 조회
		 */
		
		
		
		return null;
	}

	@Override
	public List<TrmChartVO> retrieveTrmChartList(int paNo) {
		/*
		 * 환자번호에 해당하는 접수 번호 전체 조회
		 * 접수 번호에 해당하는 진료차트 전체 조회
		 */
		return null;
	}

	@Override
	public List<ReceptionVO> retrieveWaitHistory(String officeCd) {
		/*
		 * 현재 로그인한 의사 사번 코드 조회
		 * 사번코드에 해당하는 진료실 코드 조회
		 * 진료실 코드를 가진 접수 테이블 조회
		 * 접수 번호로 진료 차트 코드 조회
		 * 수납 테이블에 진료 차트 코드로 된 data있는지 확인
		 * 없는 접수 테이블만 조회
		 */
		
		// 현재 로그인한 회원 있다 치고 kkk 
//		EmployeeVO employeeVO = new EmployeeVO();
		String empNo = "1";			
		
		return null;
	}

	@Override
	public PatientVO retrievePaInfo(int paNo) {
		return dao.selectPaInfo(paNo);
	}

	@Override
	public int createTrmChart(TrmChartVO trmChartVO) {
		/*
		 * 진료 차트 작성
		 */
		// 현재 로그인한 의사 사번 넣었다 치고 kkk
		trmChartVO.setEmpNo(1);
		// 현재 클릭한 환자 있다 치고
		trmChartVO.setRcpNo(1);
		trmChartVO.setMediRecord("이 차트는 insert테스트용입니다");
		
		int rowcnt = dao.insertTrmChart(trmChartVO);
		
		// 증상 내역 잇다 치고
		List<SymptomVO> symptomVOList = new ArrayList<SymptomVO>();
		symptomVOList.add(new SymptomVO());
		symptomVOList.get(1).setSymCd("L08");
		trmChartVO.setSymptomVOList(symptomVOList);
		createSymList(trmChartVO);
		
		// 진단 내역 잇다 치고
		List<DiagHistoryVO> diagHistoryVOList = new ArrayList<>();
		diagHistoryVOList.add(new DiagHistoryVO());
		
		return 0;
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
		return 0;
	}
}
