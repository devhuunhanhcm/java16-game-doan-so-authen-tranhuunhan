package cybersoft.javabackend.gamedoanso.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collector;

import cybersoft.javabackend.gamedoanso.model.GameRecord;
import cybersoft.javabackend.gamedoanso.model.Player;
import cybersoft.javabackend.gamedoanso.util.DateUtils;

public class GameService {
	private List<GameRecord> records;
	private List<Player> players;
	
	public GameService() {
		records = StoreService.records;
		players = StoreService.players;
	}
	
	public GameRecord loadGame(String username, String password) {
		Player loggedUser = null;
		// check existed user
		for(Player p : players) {
			if (p.getUsername().equalsIgnoreCase(username)) {
				if(p.getPassword().equals(password)) {
					loggedUser = p;
					break;
				}
				return null;
			}
		}
		
		if(loggedUser == null) {
			loggedUser = new Player(username, password);
			players.add(loggedUser);
		}
		
		GameRecord game = null;
		// load existed unfinished game record
		for (GameRecord record : records) {
			if (record.getPlayer().getUsername().equals(loggedUser.getUsername()) 
					&& record.getIsFinished() == false) {
				game = record;
				return game;
			}
		}
		game = new GameRecord(loggedUser);
		records.add(game);
		return game;
	}
	public GameRecord playGame(int recordId,int tryNumber) {
		GameRecord record = null;
		// không cần check đã xong hay chưa vì lúc load game kiểm tra kết thúc hay chưa rồi
		for (GameRecord r : records) {
			if(r.getId() == recordId) {
				record = r;
				break;
			}
		}
		
		//tang so lan doan len
		record.setPoint(record.getPoint() + 1);
		
		if(record.getNumber() == tryNumber) {
			record.setFinishDate(DateUtils.toString(LocalDateTime.now()));
			record.setIsFinished(true);
		}
		return record;
	}
}
