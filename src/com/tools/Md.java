package com.tools;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Md {
	public static void main(String[] args) {
		System.out.println(md5_16("cmklink"));
	}
	public static String md5_32(String str)
	{
	     MessageDigest md;
	     StringBuffer sb = new StringBuffer();
	     try {
	          md = MessageDigest.getInstance("MD5");
	          md.update(str.getBytes());
	          byte[] data = md.digest();
	          int index;
	          for(byte b : data) {
	               index = b;
	               if(index < 0) index += 256;
	               if(index < 16) sb.append("0");
	               sb.append(Integer.toHexString(index));
	          }
	     } catch (NoSuchAlgorithmException e) {
	      e.printStackTrace();
	     }
	     return sb.toString();
	 }
	public static String md5_16(String str) {
		   String result = md5_32(str);
		   return result.substring(3, 18);
		}
}
