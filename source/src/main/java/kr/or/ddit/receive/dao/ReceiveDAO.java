package kr.or.ddit.receive.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.vo.ReceiveVO;

@Mapper
public interface ReceiveDAO {
	public int insertReceive(ReceiveVO receive);
	public ReceiveVO selectReceive(int recNo);
	public List<ReceiveVO> selectReceiveList(ReceiveVO receive);
	public int updateReceive(ReceiveVO receive);
	public int deleteReceive(int recNo);
}
