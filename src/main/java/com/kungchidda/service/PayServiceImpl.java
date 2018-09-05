package com.kungchidda.service;



import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kungchidda.domain.PayVO;
import com.kungchidda.domain.SearchCriteria;
import com.kungchidda.persistence.PayDAO;

@Service
public class PayServiceImpl implements PayService{
	
	private static final Logger logger = LoggerFactory.getLogger(PayServiceImpl.class);
	
	@Inject
	private PayDAO payDAO;
	
	@Transactional
	@Override
	public PayVO payments(PayVO payVO) throws Exception{

		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyyMMddHHmmssSSS", Locale.KOREA );
		Date currentTime = new Date ();
		String dTime = formatter.format ( currentTime );
		logger.info("dTime = " + dTime);
//		System.out.println ( dTime );
		
		int amount = payVO.getAmount();
		
		URL url = null;
		URLConnection connection = null;
		StringBuilder responseBody = new StringBuilder();
		try {
			url = new URL("https://pay.toss.im/api/v1/payments");
			connection = url.openConnection();
			connection.addRequestProperty("Content-Type", "application/json");
			connection.setDoOutput(true);
			connection.setDoInput(true);
			
//			org.json.simple.JSONObject jsonBody = new JSONObject();
			JSONObject jsonBody = new JSONObject();
	//		jsonBody.put("orderNo", "2015072012211");
			jsonBody.put("orderNo", dTime);
			jsonBody.put("amount", amount);
			jsonBody.put("amountTaxFree", 0);
	//		jsonBody.put("productDesc", "토스티셔츠");
			jsonBody.put("productDesc", "LIPMAN 포인트 충전");
			jsonBody.put("apiKey", "sk_test_apikey1234567890");
			jsonBody.put("autoExecute", true);
	//		jsonBody.put("retUrl", "http://YOUR-SITE.COM/ORDER-CHECK");
//			jsonBody.put("resultCallback", "https://lipman.app/pay/execute");
	//		jsonBody.put("retUrl", "https://lipman.app/");
			jsonBody.put("resultCallback", "https://lipman.app/pay/execute");
			jsonBody.put("retUrl", "https://lipman.app/pay/execute");
			
	
			BufferedOutputStream bos = new BufferedOutputStream(connection.getOutputStream());
			bos.write(jsonBody.toJSONString().getBytes());
			bos.flush();
			bos.close();
	
			BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String line = null;
			while ((line = br.readLine()) != null) {
				responseBody.append(line);
			}
			br.close();
		} catch (Exception e) {
			responseBody.append(e);
		}
		
//		System.out.println(responseBody.toString());
		logger.info(responseBody.toString());
		
		String responseStr = responseBody.toString();
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(responseStr);
		JSONObject jsonObj = (JSONObject) obj;

		Long code = (Long) jsonObj.get("code");
		String payToken = (String) jsonObj.get("payToken");
		String checkoutPage = (String) jsonObj.get("checkoutPage");
		payVO.setOrderNo(dTime);
		payVO.setCode(code);
		payVO.setPayToken(payToken);
		payVO.setCheckoutPage(checkoutPage);
		payVO.setProductDesc("LIPMAN 포인트 충전");
		
		logger.info("code = " + code);
		logger.info("payToken = " + payToken);
		logger.info("checkoutPage = " + checkoutPage);
		
		Integer point = 0;
		switch (amount) {
        case 5000 : point = amount/100;
                 break;
        case 10000: point = amount/10000*110;
                 break;
        case 20000: point = amount/10000*111;
                 break;
        case 30000: point = amount/10000*112;
                 break;
        case 50000: point = amount/10000*114;
                 break;
        default: point = amount/100;
                 break;
		}
		payVO.setPoint(point);
		payDAO.payments(payVO);
		return payVO;
	}
	

	@Transactional
	@Override
	public void execute(String orderNo) throws Exception{

		logger.info("orderNo = " + orderNo);
		
		payDAO.execute(orderNo);
	}
	
	@Override
	public List<PayVO> payHistory(PayVO payVO, SearchCriteria cri) throws Exception{
		return payDAO.payHistory(payVO, cri);
	}
	
	@Override
	public int payHistoryCount(PayVO payVO) throws Exception {
		return payDAO.payHistoryCount(payVO);
	}
	
	@Override
	public int totalPoint(PayVO payVO) throws Exception {
		return payDAO.totalPoint(payVO);
	}
	
	@Override
	public int checkUserBuy(Integer bno, String uid) throws Exception {
		int buy = payDAO.checkUserBuy(bno, uid);
		return buy;
	}
	
	@Transactional
	@Override
	public int withdrawExecute(PayVO payVO) throws Exception{
		int totalPoint = payDAO.totalPoint(payVO);
		int withdrawPoint = payVO.getPoint();
		if(totalPoint >= withdrawPoint) {
//			int amount = withdrawPoint * 70;
//			payVO.setAmount(amount);
			payVO.setPoint(-withdrawPoint);
			payVO.setProductDesc("출금 신청");
			payVO.setComplete(1);
			return payDAO.withdrawExecute(payVO);
			
		}
		return -1;
		
	}
	
	@Transactional
	@Override
	public int checkOrderNo(String orderNo) throws Exception{

		logger.info("orderNo = " + orderNo);
		
		return payDAO.checkOrderNo(orderNo);
	}
	
	
}
