package model;

import com.mongodb.MongoException;
import com.mongodb.WriteConcern;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBCursor;
import com.mongodb.ServerAddress;
import com.mongodb.*;
import java.util.*;

import bean.ReviewClass;

public class MongoDbDataStoreUtilities 
{
	static DBCollection myReviews; 
	
	public static void getConnection() 
	{ 
	
	MongoClient mongo;
	mongo = new MongoClient("localhost", 27017);
	
	DB db = mongo.getDB("FlightReviews");
	myReviews= db.getCollection("myReviews");
	}


public static HashMap<String, ArrayList<ReviewClass>> selectReview()
{ 
	 HashMap<String, ArrayList<ReviewClass>> reviews=new HashMap<String, ArrayList<ReviewClass>>(); 
 	try
		{ 
			getConnection();
			DBCursor cursor = myReviews.find();
			while (cursor.hasNext())
			{	
				BasicDBObject obj = (BasicDBObject) cursor.next();
				
				ArrayList<ReviewClass> arr = new ArrayList<ReviewClass>(); 
				ReviewClass review =new ReviewClass(obj.getString("Fid"),obj.getString("Fsource"),obj.getString("Fdestination"),obj.getString("Ftype"),obj.getString("UserID"),obj.getInt("ReviewRating"),obj.getString("ReviewDate"),obj.getString("ReviewText")); 
				arr.add(review);	
				reviews.put(obj.getString("Fid"), arr); 
			}
		}
		catch(Exception e){}

		return  reviews; 
} 


public static void insertReview(String Fid,String Fsource,String Fdestination,String Ftype,String UserID,int ReviewRating, String ReviewDate, String ReviewText) 
{ 
getConnection(); 
BasicDBObject doc = new BasicDBObject("title", "myReviews"). 
append("Fid", Fid). 
append("Fsource", Fsource). 
append("Fdestination", Fdestination). 
//append("Fdep", Fdep). 
//append("Farrival", Farrival).
append("Ftype", Ftype).  
//append("Fcapacity", Fcapacity).
append("UserID", UserID).
//append("UserAge", UserAge).
//append("UserGender", UserGender).
//append("UserOccupation", UserOccupation).
append("ReviewRating", ReviewRating).
append("ReviewDate", ReviewDate).
append("ReviewText", ReviewText); 

myReviews.insert(doc);


}

public static void storeReview(String Fid,String Fsource,String Fdestination,String Ftype,String UserID,int ReviewRating, String ReviewDate, String ReviewText)  { 
		
		HashMap<String, ArrayList<ReviewClass>> reviews= new HashMap<String, ArrayList<ReviewClass>>(); 
		try {
			reviews=MongoDbDataStoreUtilities.selectReview();
			} 
		catch(Exception e) { } 
		
		if(!reviews.containsKey(Fid))
		{ ArrayList<ReviewClass> arr = new ArrayList<ReviewClass>();
		
	  reviews.put(Fid, arr); 
	  } 
	ArrayList<ReviewClass> listReview = reviews.get(Fid); 
	ReviewClass review = new ReviewClass(Fid,Fsource,Fdestination,Ftype,UserID,ReviewRating,ReviewDate, ReviewText);
	listReview.add(review); 
	try { 
	System.out.println("1");
		MongoDbDataStoreUtilities.insertReview(Fid,Fsource,Fdestination,Ftype,UserID,ReviewRating,ReviewDate, ReviewText);
		} 
	catch(Exception e) {  } 
	} 
	

}
