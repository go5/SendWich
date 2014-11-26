package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Vector;

import dbcp.DBConnectionMgr;
import dto.BoardDTO;
import dto.ChartDTO;

public class ChartDAO {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public ChartDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("ChartDAO(): ");
			e.printStackTrace();
		}
	}

	// DB에서 Chart목록 조회
	public Vector getChart(int board_id) {
		ChartDTO dto = null;
		String sql = null;
		Vector v = new Vector();
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();

			sql = "select * from chart where board_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new ChartDTO();
				dto.setEva_type(rs.getString("eva_type"));
				dto.setEva_value(rs.getInt("eva_value"));
				dto.setEva_key(rs.getString("eva_key"));
				dto.setBoard_id(rs.getInt("board_id"));
				dto.setChart_id(rs.getInt("chart_id"));
				dto.setLoc_id(rs.getInt("loc_id"));
				v.add(dto);
			}

		} catch (Exception e) {
			System.out.println("getList(): ");
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return v;
	}
	
	
	
	// 해당 지역의 차트 출력.
	//지역에 따른 글 갯수를 찾고,
	//글 갯수 만큼 돌려서 차트를 담고,
	//담은 차트를 벡터에 담고.
	public Vector locationChart(int loc_id) {
		ChartDTO dto = null;
		Vector<Integer> cnt = new Vector<Integer>();
		Vector chartlist = new Vector();
		HashMap datalist = new HashMap();
		String sql = "select DISTINCT board_id from chart where loc_id=?";
		String sql1 = "select * from chart where board_id=?";
		// System.out.println(sql);
		try {
			con = pool.getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, loc_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				cnt.add(rs.getInt("board_id"));
			}
			//System.out.println(cnt.size());
	//해당 지역에 따른 글 번호와 갯수 = cnt, cnt.size()
			//정보를 가진 데이터들을 저장.
			for(int i =0;i<cnt.size();i++){
				Vector chart = new Vector();

				pstmt = con.prepareStatement(sql1);
				pstmt.setInt(1, cnt.get(i));
				rs = pstmt.executeQuery();
				while(rs.next()){
				dto = new ChartDTO();
					dto.setEva_type(rs.getString("eva_type"));
					dto.setEva_value(rs.getInt("eva_value"));
					dto.setEva_key(rs.getString("eva_key"));
					dto.setBoard_id(rs.getInt("board_id"));
					dto.setChart_id(rs.getInt("chart_id"));
					dto.setLoc_id(rs.getInt("loc_id"));
					chart.add(dto);//그래프 하나 분량의 dto들.
				}
				chartlist.add(chart); //cnt만큼의 그래프들.
				
			}
			
			//그래프dto에서 배열별로 저장한 리스트를 저장.
				for(int i=0; i<cnt.size(); i++){//그래프 수 만큼 반복.
					Vector data=new Vector();//항목
					Vector value=new Vector();//값
					Vector titles=new Vector();//제목
					
					Vector v = (Vector)chartlist.get(i); //idx번째 그래프 꺼냄
					for(int j=0;j<v.size();j++){		
						dto = new ChartDTO();
						dto = (ChartDTO)v.get(j);  //idx번째 그래프의 j번쨰 항목
						System.out.println(dto.getBoard_id());
						data.add(dto.getEva_key());
						value.add(dto.getEva_value());
						titles.add(dto.getEva_type());
					}
				datalist.put("data", data);
				datalist.put("value", value);
				datalist.put("titles", titles);
				chartlist.add(datalist);
				}
		} catch (Exception err) {
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return chartlist;
	}

	
	
	
	
	
//차트 입력
	public void insertChart(ChartDTO dto){
		System.out.println("dldldl");
		String sql="";
		try{
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();

			sql="INSERT INTO chart (board_id, loc_id, eva_type, eva_key, eva_value) VALUES(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getBoard_id());
			pstmt.setInt(2, dto.getLoc_id());
			pstmt.setString(3, dto.getEva_type());
			pstmt.setString(4, dto.getEva_key());
			pstmt.setInt(5, dto.getEva_value());
			pstmt.executeUpdate();
			
		}catch(Exception err){
			System.out.println("insertList() :" +err);
		}finally{
			pool.freeConnection(con, pstmt, rs);
		}
	}
}
