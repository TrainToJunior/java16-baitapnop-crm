package cybersoft.javabackend.crm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cybersoft.javabackend.crm.connection.JDBCConnection;
import cybersoft.javabackend.crm.connection.MySQLConnection;
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
					job.setJobDescription(result.getString("job_description"));
					job.setUserCreatedID(result.getInt("user_created_id"));
					job.setStartDate(result.getString("start_date"));
					job.setEndDate(result.getString("end_date"));
					projects.add(job);
				}
		
			}catch (Exception e) {
				
			}
		return projects;
	}

	
	public int insertJob(Job job) {
		String query = "INSERT INTO crm_app.jobs (job_name, job_description, user_created_id,start_date,end_date) VALUES (?,?,?,?,?)";
		try (Connection connection = MySQLConnection.getConnection()) {
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, job.getJobName());
			statement.setString(2, job.getJobDescription());
			statement.setInt(3,job.getUserCreatedID());
			statement.setString(4, job.getStartDate());
			statement.setString(5, job.getEndDate());
			
			return statement.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return 0;
	}


	public int deleteJobByID(int deleteID) {
		String query = "DELETE FROM crm_app.jobs WHERE id = ?";
		try (Connection connection = MySQLConnection.getConnection()) {
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setInt(1, deleteID);
			return statement.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return 0;
	}


	public int updateJob(Job job, int updateID) {
		String query = "UPDATE crm_app.jobs SET job_name = ?, job_description = ?, user_created_id = ?, start_date = ?, end_date = ? WHERE id = ? ";
		try (Connection connection = MySQLConnection.getConnection()) {
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, job.getJobName());
			statement.setString(2, job.getJobDescription());
			statement.setInt(3,job.getUserCreatedID());
			statement.setString(4, job.getStartDate());
			statement.setString(5, job.getEndDate());
			statement.setInt(6, updateID);
			return statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public ArrayList<Job> getAllJobCurrentUser(int currentUserID){
		ArrayList<Job> projects = new ArrayList<>();
		String query = "SELECT * FROM crm_app.jobs WHERE user_created_id = ?";
		
		try(Connection conn = JDBCConnection.getConnection()){
			PreparedStatement stm = conn.prepareStatement(query);
			stm.setInt(1, currentUserID);
			ResultSet result = stm.executeQuery();
			
			while(result.next()) {
				Job job = new Job();
				job.setJobID(result.getInt("id"));
				job.setJobName(result.getString("job_name"));
				job.setJobDescription(result.getString("job_description"));
				job.setUserCreatedID(result.getInt("user_created_id"));
				job.setStartDate(result.getString("start_date"));
				job.setEndDate(result.getString("end_date"));
				projects.add(job);
			}
	
		}catch (Exception e) {
			
		}
	return projects;
	}
	
}