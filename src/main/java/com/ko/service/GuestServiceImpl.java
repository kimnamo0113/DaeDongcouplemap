package com.ko.service;

import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.ko.domain.Guest;
import com.ko.persistence.GuestDao;

@Service
public class GuestServiceImpl implements GuestService {

	@Autowired
	GuestDao dao;

	@Override
	public Guest selectById(String gId) {
		return dao.selectById(gId);
	}

	@Override
	public int selectIdCheck(String gId) {
		return dao.selectIdCheck(gId);
	}

	@Override
	public int selectEmailCheck(String gEmail) {
		return dao.selectEmailCheck(gEmail);
	}

	@Override
	public void insertJoinDefault(Guest guest) throws Exception {
		guest.setgCertification(create_key());
		dao.insertJoinDefault(guest);
	}

	@Override
	public void updateJoinPlus(Guest guest) {
		dao.updateJoinPlus(guest);
	}

	@Override
	public String create_key() {
		String key = "";
		Random rd = new Random();

		for (int i = 0; i < 8; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}

	// 비밀번호 찾기
	@Override
	public void find_pw(HttpServletResponse response, Guest guest) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		// PrintWriter out = response.getWriter();
		// 아이디가 없으면
		System.out.println(guest);
		guest = dao.selectByEmail(guest.getgEmail());
		System.out.println(guest);
		if (guest.getgId() == null) {
			// out.print("이메일이 존재하지 않습니다.");
			// out.close();
		}
		/*
		 * // 가입에 사용한 이메일이 아니면 else
		 * if(!guest.getgEmail().equals(dao.login(member.getId()).getEmail())) {
		 * out.print("잘못된 이메일 입니다."); out.close(); }
		 */
		else {

			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			guest.setgTempPassword(pw);
			System.out.println(guest);
			// 비밀번호 변경
			dao.updateTempPassWord(guest);
			// 비밀번호 변경 메일 발송
			dao.send_mail(guest, "find_pw");

			// out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			// out.close();
		}
	}
	
	//로그인
	@Override
	public Guest selectByEmailAndPassword(String gEmail, String gPassword) {
		return dao.selectByEmailAndPassword(gEmail, gPassword);
	}
	//임시로그인

	@Override
	public void updateCertification(Guest guest, String check) {
		System.out.println(guest);
		System.out.println(check);
		dao.updateCertification(guest, check);
	}
}
