package com.phonegap.plugins.imageFilter;
import org.json.JSONArray;
import org.json.JSONObject;
import android.util.Log;
import java.io.*;
import android.net.Uri;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.*;
import android.os.*;

// CHANGE THIS TO YOUR PROJECT
import com.drewdahlman.ImageFilter.*;

public class Filters{
	
	public String none(JSONArray optionsArr) {
		
		// SET FILE PATH
		/*
		Be sure to change your storage directory here it is set to ImageFilter
		*/
		String filePath = "";
		File path = new File(Environment.getExternalStorageDirectory()+"/ImageFilter/");
		
		// TMP.jpg is where we store our temporary version of the image
       	File NBBfile = new File(path, "tmp.jpg");
        
        // CREATE FOLDERS IF NEEDED
        try{
        	boolean success = false;
        	
        	if(!path.exists()){
	            success = path.mkdir();
	        }
	        if (!success){ 
	            Log.d("NONE","Folder not created.");
	        }
	        else{
	            Log.d("NONE","Folder created!");
	        }
        }
        catch (Exception e){
        	e.printStackTrace();
        }
        // GET URL TO IMAGE
        	final JSONObject options = optionsArr.optJSONObject(0);
			String imageURL = options.optString("image");
			
			// APPLY FILTER
			/*
			This is where we will apply our filters
			*/
			
			
			// create image bitmap
			Bitmap bmp = BitmapFactory.decodeFile(imageURL);
			if(bmp.getHeight() >= 655 || bmp.getWidth()>=655){
				bmp = Bitmap.createBitmap(bmp,0,0,655,655);
			}
			else {
				bmp = Bitmap.createBitmap(bmp);
			}
			
			// create image canvas
			Canvas canvas = new Canvas(bmp);
			Bitmap none = Bitmap.createBitmap(bmp);
			canvas.drawBitmap(none,0,0,null);
			
			// SAVE IMAGE
			try {
				// OUTPUT STREAM
		       	FileOutputStream out = new FileOutputStream(NBBfile);
		       	none.compress(Bitmap.CompressFormat.JPEG, 100, out);
		       	
		       	// GET FILE PATH
		       	Uri uri = Uri.fromFile(NBBfile);
		       	filePath = uri.toString();
		       	
		       	// RETURN FILE PATH
		       	return filePath;
		       	
			} catch (Exception e) {
				e.printStackTrace();
			}
        return filePath;
	}
	public String stark(JSONArray optionsArr) {
		
		// SET FILE PATH
		String filePath = "";
		File path = new File(Environment.getExternalStorageDirectory()+"/NewBelgium/");
       	File NBBfile = new File(path, "tmp.jpg");
        
        // CREATE FOLDERS IF NEEDED
        try{
        	boolean success = false;
        	
        	if(!path.exists()){
	            success = path.mkdir();
	        }
	        if (!success){ 
	            Log.d("NONE","Folder not created.");
	        }
	        else{
	            Log.d("NONE","Folder created!");
	        }
        	
        }
        catch (Exception e){
        	e.printStackTrace();
        }
        
        // GET URL TO IMAGE
        	final JSONObject options = optionsArr.optJSONObject(0);
			String imageURL = options.optString("image");
			
			// APPLY FILTER
			
			
			// create image bitmap
			Bitmap bmp = BitmapFactory.decodeFile(imageURL);
			if(bmp.getHeight() >= 655 || bmp.getWidth()>=655){
				bmp = Bitmap.createBitmap(bmp,0,0,655,655);
			}
			else {
				bmp = Bitmap.createBitmap(bmp);
			}
			
			// create image canvas
			Bitmap none = Bitmap.createBitmap(bmp);
			
			Canvas canvas = new Canvas(none);
			canvas.drawBitmap(none,0,0,null);
			
			/*// BORDER
			Context context = MyApplication.getAppContext();
			Bitmap border = BitmapFactory.decodeResource(context.getResources(),R.drawable.painter);
			
			
			canvas.drawBitmap(border,0,0,null);*/
			
			Paint spaint = new Paint();
		    ColorMatrix scm = new ColorMatrix();
		
		    scm.setSaturation(0);
			final float m[] = scm.getArray();
			final float c = 1;
			scm.set(new float[] { 
			        m[ 0] * c, m[ 1] * c, m[ 2] * c, m[ 3] * c, m[ 4] * c + 15, 
			        m[ 5] * c, m[ 6] * c, m[ 7] * c, m[ 8] * c, m[ 9] * c + 8, 
			        m[10] * c, m[11] * c, m[12] * c, m[13] * c, m[14] * c + 10, 
			        m[15]    , m[16]    , m[17]    , m[18]    , m[19] }); 
		
		    spaint.setColorFilter(new ColorMatrixColorFilter(scm));
		    Matrix smatrix = new Matrix();
		    canvas.drawBitmap(none, smatrix, spaint);
		    
		    Paint paint = new Paint();
		    ColorMatrix cm = new ColorMatrix();
		
		    cm.set(new float[] { 
		            1, 0, 0, 0, -90, 
		            0, 1, 0, 0, -90, 
		            0, 0, 1, 0, -90, 
		            0, 0, 0, 1, 0 });
		    paint.setColorFilter(new ColorMatrixColorFilter(cm));
		    Matrix matrix = new Matrix();
		    canvas.drawBitmap(none, matrix, paint);
			
			
			// SAVE IMAGE
			try {
			
				// OUTPUT STREAM
		       	FileOutputStream out = new FileOutputStream(NBBfile);
		       	none.compress(Bitmap.CompressFormat.JPEG, 100, out);
		       	
		       	// GET FILE PATH
		       	Uri uri = Uri.fromFile(NBBfile);
		       	filePath = uri.toString();
		       	
		       	// RETURN FILE PATH
		       	return filePath;
		       	
		       	
			} catch (Exception e) {
				e.printStackTrace();
			}
        return filePath;
	}
	public String sunnyside(JSONArray optionsArr) {
		
		// SET FILE PATH
		String filePath = "";
		File path = new File(Environment.getExternalStorageDirectory()+"/NewBelgium/");
       	File NBBfile = new File(path, "tmp.jpg");
        
        // CREATE FOLDERS IF NEEDED
        try{
        	boolean success = false;
        	
        	if(!path.exists()){
	            success = path.mkdir();
	        }
	        if (!success){ 
	            Log.d("NONE","Folder not created.");
	        }
	        else{
	            Log.d("NONE","Folder created!");
	        }
        	
        	
        }
        catch (Exception e){
        	e.printStackTrace();
        }
        // GET URL TO IMAGE
        	final JSONObject options = optionsArr.optJSONObject(0);
			String imageURL = options.optString("image");
			
			// APPLY FILTER
			
			
			// create image bitmap
			Bitmap bmp = BitmapFactory.decodeFile(imageURL);
			if(bmp.getHeight() >= 655 || bmp.getWidth()>=655){
				bmp = Bitmap.createBitmap(bmp,0,0,655,655);
			}
			else {
				bmp = Bitmap.createBitmap(bmp);
			}
			
			// create image canvas
			Bitmap none = Bitmap.createBitmap(bmp);
			
			Canvas canvas = new Canvas(none);
			canvas.drawBitmap(none,0,0,null);
			
			
			/*Bitmap color = boost(none,1,1);
		    canvas.drawBitmap(color,0,0,null);
		    
		    Bitmap color2 = boost(none,2,1);
		    canvas.drawBitmap(color2,0,0,null);*/
		    Paint paint = new Paint();
		    ColorMatrix cm = new ColorMatrix();
		
		    cm.set(new float[] { 
		            1, 0, 0, 0, 10, 
		            0, 1, 0, 0, 10, 
		            0, 0, 1, 0, -60, 
		            0, 0, 0, 1, 0 });
		    paint.setColorFilter(new ColorMatrixColorFilter(cm));
		    Matrix matrix = new Matrix();
		    canvas.drawBitmap(none, matrix, paint);
		    
		    // BORDER
		    
			Bitmap border = BitmapFactory.decodeResource(App.context.getResources(),R.drawable.painter);
			Bitmap scaledBorder = Bitmap.createScaledBitmap(border,655,655,false);
			
			canvas.drawBitmap(scaledBorder,0,0,null);
			
			
			// SAVE IMAGE
			try {
			
				// OUTPUT STREAM
		       	FileOutputStream out = new FileOutputStream(NBBfile);
		       	none.compress(Bitmap.CompressFormat.JPEG, 100, out);
		       	
		       	// GET FILE PATH
		       	Uri uri = Uri.fromFile(NBBfile);
		       	filePath = uri.toString();
		       	
		       	// RETURN FILE PATH
		       	return filePath;
		       	
		       	
			} catch (Exception e) {
				e.printStackTrace();
			}
        return filePath;
	}
	public String pinhole(JSONArray optionsArr) {
		
		// SET FILE PATH
		String filePath = "";
		File path = new File(Environment.getExternalStorageDirectory()+"/NewBelgium/");
       	File NBBfile = new File(path, "tmp.jpg");
        
        // CREATE FOLDERS IF NEEDED
        try{
        	boolean success = false;
        	
        	if(!path.exists()){
	            success = path.mkdir();
	        }
	        if (!success){ 
	            Log.d("NONE","Folder not created.");
	        }
	        else{
	            Log.d("NONE","Folder created!");
	        }
        	
        	
        }
        catch (Exception e){
        	e.printStackTrace();
        }
        // GET URL TO IMAGE
        	final JSONObject options = optionsArr.optJSONObject(0);
			String imageURL = options.optString("image");
			
			// APPLY FILTER
			
			
			// create image bitmap
			Bitmap bmp = BitmapFactory.decodeFile(imageURL);
			if(bmp.getHeight() >= 655 || bmp.getWidth()>=655){
				bmp = Bitmap.createBitmap(bmp,0,0,655,655);
			}
			else {
				bmp = Bitmap.createBitmap(bmp);
			}
			
			// create image canvas
			Bitmap none = Bitmap.createBitmap(bmp);
			
			Canvas canvas = new Canvas(none);
			canvas.drawBitmap(none,0,0,null);
			
			
		    
		    // BORDER
		    
			Bitmap border = BitmapFactory.decodeResource(App.context.getResources(),R.drawable.vignette3);
			Bitmap scaledBorder = Bitmap.createScaledBitmap(border,655,655,false);
			
			canvas.drawBitmap(scaledBorder,0,0,null);
			
			
			// SAVE IMAGE
			try {
			
				// OUTPUT STREAM
		       	FileOutputStream out = new FileOutputStream(NBBfile);
		       	none.compress(Bitmap.CompressFormat.JPEG, 100, out);
		       	
		       	// GET FILE PATH
		       	Uri uri = Uri.fromFile(NBBfile);
		       	filePath = uri.toString();
		       	
		       	// RETURN FILE PATH
		       	return filePath;
		       	
		       	
			} catch (Exception e) {
				e.printStackTrace();
			}
        return filePath;
	}
	public String vintage(JSONArray optionsArr) {
		
		// SET FILE PATH
		String filePath = "";
		File path = new File(Environment.getExternalStorageDirectory()+"/NewBelgium/");
       	File NBBfile = new File(path, "tmp.jpg");
        
        // CREATE FOLDERS IF NEEDED
        try{
        	boolean success = false;
        	
        	if(!path.exists()){
	            success = path.mkdir();
	        }
	        if (!success){ 
	            Log.d("NONE","Folder not created.");
	        }
	        else{
	            Log.d("NONE","Folder created!");
	        }
        	
        	
        }
        catch (Exception e){
        	e.printStackTrace();
        }
        // GET URL TO IMAGE
        	final JSONObject options = optionsArr.optJSONObject(0);
			String imageURL = options.optString("image");
			
			// APPLY FILTER
			
			
			// create image bitmap
			Bitmap bmp = BitmapFactory.decodeFile(imageURL);
			if(bmp.getHeight() >= 655 || bmp.getWidth()>=655){
				bmp = Bitmap.createBitmap(bmp,0,0,655,655);
			}
			else {
				bmp = Bitmap.createBitmap(bmp);
			}
			
			// create image canvas
			Bitmap none = Bitmap.createBitmap(bmp);
			
			Canvas canvas = new Canvas(none);
			canvas.drawBitmap(none,0,0,null);
			
			Paint paint = new Paint();
		    ColorMatrix cm = new ColorMatrix();
		
		    cm.set(new float[] { 
		            1, 0, 0, 0, -60, 
		            0, 1, 0, 0, -60, 
		            0, 0, 1, 0, -60, 
		            0, 0, 0, 1, 0 });
		    paint.setColorFilter(new ColorMatrixColorFilter(cm));
		    Matrix matrix = new Matrix();
		    canvas.drawBitmap(none, matrix, paint);
		    
		    // BORDER
		    
			Bitmap border = BitmapFactory.decodeResource(App.context.getResources(),R.drawable.blackframe);
			Bitmap scaledBorder = Bitmap.createScaledBitmap(border,655,655,false);
			
			canvas.drawBitmap(scaledBorder,0,0,null);
			
			
			// SAVE IMAGE
			try {
			
				// OUTPUT STREAM
		       	FileOutputStream out = new FileOutputStream(NBBfile);
		       	none.compress(Bitmap.CompressFormat.JPEG, 100, out);
		       	
		       	// GET FILE PATH
		       	Uri uri = Uri.fromFile(NBBfile);
		       	filePath = uri.toString();
		       	
		       	// RETURN FILE PATH
		       	return filePath;
		       	
		       	
			} catch (Exception e) {
				e.printStackTrace();
			}
        return filePath;
	}
	public String worn(JSONArray optionsArr) {
		
		// SET FILE PATH
		String filePath = "";
		File path = new File(Environment.getExternalStorageDirectory()+"/NewBelgium/");
       	File NBBfile = new File(path, "tmp.jpg");
        
        // CREATE FOLDERS IF NEEDED
        try{
        	boolean success = false;
        	
        	if(!path.exists()){
	            success = path.mkdir();
	        }
	        if (!success){ 
	            Log.d("NONE","Folder not created.");
	        }
	        else{
	            Log.d("NONE","Folder created!");
	        }
        	
        	
        }
        catch (Exception e){
        	e.printStackTrace();
        }
        // GET URL TO IMAGE
        	final JSONObject options = optionsArr.optJSONObject(0);
			String imageURL = options.optString("image");
			
			// APPLY FILTER
			
			
			// create image bitmap
			Bitmap bmp = BitmapFactory.decodeFile(imageURL);
			if(bmp.getHeight() >= 655 || bmp.getWidth()>=655){
				bmp = Bitmap.createBitmap(bmp,0,0,655,655);
			}
			else {
				bmp = Bitmap.createBitmap(bmp);
			}
			
			// create image canvas
			Bitmap none = Bitmap.createBitmap(bmp);
			
			Canvas canvas = new Canvas(none);
			canvas.drawBitmap(none,0,0,null);
			
			Paint paint = new Paint();
		    ColorMatrix cm = new ColorMatrix();
		
		    cm.set(new float[] { 
		            1, 0, 0, 0, -60, 
		            0, 1, 0, 0, -60, 
		            0, 0, 1, 0, -90, 
		            0, 0, 0, 1, 0 });
		    paint.setColorFilter(new ColorMatrixColorFilter(cm));
		    Matrix matrix = new Matrix();
		    canvas.drawBitmap(none, matrix, paint);
		    
		    // BORDER
		    
			Bitmap border = BitmapFactory.decodeResource(App.context.getResources(),R.drawable.vignette4);
			Bitmap scaledBorder = Bitmap.createScaledBitmap(border,655,655,false);
			
			canvas.drawBitmap(scaledBorder,0,0,null);
			
			
			// SAVE IMAGE
			try {
			
				// OUTPUT STREAM
		       	FileOutputStream out = new FileOutputStream(NBBfile);
		       	none.compress(Bitmap.CompressFormat.JPEG, 100, out);
		       	
		       	// GET FILE PATH
		       	Uri uri = Uri.fromFile(NBBfile);
		       	filePath = uri.toString();
		       	
		       	// RETURN FILE PATH
		       	return filePath;
		       	
		       	
			} catch (Exception e) {
				e.printStackTrace();
			}
        return filePath;
	}
}

