package cybersoft.javabackend.crm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

import cybersoft.javabackend.crm.connection.MySQLConnection;
import cybersoft.javabackend.crm.filter.AuthFilter;
import cybersoft.javabackend.crm.model.User;

public class UserDAO {
	public ArrayList<User> getAll() {
		ArrayList<User> listUser = new ArrayList<>();
		String query = "SELECT * FROM crm_app.users";
		try (Connection connection = MySQLConnection.getConnection()) {
			PreparedStatement statement = connection.prepareStatement(query);
			ResultSet res = statement.executeQuery();
			while (res.next()) {
				User user = new User();
				user.setUserID(res.getInt("id"));
				user.setFullName(res.getString("fullname"));
				user.setPhoneNumber(res.getString("phone_number"));
				user.setAddress(res.getString("address"));
				user.setEmail(res.getString("email"));
				user.setUserPassword(res.getString("user_password"));
				user.setRoleID(res.getInt("role_id"));

				listUser.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listUser;
	}

	public User loginUser(String email, String password) {
		User user = new User();
		String query = "SELECT * FROM crm_app.users WHERE email = ? and user_password = ?";
		try (Connection connection = MySQLConnection.getConnection()) {
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, email);
			statement.setString(2, password);
			ResultSet res = statement.executeQuery();
			while (res.next()) {
				user.setUserID(res.getInt("id"));
				user.setFullName(res.getString("fullname"));
				user.setPhoneNumber(res.getString("phone_number"));
				user.setAddress(res.getString("address"));
				user.setUserPassword(res.getString("user_password"));
				user.setEmail(res.getString("email"));
				user.setRoleID(res.getInt("role_id"));
				user.setPhoneNumber(res.getString("phone_number"));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return user;
	}

	public int deleteUserByID(int deleteId) {
		updateTaskBeforeDeleteUserByID(deleteId);
		String query = "DELETE FROM crm_app.users WHERE id = ?";
		try (Connection connection = MySQLConnection.getConnection()) {
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setInt(1, deleteId);
			return statement.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return 0;
	}

	public int insertUser(User user) {
		String query = "INSERT INTO crm_app.users (fullname, phone_number, address, email, user_password, role_id) VALUES (?,?,?,?,?,?)";
		try (Connection connection = MySQLConnection.getConnection()) {
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, user.getFullName());
			statement.setString(2, user.getPhoneNumber());
			statement.setString(3, user.getAddress());
			statement.setString(4, user.getEmail());
			statement.setString(5, user.getUserPassword());
			statement.setInt(6, user.getRoleID());
			return statement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public int updateUser(User user) {
		String query = "UPDATE crm_app.users SET fullname = ?, phone_number = ?, address = ?, email = ?, user_password = ?, role_id = ? WHERE id = ? ";
		try (Connection connection = MySQLConnection.getConnection()) {
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, user.getFullName());
			statement.setString(2, user.getPhoneNumber());
			statement.setString(3, user.getAddress());
			statement.setString(4, user.getEmail());
			statement.setString(5, user.getUserPassword());
			statement.setInt(6, user.getRoleID());
			statement.setInt(7, user.getUserID());
			return statement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public User getUserByID(int userID) {
		User user = new User();
		String query = "SELECT * FROM crm_app.users WHERE id = ?";
		try (Connection connection = MySQLConnection.getConnection()) {
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setInt(1, userID);
			ResultSet res = statement.executeQuery();
			while (res.next()) {
				user.setUserID(res.getInt("id"));
				user.setFullName(res.getString("fullname"));
				user.setPhoneNumber(res.getString("phone_number"));
				user.setAddress(res.getString("address"));
				user.setEmail(res.getString("email"));
				user.setUserPassword(res.getString("user_password"));
				user.setRoleID(res.getInt("role_id"));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return user;
	}
	
	public String getEmailExists(String email) {
		User user = new User();
		String query = "SELECT email FROM crm_app.users WHERE email = ?";
		try (Connection connection = MySQLConnection.getConnection()) {
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, email);
			ResultSet res = statement.executeQuery();
			while (res.next()) {			
				user.setEmail(res.getString("email"));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		String value = user.getEmail();
		return user.getEmail();
	}
	
	public String getMessage() {
		return null;
	}

	public int updateTaskBeforeDeleteUserByID(int deleteID) {
		String query = "UPDATE crm_app.tasks SET user_id = ? WHERE user_id = ?";
		try (Connection connection = MySQLConnection.getConnection()) {
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setNull(1, Types.NULL);
			statement.setInt(2, deleteID);
			return statement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
}
