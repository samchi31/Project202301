package kr.or.ddit.doctor.dao;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Test;

import kr.or.ddit.AbstractTestCase;
import kr.or.ddit.commons.vo.DiagHistoryVO;
import kr.or.ddit.commons.vo.FilmCateVO;
import kr.or.ddit.commons.vo.FilmOrderVO;
import kr.or.ddit.commons.vo.PrescriptionVO;
import kr.or.ddit.commons.vo.SymptomVO;
import kr.or.ddit.commons.vo.TrmChartVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class DoctorDAOTest extends AbstractTestCase{
	@Inject
	DoctorDAO dao;
	
	TrmChartVO trmVO; 
	
	@Inject
	GroupOrderMapper mapper;
	
	@Before
	public void setUp() throws Exception {
		trmVO= new TrmChartVO();
		trmVO.setEmpNo(1);
//		trmVO.setRcpNo(1);
		trmVO.setMediRecord("이 차트는 insert테스트용입니다");
		// 증상
		List<SymptomVO> symptomVOList = new ArrayList<SymptomVO>();
		symptomVOList.add(new SymptomVO());
		symptomVOList.add(new SymptomVO());
		symptomVOList.get(0).setSymCd("L08");
		symptomVOList.get(1).setSymCd("L09");
		trmVO.setSymptomVOList(symptomVOList);
		// 진단
		List<DiagHistoryVO> diagHistoryVOList = new ArrayList<>();
		diagHistoryVOList.add(new DiagHistoryVO());
		diagHistoryVOList.get(0).setDiseaseCd("M00");
		diagHistoryVOList.get(0).setIcdName("화농성관절염");
		diagHistoryVOList.get(0).setOperTf("N");
		diagHistoryVOList.get(0).setPhysiotherapyTf("Y");
		trmVO.setDiagHistoryVOList(diagHistoryVOList);
		// 처방
		List<PrescriptionVO> prescriptionVOList = new ArrayList<>();
		prescriptionVOList.add(new PrescriptionVO());
		prescriptionVOList.get(0).setPreCd("testPre001");
		trmVO.setPrescriptionVOList(prescriptionVOList);
		// 영상촬영오더
		List<FilmOrderVO> filmOrderVOList = new ArrayList<>();
		filmOrderVOList.add(new FilmOrderVO());
		filmOrderVOList.get(0).setFilmCd("MRI");
		trmVO.setFilmOrderVOList(filmOrderVOList);
		
	}

	@Test
	public void testSelectList() {
		log.info("{}",dao.selectDisList());
		log.info("{}",dao.selectSymList());
		log.info("{}",dao.selectRadiList());
//		log.info("{}",dao.selectGOList());
	}

	
	@Test
	public void testInsertTrmChart() {
		// 차트 삽입
		dao.insertTrmChart(trmVO);
		log.info("{}", trmVO);
		// 진단 내역 삽입
		dao.insertDiagList(trmVO);
		// 증상 내역 삽입
		dao.insertSymList(trmVO);
		// 처방 내역 삽입
		dao.insertPreList(trmVO);
		// 촬영 내역 삽입
		dao.insertRadiList(trmVO);
		
	}

	@Test
	public void testSelectTrmChart() {
//		log.info("{}",dao.selectTrmChart(6));
		
//		log.info("{}", dao.selectDiagHist(6));
//		log.info("{}", dao.selectSymHist(6));
//		dao.selectDiagHist(6);
		
	}

	@Test
	public void testSelectGOList() {
//		log.info("{}",mapper.selectGOList());
		log.info("{}",mapper.selectGO("G_T_01"));
	}
	
	@Test
	public void testSelectWaitingList() {
		log.info("{}", dao.selectWaitHistory(1));
	}
	
	@Test
	public void testSelectPatientList() {
//		log.info("{}", dao.selectPaInfo(1));
	}
	
	@Test
	public void testSelectFilmOrder() {
		log.info("{}", dao.selectRadiList());
	}
	
	@Test
	public void testSelectFilmList() {
		log.info("{}", dao.selectFilmResult("TC0241"));
	}

}
