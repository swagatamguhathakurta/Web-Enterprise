package bean;
import java.io.*;

public class Flight implements Serializable {
    
    public String Fid;
    public String Fsource;
    public String Fdestination;
    public String Fdep;
    public String Farrival;
    public String Ftype;
    public float Fcost_E;
	public float Fcost_B;
    public int Fcapacity;

    public Flight(String Fid, String Fsource, String Fdestination, String Fdep, String Farrival, String Ftype, float Fcost_E,float Fcost_B,int Fcapacity) {
        this.Fid = Fid;
        this.Fsource = Fsource;
        this.Fdestination = Fdestination;
        this.Fdep = Fdep;
        this.Farrival = Farrival;
        this.Ftype = Ftype;
        this.Fcost_E = Fcost_E;
		this.Fcost_B = Fcost_B;
        this.Fcapacity = Fcapacity;
    }
      
    public Flight(){
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
    public String getFdep(){
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
   }
    public String getFtype(){
	   return Ftype;
   }
    public void setFtype(String Ftype){
	   this.Ftype = Ftype;
   }
   public Float getFcost_E(){
	   return Fcost_E;
   }
    public void setFcost_E(Float Fcost_E){
	   this.Fcost_E = Fcost_E;
   }
    public Float getFcost_B(){
	   return Fcost_B;
   }
    public void setFcost_B(Float Fcost_B){
	   this.Fcost_B = Fcost_B;
   }
   public int getFcapacity(){
	   return Fcapacity;
   }
    public void setFcapacity(Integer Fcapacity){
	   this.Fcapacity = Fcapacity;
   }
}