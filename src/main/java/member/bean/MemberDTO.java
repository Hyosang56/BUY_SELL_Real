package member.bean;

public class MemberDTO {
	
	private String userid;
	private String userpw;
	private String username;
	private String usergender;
	private String useremail;
	private String userdob;
	private String userphone;
	
	public String getuserid() {
		return userid;
	}
	public void setuserid(String userid) {
		this.userid = userid;
	}
	
	public String getuserpw() {
		return userpw;
	}
	public void setuserpw(String userpw) {
		this.userpw = userpw;
	}
	
	public String getusername() {
		return username;
	}
	public void setusername(String username) {
		this.username = username;
	}
	
	public String getusergender() {
		return usergender;
	}
	public void setusergender(String usergender) {
		this.usergender = usergender;
	}
	
	public String getuseremail() {
		return useremail;
	}
	public void setuseremail(String useremail) {
		this.useremail = useremail;
	}
	
	public String getuserdob() {
		return userdob;
	}
	public void setuserdob(String userdob) {
		this.userdob = userdob;
	}
	
	public String getuserphone() {
		return userphone;
	}
	public void setuserphone(String userphone) {
		this.userphone = userphone;
	}


}