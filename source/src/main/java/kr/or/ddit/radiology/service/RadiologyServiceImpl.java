package kr.or.ddit.radiology.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.commons.dao.AttachDAO;
import kr.or.ddit.commons.vo.DiagHistoryVO;
import kr.or.ddit.commons.vo.FilmAtchDetailVO;
import kr.or.ddit.commons.vo.FilmAtchVO;
import kr.or.ddit.commons.vo.FilmCateVO;
import kr.or.ddit.commons.vo.SymptomVO;
import kr.or.ddit.commons.vo.TrmChartVO;
import kr.or.ddit.commons.vo.WaitHistoryVO;
import kr.or.ddit.radiology.dao.RadiologyDAO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RadiologyServiceImpl implements RadiologyService {

	@Inject
	private AttachDAO attachDAO;
	
	@Inject
	private RadiologyDAO radiologyDAO;
	
	@Value("#{appInfo.saveFiles}")
	private File saveFiles;
	
	public void init() throws IOException{
		log.info("EL로 주입된 청부파일 저장 경로 : {}", saveFiles.getCanonicalPath());
	}
	
	
	
	
	// 환자리스트
	@Override
	public List<FilmCateVO> retrievePatientList() {
		return radiologyDAO.selectPatientList(null);
	}
	
	// 환자 검색
	@Override
	public List<FilmCateVO> retrievePatientSearchList(Map<String, String> map) {
		return radiologyDAO.selectPatientList(map);
	}
	
	// xray 환자 검색
	@Override
	public List<FilmCateVO> retrieveXrayPatientSearchList(Map<String, String> map) {
		return radiologyDAO.selectXrayPatient(map);
	}
	
	// mri 환자 검색
	@Override
	public List<FilmCateVO> retrieveMriPatientSearchList(Map<String, String> map) {
		return radiologyDAO.selectMriPatient(map);
	}
	

	@Override
	public FilmCateVO retrieveFilmRecord(String filmCd) {
		FilmCateVO filmRecord = radiologyDAO.selectPatient(filmCd); 
		return filmRecord;
	}

	
	@Override
	public List<WaitHistoryVO> selectChartList(String paNo) {
		return radiologyDAO.selectChartList(paNo);
	}
	
	// 촬영실 전체 대기 리스트 출력
	@Override
	public List<WaitHistoryVO> selectRadiAllList() {
		return radiologyDAO.selectRadiAllList(null);
	}

	 //대기히스토리 추가(대기중->촬영중)
	 //map : {rcpNo=202302062, waitstCd=WS001, divCd=DV007}
	@Override
	public int modifyWaitListInsert(Map<String, String> map){
		int result = radiologyDAO.modifyWaitListInsert(map);
		
		//map : {trmCd=TC0182, rcpNo=RCP0033, waitstCd=WS001, divCd=DV002, filmCd=MRI}
		result = result + radiologyDAO.changeWaitListFilmOrderInsert(map);
		
		//2이면 모두 ok
		return result;
	}

	/* 
	 * 환자번호에 해당하는 접수번호를 얻고
	 * 접수번호로 해당하는 진료차트 번호 조회
	 * 진단내역, 증상내역, 처방 내역, 촬영 내역을 진료차트 번호로 조회
	 */		
	@Override
	public TrmChartVO retrieveTrmChart(String rcpNo) {

		return radiologyDAO.selectTrmChart(rcpNo);
	}
	
	@Override
	public TrmChartVO retrieveFilmChart(String rcpNo) {
		return radiologyDAO.selectFilmChart(rcpNo);
	}
	

//	// 대기 상태 select
//	@Override
//	public List<WaitHistoryVO> retreiveWaitStatus() {
//		return radiologyDAO.selectWaitStatus();
//	}

	
	// 증상내역 리스트 
	@Override
	public List<SymptomVO> retrieveSymptomList(Map<String, String> map) {
		return radiologyDAO.selectSymptomList(map);
	}
	// 상병내역 리스트
	@Override
	public List<DiagHistoryVO> retrieveDiagList(Map<String, String> map){
		return radiologyDAO.selectDiagList(map);
	}

//	// 대기리스트
//	@Override
//	public List<WaitHistoryVO> retrieveWaitHistory(int empNo) {
//
//		return radiologyDAO.selectWaitHistory(empNo);
//	}

	@Override
	public List<FilmCateVO> retrieveFilmCate() {
		return radiologyDAO.selectFilmCate();
	}

	@Override
	public List<WaitHistoryVO> retreiveWaitStatus() {
		// TODO Auto-generated method stub
		return null;
	}

	//촬영실별 리스트
	@Override
	public List<WaitHistoryVO> selectXrayList() {
		return radiologyDAO.selectXrayList(null);
	}



	@Override
	public int processAttachList(FilmAtchVO filmAtchVO) {
		log.info("filmAtchVO : " + filmAtchVO);
		
//		String uploadFolder 
//			= "D:\\A_TeachingMaterial\\6.JSP_Spring\\workspace\\HurryUp\\src\\main\\webapp\\resources\\saveFiles";
		String uploadFolder=null;
		try {
			uploadFolder = saveFiles.getCanonicalPath();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if(uploadFolder==null) return 0;
		
		
		//make folder 시작(경로 + 연월일) ---------------------------
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("upload Path : " + uploadPath);
		
		//만약 년/월/일 해당 폴더가 없다면 생성
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}
		//make folder 끝 ---------------------------
		
		MultipartFile[] attachFiles = filmAtchVO.getAttachFiles();
		
		//1) FILM_ATCH 테이블에 insert(1행)
		int result = this.radiologyDAO.insertAttach(filmAtchVO);
		
		//2) FILM_ATCH_DETAIL 테이블에 insert(N행) : 껍데기 리스트 준비
		List<FilmAtchDetailVO> filmAtchDetailVOList = new ArrayList<FilmAtchDetailVO>();
		
		//배열로부터 하나씩 파일을 꺼내오자
		for(MultipartFile multipartFile : attachFiles) {
			log.info("-----------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());
			log.info("Upload File MIME : " + multipartFile.getContentType());
			
			//IE 처리 => 경로를 제외한 파일명만 추출 
			//c:\\upload\\image01.jpg => image01.jpg
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			
			log.info("only file name : " + uploadFileName);
			
			//------------- 같은날 같은 이미지를 업로드 시 파일 중복 방지 시작 -------------
			//java.util.UUID => 랜덤값 생성
			UUID uuid = UUID.randomUUID(); //임의의 값을 생성
			//원래의 파일 이름과 구분하기 위해 _를 붙임
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			//------------- 같은날 같은 이미지를 업로드 시 파일 중복 방지 끝 -------------			
			
			//File 객체 설계(복사할 대상 경로 , 파일명)
//			File saveFile = new File(uploadFolder, uploadFileName);
			//uploadPath : D:\\A_TeachingMaterial\\6.JSP_Spring\\workspace\\HurryUp\\src\\main\\webapp\\resources\\saveFiles
			//					\\2022\\07\\22
			File saveFile = new File(uploadPath, uploadFileName);
			
			try {
				//파일 복사가 일어남
				multipartFile.transferTo(saveFile);
				
				FilmAtchDetailVO vo = new FilmAtchDetailVO();
				
				vo.setFiatCd(filmAtchVO.getFiatCd());
				// /2023/02/22/
				vo.setAttStreCours("/" + getFolder().replaceAll("\\\\", "/") + "/");//업로드 경로
				vo.setAttSavename(uploadFileName);//저장명
				vo.setAttFilename(uploadFileName);//파일명
				vo.setAttMime(multipartFile.getContentType());//MIME타입
				Long l = multipartFile.getSize();
				vo.setAttFilesize(Long.valueOf(l).intValue());//파일크기
				vo.setAttFancysize(l.toString());
				vo.setAttDownload(0);
				
				filmAtchDetailVOList.add(vo);
			} catch (IllegalStateException e) {
				log.error(e.getMessage());
			} catch (IOException e) {
				log.error(e.getMessage());
			}//tnd catch
		}//end for
		//filmAtchDetailVOList : [FilmAtchDetailVO(fiatCd=FC001, attNo=null
		//, attStreCours=/2023/02/22/, attSavename=캡처.PNG, attFilename=캡처.PNG
		//, attMime=image/png, attFilesize=73098, attFancysize=73098, attDownload=0)]
		log.info("filmAtchDetailVOList : " + filmAtchDetailVOList);
		
		result = result + this.radiologyDAO.insertAttaches(filmAtchDetailVOList);
		
//		List<AttachVO> attachList = filmAttach.getAttachList();
//		if(attachList == null || attachList.isEmpty())
//			return 0;
//		// 1. metadata 저장 - DB(FILE_ATCH)
//		log.info("filmAttach : {}", filmAttach);
//		log.info("attachList : {}", attachList);
//		// 2. binary 저장 - Middle Tier : (D:\saveFiles)
//		
//		try {
//			for (AttachVO attach : attachList) {
//				attach.saveTo(saveFiles);
//			}
//			int rowcnt = attachDAO.insertAttatches(filmAttach);
//			return rowcnt;
//		}catch (IOException e) {
//			throw new RuntimeException(e);
//		}
		
		return result;
	}
	
	//년/월/일 폴더 생성
	public static String getFolder() {
		//2022-07-22 형식(format) 지정
		//간단한 날짜 형식
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//날짜 객체 생성(java.util패키지)
		Date date = new Date();
		//2022-07-22
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	//용량이 큰 파일을 섬네일 처리를 하지 않으면
	//모바일과 같은 환경에서 많은 데이터를 소비해야 하므로
	//이미지의 경우 특별한 경우가 아니면 섬네일을 제작해야 함.
	//섬네일은 이미지만 가능함.
	//이미지 파일의 판단
	public static boolean checkImageType(File file) {
		/*
		 .jpeg / .jpg(JPEG 이미지)의 MIME 타입 : image/jpeg
		 */
		//MIME 타입을 통해 이미지 여부 확인
		//file.toPath() : 파일 객체를 path객체로 변환
		try {
			String contentType = Files.probeContentType(file.toPath());
			log.info("contentType : " + contentType);
			//MIME 타입 정보가 image로 시작하는지 여부를 return
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		//이 파일이 이미지가 아닐 경우
		return false;
	}
	
	// 진료차트 작성 후 film_order에 film_date update
	@Override
	public int modifyFilmDate(FilmAtchVO filmatchVO){
		int result = processAttachList(filmatchVO);
		result += radiologyDAO.updateFilmDate(filmatchVO);
		
		return result;
	}
	
	@Override
	public List<FilmAtchDetailVO> retrieveFilmAtchDetailVO(String rcpNo) {
		List<FilmAtchDetailVO> filmAtchDetailList = radiologyDAO.selectFilmAtchDetail(rcpNo);
		return filmAtchDetailList;
	}

}
