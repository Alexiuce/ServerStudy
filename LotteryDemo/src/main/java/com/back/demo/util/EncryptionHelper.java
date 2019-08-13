/**  
* <p>Title: EncryptionHelper.java</p>
* <p>Description: </p>  
* <p>Copyright: Copyright (c) 2017</p>  
* <p>Company: www.jxsw.com</p>  
* @author zhangpp  
* @date 2019年7月11日  
* @version 1.0  
*/  

package com.back.demo.util;

import org.apache.commons.codec.binary.Base64;

import javax.crypto.Cipher;
import java.io.BufferedReader;
import java.io.FileReader;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

/**  
* <p>Title: EncryptionHelper</p>  
* <p>Description: </p>  
* @author zhangpp  
* @date 2019年7月11日  
*/
public class EncryptionHelper {
	
	/** 
     * 从字符串中加载公钥 
     *  
     * @param publicKey 公钥数据字符串 
     * @throws Exception 加载公钥时产生的异常 
     */  
    public static RSAPublicKey loadPublicKey(String publicKey,String encryptType) throws Exception{  
        try {  
            byte[] buffer = Base64.decodeBase64(publicKey);  
            KeyFactory keyFactory = KeyFactory.getInstance(encryptType);  
            X509EncodedKeySpec keySpec = new X509EncodedKeySpec(buffer);  
            return (RSAPublicKey) keyFactory.generatePublic(keySpec);  
        }  catch (Exception ex) {  
            throw ex;  
        }  
    }  
    
    
    /**
     * 从字符串中加载私钥
     * 
     * @param privateKey 私钥数据字符串
     * @throws Exception 加载私钥时产生的异常 
     */
    public static RSAPrivateKey loadPrivateKey(String privateKey,String encryptType) throws Exception 
    {
    	 try {  
             byte[] buffer = Base64.decodeBase64(privateKey);   
             PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(buffer);  
             KeyFactory keyFactory = KeyFactory.getInstance(encryptType);  
             return (RSAPrivateKey) keyFactory.generatePrivate(keySpec);  
         } catch (Exception ex) {  
             throw ex;  
         }  
    }
    
    /** 
     * 公钥加密 
     * @param publicKey 公钥 
     * @param body 明文数据 
     * @param encoding 编码类型
     * @throws Exception 
     */  
    public static String RSA_GetEncrypt(RSAPublicKey publicKey,String encryptType,String body,String encoding)
    		throws Exception {
    	try{
    		if(encoding==null || encoding == "") encoding="utf-8";
    		return RSA_GetEncrypt(publicKey,encryptType,body.getBytes(encoding));
    	}catch(Exception ex) {
    		throw ex;
    	}
    }
    
    /** 
     * 公钥加密 
     *  
     * @param publicKey 公钥 
     * @param bodyBytes 明文数据的字节数组
     * @throws Exception 
     */  
    public static String RSA_GetEncrypt(RSAPublicKey publicKey, String encryptType,byte[] bodyBytes) 
    		throws Exception {
    	try{
    		// 使用默认RSA  
    		Cipher cipher = Cipher.getInstance(encryptType);  
    		cipher.init(Cipher.ENCRYPT_MODE, publicKey);
    		byte[] output = cipher.doFinal(bodyBytes);
    		return (new String(Base64.encodeBase64(output)));
    	}catch(Exception ex) {
    		throw ex;
    	}
    }
    
    
    /** 
     * 私钥解密 
     * @param privateKey 私钥 
     * @param cipherData 密文数据  
     */  
    public static String RSA_GetDencrypt(RSAPrivateKey privateKey,String encryptType, byte[] bodyBytes,String encoding)  
            throws Exception {
        try {  
            // 使用默认RSA  
        	Cipher cipher = Cipher.getInstance(encryptType);  
            cipher.init(Cipher.DECRYPT_MODE, privateKey);  
            byte[] output = cipher.doFinal(bodyBytes);
            return new String(output,encoding);
        } catch (Exception ex) {  
            throw ex;  
        }  
    }  
    
    /** 
     * 私钥解密
     *  
     * @param privateKey 私钥 
     * @param cipherData 密文数据  
     */  
    public static String RSA_GetDencrypt(RSAPrivateKey privateKey,String encryptType,String body,String encoding) 
    		throws Exception {
    	try {
    		if(encoding==null || encoding == "") encoding="utf-8";
    		byte[] bodyBytes =Base64.decodeBase64(body);
    		return RSA_GetDencrypt(privateKey,encryptType,bodyBytes,encoding);
    	}catch (Exception ex) {  
            throw ex;  
        } 
    }
    
    /** 
     * RSA私钥签名
     * @param privateKey 私钥 
     * @param body 签名数据
     * @param encoding 字符集编码 
     * @param HashType 计算Hash值时使用的算法类型 
     */  
     public static String RSA_GetSign(String privateKey,String body, String encryptType,String encoding,String HashType)throws Exception
     {  
         try   
         {  
        	 if(encoding==null || encoding == "") encoding="utf-8";
        	 if(HashType==null || HashType == "") HashType="SHA1WithRSA";
        	 PKCS8EncodedKeySpec PKCS8Service = new PKCS8EncodedKeySpec(Base64.decodeBase64(privateKey));  
             KeyFactory keyFactory = KeyFactory.getInstance(encryptType);  
             PrivateKey key = keyFactory.generatePrivate(PKCS8Service);
             java.security.Signature signature = java.security.Signature.getInstance(HashType);  
             signature.initSign(key);  
             signature.update(body.getBytes(encoding));
             byte[] bytes = signature.sign();
             return Base64.encodeBase64String(bytes);  
         }  
         catch (Exception ex)   
         {  
             throw ex;
         } 
     }  

     /**
      * RSA公钥验签
      * @param publicKey 公钥
      * @param body 签名明文数据
      * @param signedBody 签名密文数据
      * @param encoding 字符集编码
      * @param HashType 计算Hash值时使用的算法类型 
      */
     public static Boolean RSA_GetVerifySign(String publicKey,String encryptType,String body,String signedBody,String encoding,String HashType) 
    		 throws Exception {
    	 try   
         {  
    		 if(encoding==null || encoding == "") encoding="utf-8";
        	 if(HashType==null || HashType == "") HashType="MD5WithRSA";
             KeyFactory keyFactory = KeyFactory.getInstance(encryptType);  
             byte[] keyBytes = Base64.decodeBase64(publicKey);  
             PublicKey Key = keyFactory.generatePublic(new X509EncodedKeySpec(keyBytes));  
             java.security.Signature signature = java.security.Signature.getInstance(HashType);  
             signature.initVerify(Key);  
             signature.update(body.getBytes(encoding));
             return signature.verify(Base64.decodeBase64(signedBody)); 
         }   
         catch (Exception ex)   
         {  
             throw ex; 
         }
     }
     
     /**
      * 获取私钥文件
      * <p>Title: getPrivateKey</p>  
      * <p>Description: </p>  
      * @return
      */
     public static String getPrivateKey(String path) 
     {
    	try {
    		 BufferedReader br = new BufferedReader(new FileReader(path));  
             String readLine = null;  
             StringBuilder sb = new StringBuilder();  
             while ((readLine = br.readLine()) != null) {  
                 sb.append(readLine);  
             }  
             br.close();  
             return sb.toString().replace(
        			 "-----BEGIN PRIVATE KEY-----", "")
     			    .replace("-----END PRIVATE KEY-----", "");  
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    	return null;
     }
     
     /**
      * 获取私钥文件
      * <p>Title: getPrivateKey</p>  
      * <p>Description: </p>  
      * @return
      */
     public static String getPublicKey(String path) 
     {
    	try {
    		 BufferedReader br = new BufferedReader(new FileReader(path));  
             String readLine = null;  
             StringBuilder sb = new StringBuilder();  
             while ((readLine = br.readLine()) != null) {  
                 sb.append(readLine);  
             }  
             br.close();  
             return sb.toString().replace(
        			 "-----BEGIN PUBLIC KEY-----", "")
     			    .replace("-----END PUBLIC KEY-----", "");  
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    	return null;
     }
     
     public static void main(String[] args) throws Exception 
     {
    	 
//    	 String publicKey = getPublicKey("d:/encrypt");
//    	 System.out.println(publicKey);
//    	 
//    	 String privateKey = getPrivateKey("d:/encrypt");
//    	 System.out.println(privateKey);
//    	 
//    	 String signedBody = RSA_GetSign(privateKey,"c43aa490c71994ff6b63a9b587507a61","RSA","utf-8","SHA1WithRSA");
//    	 System.err.println(signedBody);
//     
//    	 
//    	 boolean b = RSA_GetVerifySign(publicKey,"RSA","c43aa490c71994ff6b63a9b587507a61",signedBody,"utf-8","SHA1WithRSA");
//    	 System.out.println(b);
    	 
    	 System.out.println(Base64.decodeBase64("11"));
     }
     

}
