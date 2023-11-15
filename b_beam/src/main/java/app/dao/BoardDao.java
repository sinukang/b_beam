package app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;

import app.dbconn.DbConn;
import app.domain.BoardVo;

public class BoardDao {
	
	private Connection conn;
	private PreparedStatement pstmt;
	
	public BoardDao() {
		DbConn dbconn = new DbConn();
		this.conn = dbconn.getConnection();
	}
	
	public ArrayList<BoardVo> galleryList(int mbno){
		
		ArrayList<BoardVo> bv_alist = new ArrayList<BoardVo>();
		ResultSet rs = null;
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		
		String str = "";
		
		if(mbno != 0) {	//mbno != 0 : 로그인했다면 galleryList 페이지로 넘어왔을 시 좋아요(하트 아이콘) 색 표시 여부
			str = ", IF((SELECT COUNT(l.lkno) FROM like_ l WHERE l.bdno = b.bdno AND l.mbno = ? AND l.lkdelyn = 'N') = 1, 'T', 'F') AS likeTF";
		}
		
		String sql = "SELECT b.*"
					+ ", (SELECT COUNT(l.lkno) FROM like_ l where l.bdno = b.bdno and l.lkdelyn = 'N') AS bdLikeCnt"
					+ str
					+ " FROM (SELECT b.*, m.mbname FROM board b JOIN member m ON b.mbno = m.mbno WHERE m.mbdelyn = 'N' AND b.bddelyn = 'N') b"
					+ " ORDER by b.bdno DESC"
					+ " LIMIT 24";
		
		String sql2 = "SELECT * FROM bdgallery WHERE bdno = ? AND bdgldelyn = 'N'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			if(mbno != 0) {
				pstmt.setInt(1, mbno);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVo bv = new BoardVo();
				bv.setBdno(rs.getInt("bdno"));
				int bdno = rs.getInt("bdno");
				bv.setMbno(rs.getInt("mbno"));
				bv.setBdcate(rs.getString("bdcate"));
				bv.setBdtitle(rs.getString("bdtitle"));
				bv.setBdcont(rs.getString("bdcont"));
				bv.setBdtag(rs.getString("bdtag"));
				bv.setBdcontag(rs.getString("bdcontag"));
				bv.setBddate(rs.getString("bddate"));
				bv.setBddatem(rs.getString("bddatem"));
				bv.setBddelyn(rs.getString("bddelyn"));
				bv.setBdLikeCnt(rs.getInt("bdLikeCnt"));
				
				//ArrayList<String> bdFilename에
				//bdno가 일치하는 bdgallery의 값들을 담는다.
				
				try {
					pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setInt(1, bdno);
					
					rs2 = pstmt2.executeQuery();
					
					ArrayList<String> bdFilename = new ArrayList<String>();
					
					while(rs2.next()) {
						bdFilename.add(rs2.getString("bdglname"));
					}
					bv.setBdFilename(bdFilename);
					
				}catch (Exception e) {
					e.printStackTrace();
				}
				
				bv_alist.add(bv);
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}finally {
			try {
				rs.close();
				rs2.close();
				pstmt.close();
				pstmt2.close();
				//conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return bv_alist;
	}
	
	public BoardVo boardSelectOne(int mbno, int bdno) {
		
		BoardVo bv = new BoardVo();
		ResultSet rs = null;
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		
		String str = "";
		if(mbno != 0) {
			str = ", IF((SELECT COUNT(l.lkno) FROM like_ l WHERE l.bdno = b.bdno AND l.mbno = ? AND l.lkdelyn = 'N') = 1, 'T', 'F') AS likeTF";
		}
		
		String sql = "SELECT b.*"
					+ ", (SELECT COUNT(l.lkno) FROM like_ l where l.bdno = b.bdno and l.lkdelyn = 'N') AS likeCnt"
					+ str
					+ " FROM (SELECT b.*, m.mbname FROM board b JOIN member m ON b.mbno = m.mbno WHERE m.mbdelyn = 'N' AND b.bddelyn = 'N') b"
					+ " WHERE b.bdno = ?";
		
		String sql2 = "SELECT * FROM bdgallery WHERE bdno = ? AND bdgldelyn = 'N'";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			if(mbno != 0) {
				pstmt.setInt(1, mbno);
				pstmt.setInt(2, bdno);
			}else {
				pstmt.setInt(1, bdno);
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bv.setBdno(rs.getInt("bdno"));
				bv.setMbno(rs.getInt("mbno"));
				bv.setBdcate(rs.getString("bdcate"));
				bv.setBdtitle(rs.getString("bdtitle"));
				bv.setBdcont(rs.getString("bdcont"));
				bv.setBdtag(rs.getString("bdtag"));
				bv.setBdcontag(rs.getString("bdcontag"));
				bv.setBddate(rs.getString("bddate"));
				bv.setBddatem(rs.getString("bddatem"));
				bv.setBddelyn(rs.getString("bddelyn"));
				
				//ArrayList<String> bdFilename에 
				//bdno가 일치하는 bdgallery의 값들을 담는다
				try {
					pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setInt(1, bdno);
					
					rs2 = pstmt2.executeQuery();
					ArrayList<String> bdFilename = new ArrayList<String>();
					
					while(rs2.next()) {
						bdFilename.add(rs.getString("bdglname"));
					}
					
					bv.setBdFilename(bdFilename);
					
				}catch (Exception e) {
					e.printStackTrace();
				}finally {
					try {
						pstmt2.close();
						rs2.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bv;
	}
	
	public int boardLikeCntUpdate(int bdno, int mbno) {
		
		int value = 0;
		
		String sql = "INSERT INTO like_(mbno, bdno, lkdate, lkdelyn)"
					+ " VALUES(?, ?, NOW(), 'N')";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mbno);
			pstmt.setInt(2, bdno);
			
			value = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return value;
	}
	
	public int boardLikeCntUpdateCancel(int bdno, int mbno) {
		
		int value = 0;
		
		String sql = "UPDATE like_ SET lkdelyn = 'Y', lkdatem = NOW()"
					+ " WHERE mbno = ? AND bdno = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mbno);
			pstmt.setInt(2, bdno);
			
			value = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return value;
	}
	

}