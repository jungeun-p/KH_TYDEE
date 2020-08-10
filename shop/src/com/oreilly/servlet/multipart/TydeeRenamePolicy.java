package com.oreilly.servlet.multipart;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TydeeRenamePolicy implements FileRenamePolicy {
	
	@Override
	public File rename(File f) {
		
		long cureentTime = System.currentTimeMillis();
		SimpleDateFormat simDF = new SimpleDateFormat("yyyyMMddHHmmss");
        int randomNumber = (int)(Math.random()*100000);
        Date nowdate = new Date(cureentTime);
        String uniqueFileName = "" + randomNumber + simDF.format(nowdate);

        String name = f.getName();
        String body = "";
        String ext = "";

        int dot = name.lastIndexOf(".");
        if (dot != -1) {
             body = name.substring(0, dot);
             ext = name.substring(dot);  // includes "."
        }
        else {
             body = name;
             ext = "";
        }
  
        String tempName = uniqueFileName + ext;
        f = new File(f.getParent(), tempName);
        if (createNewFile(f)) {
             return f;
        }

        int count = 0;
        while (!createNewFile(f) && count < 9999) {
             count++;
             String newName = uniqueFileName + "_" + count + ext;
             f = new File(f.getParent(), newName);
        }

        return f;
	}
	private boolean createNewFile(File f) {
		try {
			return f.createNewFile();
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
	}
}
