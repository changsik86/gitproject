package pcac;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class userDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public boolean idcheck(String id) {
		String sql = "select password from userinfo where id='" + id + "'";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				return true;}
			else
				return false;
		}
		catch (Exception e) {
			System.out.println("���̵� read ����");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
		
		return false;
	}
	public void insertDB(userInfo user) {
		String sql = "INSERT INTO userInfo"
					+ " (id, name, password, tel, job, gender, hobby, intro)"
					+ " values (?,?,?,?,?,?,?,?)";
		try {
			con = DBCon.getCon();
			//insert ���� �̿��Ͽ� �����͸� �߰���Ų��.
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getId());
			ps.setString(2, user.getName());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getTel());
			ps.setString(5, user.getJob());
			ps.setInt(6, Integer.parseInt(user.getGender()));
			ps.setString(7, user.getHobby());
			ps.setString(8, user.getIntro());
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("user insert ����");
		} finally {
			DBCon.close(con, ps, rs);
		}
	}
	public userInfo readDB(String userid) {
		userInfo user = new userInfo();
		String sql = "select * from userinfo where id='" + userid + "'";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				user.setName(rs.getString("name"));
				user.setId(rs.getString("id"));
				user.setPassword(rs.getString("password"));
				user.setTel(rs.getString("tel"));
				user.setJob(rs.getString("job"));
				user.setGender(rs.getString("gender"));
				user.setHobby(rs.getString("hobby"));
				user.setIntro(rs.getString("intro"));
			}
		}
		catch (Exception e) {
			System.out.println("user �б� ����");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
		return user;
	}
	public List<userInfo> readAllDB() {
		ArrayList<userInfo> list = new ArrayList<userInfo>();
		
		String sql = "select * from userInfo";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next() ) {
				userInfo user = new userInfo();
				user.setName(rs.getString("name"));
				user.setId(rs.getString("id"));
				user.setPassword(rs.getString("password"));
				user.setTel(rs.getString("tel"));
				user.setJob(rs.getString("job"));
				user.setGender(rs.getString("gender"));
				user.setHobby(rs.getString("hobby"));
				user.setIntro(rs.getString("intro"));
				list.add(user);
			}
		}
		catch (Exception e) {
			System.out.println("��ü ��� �б� ����");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
		return list;
	}
	public userInfo readUserDB(String id) {
		userInfo user = new userInfo(); 
				
		String sql = "select * from userInfo where id=?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				user.setName(rs.getString("name"));
				user.setId(rs.getString("id"));
				user.setPassword(rs.getString("password"));
				user.setTel(rs.getString("tel"));
				user.setJob(rs.getString("job"));
				user.setGender(rs.getString("gender"));
				user.setHobby(rs.getString("hobby"));
				user.setIntro(rs.getString("intro"));
			}
		}
		catch (Exception e) {
			System.out.println("ȸ�� ���� �б� ����");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
		return user;
	}
	
	public void dbUpdate(userInfo user) {
		String sql = "UPDATE userInfo" + " SET name = ?, tel = ?, job = ?" + " WHERE id = ? ";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getTel());
			ps.setString(3, user.getJob());
			ps.setString(4, user.getId());
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("record ���� ����");
		} finally {
			DBCon.close(con, ps, null);
		}
	}
	public void deleteDB(String userid) {
		String sql = "delete userInfo where id = ?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("record ���� ����");
		} finally {
			DBCon.close(con, ps, null);
		}
	}
}
