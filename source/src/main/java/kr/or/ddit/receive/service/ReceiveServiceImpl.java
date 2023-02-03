package kr.or.ddit.receive.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.vo.ReceiveVO;
import kr.or.ddit.receive.dao.ReceiveDAO;

@Service
public class ReceiveServiceImpl implements ReceiveServicve {
	
	@Inject
	private ReceiveDAO dao;
	
	@Override
	public int createReceive(ReceiveVO receive) {
		int rowcnt = dao.insertReceive(receive);
		return rowcnt;
	}

	@Override
	public void retrieveReceiveList(ReceiveVO receive) {
		// TODO Auto-generated method stub

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

}
