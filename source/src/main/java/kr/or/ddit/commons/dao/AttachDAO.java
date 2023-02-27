package kr.or.ddit.commons.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.vo.AttachVO;

@Mapper
public interface AttachDAO {
	public int insertAttatches(Object object);
	public List<AttachVO> selectAtattList(int attNo);
	public <T> int deleteAttachs(T vo);
	public <T> int updateAttachs(T vo);
	public <T> int deleteAttatch(String fadCd);
}
