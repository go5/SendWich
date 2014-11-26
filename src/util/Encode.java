package util;

import java.io.IOException;

import sun.misc.BASE64Encoder;
import sun.misc.BASE64Decoder;

@SuppressWarnings("restriction")
public class Encode {
	
//	public static void main(String[] args) {
//		String str = "김영문";
//		System.out.println("암호화 전:"+str);
//		System.out.println("암호화 후:"+encrypt(str));
//		System.out.println("복호화 후:"+decrypt(encrypt(str)));
//		
//	}

	private static final BASE64Encoder base64Encoder = new BASE64Encoder();
	private static final BASE64Decoder base64Decoder = new BASE64Decoder();


	public static String encrypt(String input) {
		// Base64 인코딩 암호화. 여기서 가져다 쓸겁니다.
		return base64Encoder.encode(input.getBytes());
	}

	public static String decrypt(String input) {
		try {
			// Base64 디코딩
			return new String(base64Decoder.decodeBuffer(input));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
