package kr.or.ddit.pt.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.vo.PtAssinmentVO;
import kr.or.ddit.pt.dao.PtAssinmentDAO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ptAssinmentServiceImpl implements ptAssinmentService {
	
	@Inject
	PtAssinmentDAO dao;

	@Override
	public List<PtAssinmentVO> ptAssinmentVOList(PtAssinmentVO ptAssinmentList) {
		List<PtAssinmentVO> ptList = dao.selectPtAssinmentList(ptAssinmentList);
		log.info("ptList : {}",ptList);
		return ptList;
	}

}
