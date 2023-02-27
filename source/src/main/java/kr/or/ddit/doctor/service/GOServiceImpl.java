package kr.or.ddit.doctor.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.doctor.dao.GroupOrderMapper;
import kr.or.ddit.doctor.vo.GroupOrderVO;

@Service
public class GOServiceImpl implements GOService {
	
	@Inject
	GroupOrderMapper mapper;
	
	@Override
	public List<GroupOrderVO> retrieveGOList() {
		return mapper.selectGOList();
	}
	
	@Override
	public GroupOrderVO retrieveGO(String goCd) {
		return mapper.selectGO(goCd);
	}

	@Override
	public int createGO(GroupOrderVO groupOrderVO) {
		int rowcnt = mapper.insertGO(groupOrderVO);
		rowcnt += createGODisList(groupOrderVO);
		rowcnt += createGOPreList(groupOrderVO);
		rowcnt += createGOSymList(groupOrderVO);
		return rowcnt;
	}
	
	@Override
	public int createGODisList(GroupOrderVO groupOrderVO) {
		int rowcnt = 0;
		if(groupOrderVO.getGoDiseaseVOList() != null && groupOrderVO.getGoDiseaseVOList().size() > 0) {
			rowcnt = mapper.insertGODisList(groupOrderVO);
		}
		return rowcnt;
	}
	
	@Override
	public int createGOPreList(GroupOrderVO groupOrderVO) {
		int rowcnt = 0;
		if(groupOrderVO.getGoPrescriptionVOList() != null && groupOrderVO.getGoPrescriptionVOList().size() > 0) {
			rowcnt = mapper.insertGOPreList(groupOrderVO);
		}
		return rowcnt;
	}
	
	@Override
	public int createGOSymList(GroupOrderVO groupOrderVO) {
		int rowcnt = 0;
		if(groupOrderVO.getGoSymptomVOList() != null && groupOrderVO.getGoSymptomVOList().size() > 0) {
			rowcnt = mapper.insertGOSymList(groupOrderVO);
		}
		return rowcnt;
	}

	@Override
	public int modifyGO(GroupOrderVO groupOrderVO) {
		int rowcnt = mapper.updateGO(groupOrderVO);
		
		String prevGoCd = groupOrderVO.getPrevGoCd();
		rowcnt += mapper.deleteGODisList(prevGoCd);
		rowcnt += mapper.deleteGOPreList(prevGoCd);
		rowcnt += mapper.deleteGOSymList(prevGoCd);
		
		rowcnt += createGODisList(groupOrderVO);
		rowcnt += createGOPreList(groupOrderVO);
		rowcnt += createGOSymList(groupOrderVO);
		
		return rowcnt;
	}

	@Override
	public int removeGO(String goCd) {
		
		int rowcnt = mapper.deleteGO(goCd);
		rowcnt += mapper.deleteGODisList(goCd);
		rowcnt += mapper.deleteGOPreList(goCd);
		rowcnt += mapper.deleteGOSymList(goCd);
		
		return rowcnt;
	}

}
