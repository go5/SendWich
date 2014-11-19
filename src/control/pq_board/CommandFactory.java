package control.pq_board;

public class CommandFactory {
	
	private CommandFactory() {}
	private static CommandFactory instance = new CommandFactory();
	
	public static CommandFactory getInstance() {
		return instance;
	}
//---------------------------------------------------------------------여기까지 싱클톤
	
	public Command createCommand(String cmd) {
		//System.out.println("cmd : "+cmd);
		
		if (cmd.equals("main"))
			return new MainCommand();
		else if (cmd.equals("list"))
			return new ListCommand();
		//게시글 가져오기
		else if (cmd.equals("read"))
			return new ReadCommand();
		//게시글 상세보기
		else if (cmd.equals("write"))
			return new WriteCommand();
		//글쓰기 페이지 이동
		else if (cmd.equals("writeProc"))
			return new WriteProcCommand();
		//글쓰기 기능 이동
		else if (cmd.equals("replyWrite"))
			return new ReplyWriteProcCommand();
		//리플달기 기능
		else if (cmd.equals("repread"))
			return new RepReadCommand();
		//리플 단 후 게시글 이동.
		else if (cmd.equals("delete"))
			return new DeleteCommand();
		//게시글 삭제
		
		

		return null;
	}
}
