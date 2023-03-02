package kr.or.ddit.receive.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.vo.ReceiveDetailVO;
import kr.or.ddit.commons.vo.ReceiveVO;
import kr.or.ddit.doctor.dao.DoctorDAO;
import kr.or.ddit.doctor.service.DoctorService;
import kr.or.ddit.receive.dao.ReceiveDAO;

@Service
public class ReceiveServiceImpl implements ReceiveService {
	
	@Inject
	private ReceiveDAO dao;
		
	@Override
	public int createReceive(ReceiveDetailVO receiveDetailVO) {
		
		int rowcnt = 0;
		
		ReceiveVO receive = new ReceiveVO();
//		receive.setRecNo(receiveDetailVO.getRecNo());
		receive.setTrmCd(receiveDetailVO.getTrmCd());
		receive.setRecTotl(receiveDetailVO.getRdTtfe());
		receive.setRecApcd("792420120038219");
		
		rowcnt += dao.insertReceive(receive);
		
		receiveDetailVO.setRecNo(receive.getRecNo());
		rowcnt += createReceiveDetail(receiveDetailVO);
				
		
		return rowcnt;
	}
	
	@Override
	public List<ReceiveVO> retrieveReceiveList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReceiveVO retrieveReceive(int recNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modifyReceive(ReceiveVO receive) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeReceive(int recNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int createReceiveDetail(ReceiveDetailVO receiveDetailVO) {
		return dao.insertReceiveDetail(receiveDetailVO);
	}
}
