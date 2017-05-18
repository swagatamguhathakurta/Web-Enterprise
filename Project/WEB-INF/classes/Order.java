package bean;
import java.util.*;

public class Order implements java.io.Serializable {

	String Fid;
	String Bid;
	String Uid;
	String Fsource; 
	String Fdestination;
	String Fdep;
	String Farrival; 
	String Ftype;
	Float Totcost;
	Integer Fcapacity;
	Integer Passengers;
	String Ddate;  
	String Rdate;
	String Name;
	Integer age; 
	String sex;
	Integer Num; 
			
	public Order (){			
	}
	

	public String getFid() {
		return Fid;
	}

	public void setFid(String Fid) {
		this.Fid = Fid;
	}

	public String getBid() {
		return Bid;
	}

	public void setBid(String Bid) {
		this.Bid = Bid;
	}

	public String getUid() {
		return Uid;
	}

	public void setUid(String Uid) {
		this.Uid = Uid;
	}

	public String getFsource() {
		return Fsource;
	}

	public void setFsource(String Fsource) {
		this.Fsource = Fsource;
	}

	public String getFdestination() {
		return Fdestination;
	}

	public void setFdestination(String Fdestination) {
		this.Fdestination = Fdestination;
	}

	public String getFdep() {
		return Fdep;
	}

	public void setFdep(String Fdep) {
		this.Fdep = Fdep;
	}

	public String getFarrival() {
		return Farrival;
	}

	public void setFarrival(String Farrival) {
		this.Farrival = Farrival;
	}

	public String getFtype() {
		return Ftype;
	}

	public void setFtype(String Ftype) {
		this.Ftype = Ftype;
	}

	public Float getTotcost() {
		return Totcost;
	}

	public void setTotcost(Float Totcost) {
		this.Totcost = Totcost;
	}

	public Integer getFcapacity() {
		return Fcapacity;
	}

	public void setFcapacity(Integer Fcapacity) {
		this.Fcapacity = Fcapacity;
	}

	public Integer getPassengers() {
		return Passengers;
	}

	public void setPassengers(Integer Passengers) {
		this.Passengers = Passengers;
	}

	public String getDdate() {
		return Ddate;
	}

	public void setDdate(String Ddate) {
		this.Ddate = Ddate;
	}

	public String getRdate() {
		return Rdate;
	}

	public void setRdate(String Rdate) {
		this.Rdate = Rdate;
	}

	public String getName() {
		return Name;
	}

	public void setName(String Name) {
		this.Name = Name;
	}

	public Integer getage() {
		return age;
	}

	public void setage(Integer age) {
		this.age = age;
	}

	public String getsex() {
		return sex;
	}

	public void setsex(String sex) {
		this.sex = sex;
	}

	public Integer getNum() {
		return Num;
	}

	public void setNum(Integer Num) {
		this.Num = Num;
	}

	
}
