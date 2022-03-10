package cybersoft.javabackend.crm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import cybersoft.javabackend.crm.connection.JDBCConnection;
import cybersoft.javabackend.crm.model.Task;

public class TaskDAO {
	public ArrayList<Task> getAll(){
		ArrayList<Task> tasks = new ArrayList<>();
		
		String query = "SELECT * FROM crm_app.tasks";
		try(Connection conn = JDBCConnection.getConnection()){
			PreparedStatement statement = conn.prepareStatement(query);
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				Task task = new Task();
				task.setTaskID(result.getInt("id"));
				task.setUserID(result.getInt("user_id"));
				task.setJobID(result.getInt("job_id"));
				task.setStatusID(result.getInt("status_id"));
				task.setTaskName(result.getString("task_name"));
				task.setStartDate(result.getString("start_date"));
				task.setEndDate(result.getString("end_date"));
				
				tasks.add(task);
			}
		}catch (Exception e) {
			
		}
		
		return tasks;
	}
}
