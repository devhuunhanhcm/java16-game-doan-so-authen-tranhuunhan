package cybersoft.javabackend.gamedoanso.servlet;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cybersoft.javabackend.gamedoanso.model.Player;
import cybersoft.javabackend.gamedoanso.service.StoreService;
import cybersoft.javabackend.gamedoanso.util.JspConst;
import cybersoft.javabackend.gamedoanso.util.UrlConst;

@WebServlet(name="playerServlet",urlPatterns = {
		UrlConst.PLAYER_LOGIN,
		UrlConst.PLAYER_REGISTER,
		
})
public class PlayerServlet extends HttpServlet {
	private List<Player> players;
	
	@Override
	public void init() throws ServletException {
		players = StoreService.players;
		Player admin = new Player("admin","123");
		players.add(admin);
	}
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		switch(path) {
		case UrlConst.PLAYER_REGISTER:
			req.getRequestDispatcher(JspConst.PLAYER_REGISTER)
			.forward(req, resp);
			break;
			
		case UrlConst.PLAYER_LOGIN:
			Cookie[] cookies = req.getCookies();
			String username = null;
			if(cookies != null) {
				Optional<Cookie> usernameCookies = Arrays.asList(cookies)
						.stream().filter(t -> t.getName()
						.equals("username"))
						.findFirst();
				if(usernameCookies.isPresent()) {
					username = usernameCookies.get().getValue();
				}
			}
			
			if(username != null) {
				req.setAttribute("lastUsername", username);
			}
			
			req.getRequestDispatcher(JspConst.PLAYER_LOGIN)
			.forward(req, resp);
			break;
		}
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		String username,password,message;
		switch(path) {
		case UrlConst.PLAYER_LOGIN:
			username = req.getParameter("username");
			password = req.getParameter("password");
			Optional<Player> currentPlayer =  players.stream()
			.filter(t -> t.getUsername().equals(username))
			.filter(t -> t.getPassword().equals(password))
			.findFirst();
			if(currentPlayer.isPresent()) {
				HttpSession session = req.getSession();
				session.setAttribute("player", currentPlayer.get());
				resp.sendRedirect(req.getContextPath() + UrlConst.GAME_ROOT);
			}else{
				req.setAttribute("lastUsername", username);
				req.setAttribute("isLoginFailed", true);
				req.getRequestDispatcher(JspConst.PLAYER_LOGIN).forward(req, resp);
			}
			
			
			break;
		case UrlConst.PLAYER_REGISTER:
			String name = req.getParameter("playerName");
			username = req.getParameter("username");
			password = req.getParameter("password");
			String rPassword = req.getParameter("rPassword");
			String passwordMessage;
			boolean isExistsUsername = players
										.stream()
										.anyMatch(t -> t.getUsername().equals(username));
			if(isExistsUsername) {							
				message = "Your username has been used";
				req.setAttribute("message", message);
			}
			boolean isMatch = password.equals(rPassword);
			if(!isMatch) {
				passwordMessage = "Your password dose not match";
				req.setAttribute("passwordMessage", passwordMessage);
			}
			if(isExistsUsername || !isMatch) {
				req.setAttribute("name", name);
				req.setAttribute("username", username);
				req.getRequestDispatcher(JspConst.PLAYER_REGISTER)
				.forward(req, resp);
			}else {
				Player newPlayer = new Player(username,password);
				players.add(newPlayer);
				req.setAttribute("registerSuccess", true);
				req.getRequestDispatcher(JspConst.PLAYER_REGISTER)
				.forward(req, resp);
			}
			
			break;
		}
	}
}
