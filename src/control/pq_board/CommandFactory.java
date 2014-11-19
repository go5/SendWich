package control.pq_board;

public class CommandFactory {
	
	private CommandFactory() {}
	private static CommandFactory instance = new CommandFactory();
	
	public static CommandFactory getInstance() {
		return instance;
	}
//---------------------------------------------------------------------������� ��Ŭ��
	
	public Command createCommand(String cmd) {
		//System.out.println("cmd : "+cmd);
		
		if (cmd.equals("main"))
			return new MainCommand();
		else if (cmd.equals("list"))
			return new ListCommand();
		//�Խñ� ��������
		else if (cmd.equals("read"))
			return new ReadCommand();
		//�Խñ� �󼼺���
		else if (cmd.equals("write"))
			return new WriteCommand();
		//�۾��� ������ �̵�
		else if (cmd.equals("writeProc"))
			return new WriteProcCommand();
		//�۾��� ��� �̵�
		else if (cmd.equals("replyWrite"))
			return new ReplyWriteProcCommand();
		//���ôޱ� ���
		else if (cmd.equals("repread"))
			return new RepReadCommand();
		//���� �� �� �Խñ� �̵�.
		else if (cmd.equals("delete"))
			return new DeleteCommand();
		//�Խñ� ����
		
		

		return null;
	}
}
