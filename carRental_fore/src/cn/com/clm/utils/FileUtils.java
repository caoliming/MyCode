package cn.com.clm.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import org.springframework.stereotype.Component;

@Component
public class FileUtils {

	/**
	 * 
	 * 单个文件上传
	 * 
	 * @param input　输入流
	 * 
	 * @param fileName 文件原来的名字
	 * 
	 * @param filePath 文件存储的位置
	 * 
	 */

	public static void upFile(InputStream input, String fileName, String filePath) {

		FileOutputStream fos = null;

		BufferedOutputStream bos = null;

		BufferedInputStream bis = null;

		File file = new File(filePath);

		if (!file.exists()) {

			file.mkdirs();

		}

		File f = new File(filePath + "/" + fileName);

		try {

			bis = new BufferedInputStream(input);

			fos = new FileOutputStream(f);

			bos = new BufferedOutputStream(fos);

			byte[] bt = new byte[4096];

			int len;

			while ((len = bis.read(bt)) > 0) {

				bos.write(bt, 0, len);

			}

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			try {

				if (null != bos) {

					bos.close();

					bos = null;
				}

				if (null != fos) {

					fos.close();

					fos = null;

				}

				if (null != input) {

					input.close();

					input = null;

				}

				if (null != bis) {

					bis.close();

					bis = null;

				}

			} catch (Exception e) {

				e.printStackTrace();

			}

		}

	}

}
