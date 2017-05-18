package bean;
import java.io.*;

public class CustomerDetails implements Serializable {

public String uname;
public String pass;
public String fname;
public String lname;
public String email;
public String utype;

public CustomerDetails(String fname,String lname,String email,String name,String Pass,String utype)
{
	this.fname=fname;
	this.lname=lname;
	this.email=email;
	this.uname=name;
	this.pass=Pass;
	this.utype=utype;
	
}
		
		

		
}



