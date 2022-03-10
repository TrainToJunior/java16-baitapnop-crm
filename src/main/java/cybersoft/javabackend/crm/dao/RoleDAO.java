package cybersoft.javabackend.crm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cybersoft.javabackend.crm.connection.MySQLConnection;
import cybersoft.javabackend.crm.model.Role;
import cybersoft.javabackend.crm.model.User;

public class RoleDAO {
	public String getRoleNameByID(int roleID) {
		Role role = new Role();
		String query = "SELECT * FROM crm_app.roles WHERE id = ?";
		try (Connection connection = MySQLConnection.getConnection()) {
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setInt(1, roleID);
			ResultSet res = statement.executeQuery();
			while (res.next()) {
				role.setRoleID(res.getInt("id"));
				role.setRoleName(res.getString("role_name"));
				role.setCreateDate(res.getString("createDate").toString());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return role.getRoleName();
	}

	public ArrayList<Role> getAll() {
		ArrayList<Role> listRole = new ArrayList<>();
		String query = "SELECT * FROM crm_app.roles";
		try (Connection connection = MySQLConnection.getConnection()) {
			PreparedStatement statement = connection.prepareStatement(query);
			ResultSet res = statement.executeQuery();
			while (res.next()) {
				Role role = new Role();
				role.setRoleID(res.getInt("id"));
				role.setRoleName(res.getString("role_name"));
				role.setCreateDate(res.getString("createDate"));
				listRole.add(role);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listRole;
	}
	
	public Role getRoleByID(int roleID) {
		Role role = new Role();
		String query = "SELECT * FROM crm_app.roles WHERE id = ?";
		try (Connection connection = MySQLConnection.getConnection()) {
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setInt(1, roleID);
			ResultSet res = statement.executeQuery();
			while (res.next()) {
				role.setRoleID(res.getInt("id"));
				role.setRoleName(res.getString("role_name"));
				role.setCreateDate(res.getString("createDate").toString());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return role;
	}
}