package kr.or.ddit.receive.service;

import kr.or.ddit.commons.vo.ReceiveVO;

public interface ReceiveServicve {
	public int createReceive(ReceiveVO receive);
	public void retrieveReceiveList(ReceiveVO receive);
	public ReceiveVO retrieveReceive(int recNo);
	public int modifyReceive(ReceiveVO receive);
	public int removeReceive(int recNo);
}
