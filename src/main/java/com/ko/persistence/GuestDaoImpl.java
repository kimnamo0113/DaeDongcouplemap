package com.ko.persistence;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ko.domain.Guest;

@Repository
public class GuestDaoImpl implements GuestDao{

	private static final String namespace = "com.ko.mapper.GuestMapper";
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public Guest selectById(String gId) {
		return sqlSession.selectOne(namespace+".selectById",gId);
	}

	@Override
	public int selectIdCheck(String gId) {
		return sqlSession.selectOne(namespace+".selectIdCheck", gId);
	}

	@Override
	public int selectEmailCheck(String gEmail) {
		return sqlSession.selectOne(namespace+".selectEmailCheck", gEmail);
	}

	@Override
	public void insertJoinDefault(Guest guest) throws Exception {
		sqlSession.insert(namespace+".insertJoinDefault",guest);
		send_mail(guest, "join");
	}

	@Override
	public void updateJoinPlus(Guest guest) {
		sqlSession.insert(namespace+".updateJoinPlus",guest);
	}

	@Override
	public void send_mail(Guest guest, String div) throws Exception {
		// Mail Server 설정
				String charSet = "utf-8";
				String hostSMTP = "smtp.naver.com";
				String hostSMTPid = "klnver@naver.com";
				String hostSMTPpwd = "knh9482!";

				// 보내는 사람 EMail, 제목, 내용
				String fromEmail = "klnver@naver.com";
				String fromName = "Daedong Couple Map";
				String subject = "";
				String msg = "";
				
				if(div.equals("join")) {
					// 회원가입 메일 내용
					subject = "대동연애지도 회원가입 인증 메일입니다.";
					msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
					msg += "<h3 style='color: blue;'>";
					msg += guest.getgId() + "님 회원가입을 환영합니다.</h3>";
					msg += "<div style='font-size: 130%'>";
					msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
					msg += "<form method='post' action='http://localhost:8080/daedong/member/loginCertification'>";
					msg += "<input type='hidden' name='gEmail' value='" + guest.getgEmail() + "'>";
					msg += "<input type='hidden' name='gCertification' value='"+guest.getgCertification()+"'>";
					msg += "<input type='submit' value='인증'></form><br/></div>";
				}else if(div.equals("find_pw")) {
					subject = "대동연애지도 임시 비밀번호 입니다.";
					msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
					msg += "<h3 style='color: blue;'>";
					msg += guest.getgId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
					msg += "<p>임시 비밀번호 : ";
					msg += guest.getgPassword() + "</p></div>";
				}
				// 받는 사람 E-Mail 주소
				String mail = guest.getgEmail();
				try {
					HtmlEmail email = new HtmlEmail();
					email.setDebug(true);
					email.setCharset(charSet);
					email.setSSL(true);
					email.setHostName(hostSMTP);
					email.setSmtpPort(587);

					email.setAuthentication(hostSMTPid, hostSMTPpwd);
					email.setTLS(true);
					email.addTo(mail, charSet);
					email.setFrom(fromEmail, fromName, charSet);
					email.setSubject(subject);
					email.setHtmlMsg(msg);
					email.send();
				} catch (Exception e) {
					System.out.println("메일발송 실패 : " + e);
				}
	}

	@Override
	public void updatePassWord(Guest guest) throws Exception {
		sqlSession.update(namespace+".updatePassWord",guest);
	}

	@Override
	public Guest selectByEmail(String gEmail) throws Exception{
		return sqlSession.selectOne(namespace+".selectByEmail",gEmail);
	}

	@Override
	public Guest selectByEmailAndPassword(String gEmail, String gPassword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("gEmail", gEmail);
		map.put("gPassword", gPassword);
		return sqlSession.selectOne(namespace+".selectByEmailAndPassword",map);
	}

	@Override
	public void updateCertification(Guest guest, String check) {
		Map<String, Object> map = new HashMap<>();
		map.put("guest", guest);
		map.put("check", check);
		sqlSession.update(namespace+".updateCertification",map);
	}

	@Override
	public void updateCertification(Guest guest) throws Exception {
		sqlSession.update(namespace+".updateCertification",guest);
	}

	@Override
	public void updateGuestImg(String savedName) {
		sqlSession.update(namespace+".updateGuestImg",savedName);
	}

	@Override
	public void updateAll(Guest guest) {
		sqlSession.update(namespace+".updateAll",guest);
	}
	

}
