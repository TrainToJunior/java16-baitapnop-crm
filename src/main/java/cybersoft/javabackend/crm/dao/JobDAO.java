package cybersoft.javabackend.crm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import cybersoft.javabackend.crm.connection.JDBCConnection;
import cybersoft.javabackend.crm.model.Job;

public class JobDAO {
	public ArrayList<Job> getAll(){
		ArrayList<Job> projects = new ArrayList<>();
		
		String query = "SELECT * FROM crm_app.jobs";
	
			try(Connection conn = JDBCConnection.getConnection()){
				PreparedStatement stm = conn.prepareStatement(query);
				ResultSet result = stm.executeQuery();
				
				while(result.next()) {
					Job job = new Job();
					job.setJobID(result.getInt("id"));
					job.setJobName(result.getString("job_name"));
					job.setStartDate(result.getString("start_date"));
					job.setEndDate(result.getString("end_date"));
					projects.add(job);
				}
		
			}catch (Exception e) {
				
			}
		return projects;
	}
}
