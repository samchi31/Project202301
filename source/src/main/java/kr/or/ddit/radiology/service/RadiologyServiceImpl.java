package kr.or.ddit.radiology.service;

import java.util.List;

import javax.inject.Inject;

import kr.or.ddit.commons.vo.FilmCateVO;
import kr.or.ddit.commons.vo.PagingVO;
import kr.or.ddit.radiology.dao.RadiologyDAO;

public class RadiologyServiceImpl implements RadiologyService {

	@Inject
	private RadiologyDAO radiologyDAO;
	
	@Override
	public List<FilmCateVO> retrieveFilmRecodeList(PagingVO<FilmCateVO> pagingVO) {
		pagingVO.setTotalRecord(radiologyDAO.selectTotalRecord(pagingVO));
		
		List<FilmCateVO> filmRecodeList = radiologyDAO.selectFilmList(pagingVO);
		
		pagingVO.setDataList(filmRecodeList);
		
		return filmRecodeList;
	}

	@Override
	public FilmCateVO retrieveFilmRecode(String filmCd) {
		
		FilmCateVO filmRecode = radiologyDAO.selectPatient(filmCd); 
		
		return filmRecode;
	}

}
