package cybersoft.javabackend.crm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cybersoft.javabackend.crm.connection.JDBCConnection;
import cybersoft.javabackend.crm.connection.MySQLConnection;
import cybersoft.javabackend.crm.model.Task;

public class TaskDAO {
	public ArrayList<Task> getAll() {
		ArrayList<Task> tasks = new ArrayList<>();

		String query = "SELECT * FROM crm_app.tasks";
		try (Connection conn = JDBCConnection.getConnection()) {			
			PreparedStatement statement = conn.prepareStatement(query);
			ResultSet result = statement.executeQuery();

			while (result.next()) {
				Task task = new Task();
				
				task.setTaskID(result.getInt("id"));
				task.setTaskName(result.getString("task_name"));
				task.setTaskDescription(result.getString("task_description"));
				task.setStartDate(result.getString("start_date"));
				task.setEndDate(result.getString("end_date"));
				task.setUserID(result.getInt("user_id"));
				task.setStatusID(result.getInt("status_id"));
				task.setJobID(result.getInt("job_id"));
				
				tasks.add(task);
			}
		} catch (Exception e) {

		}

		return tasks;
	}

	public int insertTask(Task task) {
		String query = "INSERT INTO crm_app.tasks(task_name, task_description, start_date, end_date, user_id, status_id, job_id) VALUES (?,?,?,?,?,?,?)";

		try (Connection conn = JDBCConnection.getConnection()) {
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setString(1, task.getTaskName());
			statement.setString(2, task.getTaskDescription());
			statement.setString(3, task.getStartDate());
			statement.setString(4, task.getEndDate());
			statement.setInt(5, task.getUserID());
			statement.setInt(6, task.getStatusID());
			statement.setInt(7, task.getJobID());

			return statement.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	public int updateTask(Task task, int taskID) {
		String query = "UPDATE crm_app.tasks SET task_name = ?, task_description = ?, start_date = ?, end_date = ?,user_id = ?, status_id = ?, job_id = ? WHERE id = ? ";
		try (Connection connection = MySQLConnection.getConnection()) {
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, task.getTaskName());
			statement.setString(2, task.getTaskDescription());
			statement.setString(3, task.getStartDate());
			statement.setString(4, task.getEndDate());
			statement.setInt(5, task.getUserID());
			statement.setInt(6, task.getStatusID());
			statement.setInt(7, task.getJobID());
			statement.setInt(8, taskID);
			return statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int deleteTaskByID(int deleteID) {
		String query = "DELETE FROM crm_app.tasks WHERE id = ?";
		try (Connection connection = MySQLConnection.getConnection()) {
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setInt(1, deleteID);
			return statement.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return 0;
	}
}