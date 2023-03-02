package kr.or.ddit.commons.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.service.ProofService;
import kr.or.ddit.commons.vo.PrescriptionVO;
import kr.or.ddit.commons.vo.TrmChartVO;
import kr.or.ddit.receiption.vo.ReceiptionVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/commons")
@Controller
public class ProofController {
	
	@Inject
	private ProofService service;
	
	@GetMapping("/proofView")
	public String ProofView() {
		return "commons/proofView";
	}
	
	@ResponseBody
    @PostMapping("/patientSearch")
    public List<ReceiptionVO> patientSearch(@RequestBody Map<String, String> map
    		) {
    	
    	List<ReceiptionVO> searchPatientList = service.searchPatientList(map);
    	return searchPatientList;
    }
	
	@ResponseBody
	@PostMapping("/loadTrmChart")
	public List<TrmChartVO> loadTrmChart(@RequestBody Map<String, String> map){
		List<TrmChartVO> trmList = service.retrieveTrmChart(map);
		
		return trmList;
	}
	
	@GetMapping("/documentSelect")
	public void proofPrint(@RequestParam("trmCd") String trmCd, @RequestParam("proofCate") String proofCate, HttpServletRequest request, HttpServletResponse response) {
		
		List<TrmChartVO> list = service.retrieveProof(trmCd);
		
		//처방전
		if(proofCate.equals("prescription")) {
			String inputFilePath = "/resources/excel/prescription.xlsx";
			
			try {
				List<PrescriptionVO> PrescriptionList = service.retrievePrescription(trmCd);
				
				request.setCharacterEncoding("UTF-8");
				String formPath = request.getServletContext().getRealPath(inputFilePath);
							
				File inputFile = new File(formPath);
				InputStream fis = new FileInputStream(inputFile);
				XSSFWorkbook form_wb = new XSSFWorkbook(fis);
				XSSFSheet form_sheet = form_wb.getSheetAt(0);
				String str = "";
				//교부번호
				form_sheet.getRow(6).createCell(2).setCellValue(trmCd);
				//성명
				form_sheet.getRow(7).createCell(4).setCellValue(list.get(0).getPatientVO().getPaName());
				//주민등록번호
				form_sheet.getRow(9).createCell(4).setCellValue(list.get(0).getPatientVO().getPaReg()+"-*******");
				for(int i=0; list.get(0).getDiagHistoryVOList().size()>i ; i++) {
					str += list.get(0).getDiagHistoryVOList().get(i).getDiseaseCd()+"\n";
				}
				//질병분류번호
				form_sheet.getRow(11).createCell(2).setCellValue(str);
				//처방의료인의성명
				form_sheet.getRow(11).createCell(6).setCellValue(list.get(0).getEmployeeVO().getEmpNm());
				
				//처방약품의 명칭, 투약량, 투약횟수, 투약일수
				int i = 21;
				for(PrescriptionVO vo : PrescriptionList) {
					form_sheet.getRow(i).createCell(1).setCellValue(vo.getPreDetail());
					form_sheet.getRow(i).createCell(6).setCellValue(vo.getPreTotal());
					form_sheet.getRow(i).createCell(7).setCellValue(vo.getPreNt());
					form_sheet.getRow(i).createCell(8).setCellValue(vo.getPreTotal());
					i++;
				}
				
				String filename = "prescription.xlsx";
				response.setContentType("ms-vnd/excel;charset=UTF-8");
				response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
				
				form_wb.write(response.getOutputStream());
				form_wb.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		//진단서
		if(proofCate.equals("certificate")) {
			String inputFilePath = "/resources/excel/certificate.xlsx";
			
			try {
				request.setCharacterEncoding("UTF-8");
				
				String formPath = request.getServletContext().getRealPath(inputFilePath);
				
				File inputFile = new File(formPath);
				InputStream fis = new FileInputStream(inputFile);
				XSSFWorkbook form_wb = new XSSFWorkbook(fis);
				XSSFSheet form_sheet = form_wb.getSheetAt(0);
				
				form_sheet.getRow(6).createCell(3).setCellValue(list.get(0).getPaName());
				
				String gender = "";
				String st = list.get(0).getPatientVO().getPaSex();
				
				if(st.equals("M")) {
					gender = "남";
					form_sheet.getRow(6).createCell(6).setCellValue(gender);
				}
				
				if(st.equals("F")) {
					gender = "여";
					form_sheet.getRow(6).createCell(6).setCellValue(gender);
				}
				// 생년월일
				form_sheet.getRow(6).createCell(9).setCellValue(list.get(0).getPatientVO().getPaReg());
				// 환자의 주소
				form_sheet.getRow(8).createCell(3).setCellValue(list.get(0).getPatientVO().getPaAdd1() + list.get(0).getPatientVO().getPaAdd2());
				// 전화번호
				form_sheet.getRow(8).createCell(10).setCellValue(list.get(0).getPatientVO().getPaHp());
				// 병명
				String icdName = "";
				// 상병코드
				String diseaseCd = "";
				for(int i=0; list.get(0).getDiagHistoryVOList().size()>i; i++) {
					icdName += list.get(0).getDiagHistoryVOList().get(i).getIcdName()+"\n";
					diseaseCd += list.get(0).getDiagHistoryVOList().get(i).getDiseaseCd()+"\n";
				}
				// 병명입력
				form_sheet.getRow(10).createCell(3).setCellValue(icdName);
				// 상병코드 입력
				form_sheet.getRow(13).createCell(9).setCellValue(diseaseCd);
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//				Date Disdt = list.get(0).getTrmDt();
				String Disdt = list.get(0).getTrmDt();
//				String CtfDisdt = sdf.format(Disdt);
				
				String Diadt = list.get(0).getTrmDt();
//				String CtfDiadt = sdf.format(Diadt);
				
				// 발병일
				form_sheet.getRow(22).createCell(3).setCellValue(Disdt);
				// 진단일
				form_sheet.getRow(22).createCell(9).setCellValue(Diadt);
				// 담당의 소견
				form_sheet.getRow(24).createCell(3).setCellValue(list.get(0).getMediRecord());
				
				LocalDate now = LocalDate.now();
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				String Date = now.format(formatter);
				
				form_sheet.getRow(44).createCell(5).setCellValue(Date);
				form_sheet.getRow(49).createCell(7).setCellValue(list.get(0).getEmployeeVO().getEmpNm());
				
				String filename = "certificate.xlsx";
				response.setContentType("ms-vnd/excel;charset=UTF-8");
				response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
				
				form_wb.write(response.getOutputStream());
				form_wb.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}
	
}
