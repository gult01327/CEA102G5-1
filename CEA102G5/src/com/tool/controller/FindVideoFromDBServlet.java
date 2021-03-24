package com.tool.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/FindVideoFromDBServlet")
public class FindVideoFromDBServlet extends HttpServlet {  

	
	private static DataSource ds = null;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("video/x-msvideo");
		ServletOutputStream out = res.getOutputStream();
		Connection con = null;
		try {
			con = ds.getConnection();
			String table = req.getParameter("table");
			String col = req.getParameter("col");
			String idName = req.getParameter("idName");
			String id = req.getParameter("id");
			String sql = "SELECT "+col+" From "+table+" WHERE "+idName+"="+id;
			ResultSet rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream(col));
				byte[] b = new byte[10*1024];
				int len;
				while((len = in.read(b)) != -1) {
					out.write(b, 0, len);
				}
				in.close();
			}else {
				InputStream in = getServletContext().getResourceAsStream("/resource/images/notFound.jpg");
				byte[] b = new byte[in.available()];
				in.read(b);
				out.write(b);
				in.close();
				out.close();
			}
			rs.close();
		}catch(Exception e) {
			InputStream in = getServletContext().getResourceAsStream("/resource/images/notFound.jpg");
			byte[] b = new byte[in.available()];
			in.read(b);
			out.write(b);
			in.close();
			out.close();
		}finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}


	@Override
	public void init() throws ServletException {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myproject");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

}
