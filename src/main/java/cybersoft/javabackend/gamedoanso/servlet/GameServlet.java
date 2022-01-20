package cybersoft.javabackend.gamedoanso.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cybersoft.javabackend.gamedoanso.model.GameRecord;
import cybersoft.javabackend.gamedoanso.model.Player;
import cybersoft.javabackend.gamedoanso.service.GameService;
import cybersoft.javabackend.gamedoanso.util.JspConst;
import cybersoft.javabackend.gamedoanso.util.UrlConst;

@WebServlet(name = "gameServlet", urlPatterns = {
		UrlConst.GAME_ROOT,
		UrlConst.GAME_PLAY
})
public class GameServlet extends HttpServlet {
	private static final long serialVersionUID = 4241740329722099042L;

	private GameService service;
	
	@Override
	public void init() throws ServletException {
		super.init();
		service = new GameService();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String message;
		message = "Lần đầu tiên hãy nhập con số mà bạn cảm thấy may mắn";
		req.setAttribute("message", message);
		Player currentPlayer = (Player) req.getSession().getAttribute("player");
		
		GameRecord record = service.loadGame(currentPlayer.getUsername(), currentPlayer.getPassword());
		if(record == null) {
			req.setAttribute("isLoginFailed", true);
			req.getRequestDispatcher(JspConst.PLAYER_LOGIN).forward(req, resp);
			return;
		}
		
		req.setAttribute("record", record);
		
		req.getRequestDispatcher(JspConst.GAME_PLAY)
			.forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException ,IOException {
		String path = req.getServletPath();
		String message;
		int recordId,tryNumber;
		GameRecord record;
		switch(path) {
			case UrlConst.GAME_ROOT:
				Player currentPlayer = (Player) req.getSession().getAttribute("player");
				
				record = service.loadGame(currentPlayer.getUsername(), currentPlayer.getPassword());
				if(record == null) {
					req.setAttribute("isLoginFailed", true);
					req.getRequestDispatcher(JspConst.PLAYER_LOGIN).forward(req, resp);
					return;
				}
				
				req.setAttribute("record", record);
				
				req.getRequestDispatcher(JspConst.GAME_PLAY)
					.forward(req, resp);
				break;
			case UrlConst.GAME_PLAY: 
				recordId = Integer.parseInt(req.getParameter("recordId"));
				tryNumber = Integer.parseInt(req.getParameter("tryNumber"));
				record = service.playGame(recordId, tryNumber);
				
				if(record == null) {
					req.getRequestDispatcher(JspConst.GAME_PLAY)
					.forward(req, resp);
					return;
				}
				
				if(record.getIsFinished()) {
					message = "Chúc mừng bạn đã đoán chính xác!!";
					
				}else {
					System.out.println(record.getNumber());
					message = getHint(record.getNumber(),tryNumber);
				}
				req.setAttribute("message", message);
				req.setAttribute("record", record);
				req.getRequestDispatcher(JspConst.GAME_PLAY)
				.forward(req, resp);
				break;
		}
	}

	private String getHint(int number, int tryNumber) {
		if(number < tryNumber) {
			return "Số bạn vừa đoán lớn hơn kết quả!";
		}
		return "Số bạn vừa đoán nhỏ hơn hơn kết quả!";
		
	}
}
