package kr.or.ddit.pt.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.vo.PatientVO;
import kr.or.ddit.commons.vo.PtAssinmentVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;
import kr.or.ddit.pt.dao.PtAssinmentDAO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PtAssinmentServiceImpl implements PtAssinmentService {
	
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

	/**
	 * 물리치료실 Bed 상태 변경/ 배드 채우기
	 * Update
	 */
	@Override
	public int ptBedFull(PtAssinmentVO ptAssinmentVO) {
		int rowcnt = ptdao.ptBedFull(ptAssinmentVO);
//		ptAssinmentVOList(ptdao.ptBedList());
//		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		
		return rowcnt;
	}
	
	/**
	 * 물리치료실 Bed 상태 변경/배드 비우기
	 * Update
	 */
	@Override
	public int ptBedEmpty(PtAssinmentVO ptAssinmentVO) {
		int rowcnt = ptdao.ptBedEmpty(ptAssinmentVO);
		return rowcnt;
	}
	
	/**
	 * 환자 치료 상태를 대기 히스토리에 추가
	 * (대기중->치료중 Insert)
	 * @param map
	 * @return
	 */
	@Override
	public int cureListChangeInsert(WaitHistoryVO waitHistoryVO) {
		return ptdao.cureListChangeInsert(waitHistoryVO);
	}
	
	/**
	 * 환자 치료 상태를 대기 히스토리에 추가
	 * (치료중->완료 Insert)
	 * @param map
	 * @return
	 */
	@Override
	public int completionChangeInsert(WaitHistoryVO waitHistoryVO) {
		return ptdao.completionChangeInsert(waitHistoryVO);
	}
	
	/**
	 * 환자 조회 (search)
	 */
	@Override
	public List<PatientVO> searchPatienList(Map<String, String> map) {
		return ptdao.selectPatientList(map);
	}


}
