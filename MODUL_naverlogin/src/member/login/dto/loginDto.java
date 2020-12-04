package member.login.dto;

public class loginDto {
	
	private int myno;
	private String myemail;
	private String mypw;
	private String myname;
	private String sns_id;
	private String sns_type;
	
	public loginDto() {
		
	}
	
	public loginDto(int myno, String myemail, String mypw, String myname, String sns_id, String sns_type) {
		this.myno = myno;
		this.myemail = myemail;
		this.mypw = mypw;
		this.myname = myname;
		this.sns_id = sns_id;
		this.sns_type = sns_type;
	}
	
	public loginDto(String myemail, String mypw) {
		this.myemail = myemail;
		this.mypw = mypw;
	}
	//signres
	public loginDto(String myemail, String mypw, String myname) {
		this.myemail = myemail;
		this.mypw = mypw;
		this.myname = myname;
	}
	
	//snssignres
	public loginDto(String myemail, String mypw, String myname, String sns_id) {
		this.myemail = myemail;
		this.mypw = mypw;
		this.myname = myname;
		this.sns_id = sns_id;
	}

	public int getMyno() {
		return myno;
	}

	public void setMyno(int myno) {
		this.myno = myno;
	}

	public String getMyemail() {
		return myemail;
	}

	public void setMyemail(String myemail) {
		this.myemail = myemail;
	}

	public String getMypw() {
		return mypw;
	}

	public void setMypw(String mypw) {
		this.mypw = mypw;
	}

	public String getMyname() {
		return myname;
	}

	public void setMyname(String myname) {
		this.myname = myname;
	}

	public String getSns_id() {
		return sns_id;
	}

	public void setSns_id(String sns_id) {
		this.sns_id = sns_id;
	}

	public String getSns_type() {
		return sns_type;
	}

	public void setSns_type(String sns_type) {
		this.sns_type = sns_type;
	}





	
}
