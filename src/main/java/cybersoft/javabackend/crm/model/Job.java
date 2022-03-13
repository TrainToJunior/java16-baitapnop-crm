package cybersoft.javabackend.crm.model;

public class Job {
	private int jobID;
	private String jobName;
	private String jobDescription;
	private int userCreatedID;
	private String startDate;
	private String endDate;
	public int getJobID() {
		return jobID;
	}
	public void setJobID(int jobID) {
		this.jobID = jobID;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getJobDescription() {
		return jobDescription;
	}
	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}
	public int getUserCreatedID() {
		return userCreatedID;
	}
	public void setUserCreatedID(int userCreatedID) {
		this.userCreatedID = userCreatedID;
	}
	
}
