package com.kungchidda.utils;

import org.junit.Test;

import com.kungchidda.util.PasswordEncoding;
import com.kungchidda.util.SHAPasswordEncoder;

public class SHAPasswordEncoderTest {
	@Test
	public void test() {
		String password = "1234";
		SHAPasswordEncoder shaPasswordEncoder = new SHAPasswordEncoder(512);
		shaPasswordEncoder.setEncodeHashAsBase64(true);
		PasswordEncoding passwordEncoding = new PasswordEncoding(shaPasswordEncoder);
		System.out.println("SHA 암호화: " + passwordEncoding.encode(password));
		System.out.println("SHA 비교: " + passwordEncoding.matches(password, passwordEncoding.encode(password)));
	}

}
