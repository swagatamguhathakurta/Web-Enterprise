package bean;
import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;


	
	
	public class ReviewClass implements Serializable {
		
		
		 public String Fid;
         public String Fsource;
         public String Fdestination;
         //public String Fdep;
         
		 //public String Farrival;
         public String Ftype;
         //public float Fcost_E;
	     //public float Fcost_B;
         //public int Fcapacity;
		
		
		public String UserID;
		//public int UserAge;
		//public String UserGender;
		//public String UserOccupation;
		public int ReviewRating;
		public String ReviewDate;
		public String ReviewText;
	
	    
	public ReviewClass (String Fid,String Fsource,String Fdestination,String Ftype,String UserID,int ReviewRating, String ReviewDate, String ReviewText) {
			this.Fid=Fid;
			this.Fsource=Fsource;
		    this.Fdestination=Fdestination;
			//this.Fdep=Fdep;
			
			//this.Farrival=Farrival;
			this.Ftype=Ftype;
			//this.Fcost_E=Fcost_E;
			//this.Fcost_B=Fcost_B;
			//this.Fcapacity=Fcapacity;
			
			this.UserID=UserID;
			//this.UserAge=UserAge;
			//this.UserGender=UserGender;
			//this.UserOccupation=UserOccupation;
			
			this.ReviewRating=ReviewRating;
			this.ReviewDate=ReviewDate;
			this.ReviewText=ReviewText;
						
		}
		

   public ReviewClass(){
          }

   public String getFid(){
	   return Fid;
   }
    
	public void setFid(String Fid){
	   this.Fid = Fid;
   }
   public String getFsource(){
	   return Fsource;
   }
    public void setFsource(String Fsource){
	   this.Fsource = Fsource;
   }
    public String getFdestination(){
	   return Fdestination;
   }
    public void setFdestination(String Fdestination){
	   this.Fdestination = Fdestination;
   }
    /*public String getFdep(){
	   return Fdep;
   }
    public void setFdep(String Fdep){
	   this.Fdep = Fdep;
   }
    public String getFarrival(){
	   return Farrival;
   }
    public void setFarrival(String Farrival){
	   this.Farrival = Farrival;
   }*/
    public String getFtype(){
	   return Ftype;
   }
    public void setFtype(String Ftype){
	   this.Ftype = Ftype;
   }
  
   // public int getFcapacity(){
	  //  return Fcapacity;
   // }
   //  public void setFcapacity(Integer Fcapacity){
	  //  this.Fcapacity = Fcapacity;
   // }

		
		public void setUserID(String UserID) {
			this.UserID = UserID;
		}
		
		
		// public void setUserAge(int UserAge) {
		// 	this.UserAge = UserAge;
		// }
		
		// public void setUserGender(String UserGender) {
		// 	this.UserGender = UserGender;
		// }
		
		// public void setUserOccupation(String UserOccupation) {
		// 	this.UserOccupation = UserOccupation;
		// }
		
		public void setReviewRating(int ReviewRating) {
			this.ReviewRating = ReviewRating;
		}
		
		public void setReviewDate(String ReviewDate) {
			this.ReviewDate = ReviewDate;
		}
		
		public void setReviewText(String ReviewText) {
			this.ReviewText = ReviewText;
		}
		
		
	public String getUserID() {
		return UserID;
	}
		
	
	// public int getUserAge() {
	// 	return UserAge;
	// }
	
	// public String getUserGender() {
	// 	return UserGender;
	// }
	
	
	// public String getUserOccupation() {
	// 	return UserOccupation;
	// }
	
	public int getReviewRating() {
		return ReviewRating;
	}
	
	
	public String getReviewDate() {
		return ReviewDate;
	}
	
	public String getReviewText() {
		return ReviewText;
	}
	
	
	}
