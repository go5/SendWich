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

	// DB���� Chart��� ��ȸ
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
	
	
	
	// �ش� ������ ��Ʈ ���.
	//������ ���� �� ������ ã��,
	//�� ���� ��ŭ ������ ��Ʈ�� ���,
	//���� ��Ʈ�� ���Ϳ� ���.
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
	//�ش� ������ ���� �� ��ȣ�� ���� = cnt, cnt.size()
			//������ ���� �����͵��� ����.
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
					chart.add(dto);//�׷��� �ϳ� �з��� dto��.
				}
				chartlist.add(chart); //cnt��ŭ�� �׷�����.
				
			}
			
			//�׷���dto���� �迭���� ������ ����Ʈ�� ����.
				for(int i=0; i<cnt.size(); i++){//�׷��� �� ��ŭ �ݺ�.
					Vector data=new Vector();//�׸�
					Vector value=new Vector();//��
					Vector titles=new Vector();//����
					
					Vector v = (Vector)chartlist.get(i); //idx��° �׷��� ����
					for(int j=0;j<v.size();j++){		
						dto = new ChartDTO();
						dto = (ChartDTO)v.get(j);  //idx��° �׷����� j���� �׸�
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

	
	
	
	
	
//��Ʈ �Է�
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
