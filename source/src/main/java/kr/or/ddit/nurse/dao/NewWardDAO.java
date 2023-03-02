package kr.or.ddit.nurse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.vo.DiagHistoryVO;
import kr.or.ddit.commons.vo.OperationInfomationVO;

@Mapper
public interface NewWardDAO {

	public List<OperationInfomationVO> selectPatientSearch(Map<String, String> map);

	public List<DiagHistoryVO> selectDiagnosisList(Map<String, String> map);

}
