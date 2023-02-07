package kr.or.ddit.radiology.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.vo.FilmCateVO;
import kr.or.ddit.commons.vo.PagingVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;
import kr.or.ddit.radiology.dao.FilmRecodeDAO;
import kr.or.ddit.radiology.dao.RadiologyWaitingListDAO;

@Service
public class RadiologyServiceImpl implements RadiologyService {

	@Inject
	private FilmRecodeDAO filmRecodeDAO;
	
	@Inject
	private RadiologyWaitingListDAO radiologyWaitingListDAO;
	
	@Override
	public List<FilmCateVO> retrieveFilmRecodeList(Map<String, String> map) {
		return filmRecodeDAO.selectFilmList(map);
	}
	
	@Override
	public List<FilmCateVO> retrieveFilmList() {
		return filmRecodeDAO.selectFilmList(null);
	}

	@Override
	public FilmCateVO retrieveFilmRecode(String filmCd) {
		FilmCateVO filmRecode = filmRecodeDAO.selectPatient(filmCd); 
		return filmRecode;
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
	
	// 촬영실 전체 대기 리스트 출력
	@Override
	public List<WaitHistoryVO> selectRadiAllList() {
		return radiologyWaitingListDAO.selectRadiAllList(null);
	}
}
