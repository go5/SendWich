package util;

import java.io.IOException;

import sun.misc.BASE64Encoder;
import sun.misc.BASE64Decoder;

@SuppressWarnings("restriction")
public class Encode {
	
//	public static void main(String[] args) {
//		String str = "�迵��";
//		System.out.println("��ȣȭ ��:"+str);
//		System.out.println("��ȣȭ ��:"+encrypt(str));
//		System.out.println("��ȣȭ ��:"+decrypt(encrypt(str)));
//		
//	}

	private static final BASE64Encoder base64Encoder = new BASE64Encoder();
	private static final BASE64Decoder base64Decoder = new BASE64Decoder();


	public static String encrypt(String input) {
		// Base64 ���ڵ� ��ȣȭ. ���⼭ ������ ���̴ϴ�.
		return base64Encoder.encode(input.getBytes());
	}

	public static String decrypt(String input) {
		try {
			// Base64 ���ڵ�
			return new String(base64Decoder.decodeBuffer(input));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
