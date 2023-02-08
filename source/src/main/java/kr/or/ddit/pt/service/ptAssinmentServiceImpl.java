package kr.or.ddit.pt.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.commons.vo.PtAssinmentVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.pt.dao.PtAssinmentDAO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ptAssinmentServiceImpl implements ptAssinmentService {
	
	@Inject
	PtAssinmentDAO ptdao;
	
	
	@Override
	public List<PtAssinmentVO> ptAssinmentVOList(PtAssinmentVO ptAssinmentList) {
		List<PtAssinmentVO> ptList = ptdao.selectPtAssinmentList(ptAssinmentList);
		log.info("ptList : {}",ptList);
		return ptList;
	}

	@Override
	public List<PtAssinmentVO> ptBedList() {
		return ptdao.ptBedList();
	}

	//	물리치료실 Bed에 상태를 변경한다
	@Override
	public int ptBedFull(PtAssinmentVO ptAssinmentVO) {
		int rowcnt = ptdao.ptBedFull(ptAssinmentVO);
//		ptAssinmentVOList(ptdao.ptBedList());
//		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		
		return rowcnt;
	}
	
	/**
	 * 환자 조회 (search)
	 */
	@Override
	public List<PatientVO> searchPatienList(Map<String, String> map) {
		return ptdao.selectPatientList(map);
	}
}
