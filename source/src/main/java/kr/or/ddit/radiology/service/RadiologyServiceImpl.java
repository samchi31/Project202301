package kr.or.ddit.radiology.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.vo.FilmCateVO;
import kr.or.ddit.commons.vo.PagingVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;
import kr.or.ddit.radiology.dao.FilmRecordDAO;
import kr.or.ddit.radiology.dao.RadiologyWaitingListDAO;

@Service
public class RadiologyServiceImpl implements RadiologyService {

	@Inject
	private FilmRecordDAO filmRecordDAO;
	
	@Inject
	private RadiologyWaitingListDAO radiologyWaitingListDAO;
	
	@Override
	public List<FilmCateVO> retrieveFilmRecordList(Map<String, String> map) {
		return filmRecordDAO.selectFilmList(map);
	}
	
	@Override
	public List<FilmCateVO> retrieveFilmList() {
		return filmRecordDAO.selectFilmList(null);
	}

	@Override
	public FilmCateVO retrieveFilmRecord(String filmCd) {
		FilmCateVO filmRecord = filmRecordDAO.selectPatient(filmCd); 
		return filmRecord;
	}

	
	//대기실 상황
	@Override
	public List<WaitHistoryVO> selectXrayList() {
		return radiologyWaitingListDAO.selectXrayList(null);
	}

	@Override
	public List<WaitHistoryVO> selectMRIList() {
		return radiologyWaitingListDAO.selectMRIList(null);
	}

	@Override
	public List<WaitHistoryVO> selectCTList() {
		return radiologyWaitingListDAO.selectCTList(null);
	}
	
	@Override
	public List<WaitHistoryVO> selectUltraList() {
		return radiologyWaitingListDAO.selectUltraList(null);
	}
	
	@Override
	public List<WaitHistoryVO> selectfilmResultList(String paNo) {
		return filmRecordDAO.selectfilmResultList(paNo);
	}
	
	// 촬영실 전체 대기 리스트 출력
	@Override
	public List<WaitHistoryVO> selectRadiAllList() {
		return radiologyWaitingListDAO.selectRadiAllList(null);
	}

	 //대기히스토리 추가(대기중->촬영중)
	 //map : {rcpNo=202302062, waitstCd=WS001, divCd=DV007}
	@Override
	public int changeWaitListInsert(Map<String, String> map){
		return radiologyWaitingListDAO.changeWaitListInsert(map);
	}

}
