package cybersoft.javabackend.crm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import cybersoft.javabackend.crm.connection.JDBCConnection;
import cybersoft.javabackend.crm.model.Status;

public class StatusDAO {
	public ArrayList<Status> getAll(){
		ArrayList<Status> status = new ArrayList<>();
		
		String query = "SELECT * from crm_app.status"; 
		try(Connection connection = JDBCConnection.getConnection()){
			PreparedStatement statement = connection.prepareStatement(query);
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				Status sts = new Status();
				sts.setStatusID(result.getInt("id"));
				sts.setStatusName(result.getString("status_name"));
				sts.setCreateDate(result.getString("createDate"));
				status.add(sts);
			}
			
		}catch (Exception e) {

		}
		return status;
	}
}