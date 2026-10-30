package Model;

public class Score {
	
	private int id;
	private int gameId;
	private int lvId;
	private int rank;
	private int score;
	private String player;
	private int color;                   
	private String gameName;              
	private String lvName;               
	private java.sql.Timestamp createdAt; 
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getGameId() {
		return gameId;
	}
	public void setGameId(int gameId) {
		this.gameId = gameId;
	}
	public int getLvId() {
		return lvId;
	}
	public void setLvId(int lvId) {
		this.lvId = lvId;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getPlayer() {
		return player;
	}
	public void setPlayer(String player) {
		this.player = player;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getColor() {
		return color;
	}
	public void setColor(int color) {
		this.color = color;
	}
	public String getGameName() {
		return gameName;
	}
	public void setGameName(String gameName) {
		this.gameName = gameName;
	}
	public String getLvName() {
		return lvName;
	}
	public void setLvName(String lvName) {
		this.lvName = lvName;
	}
	public java.sql.Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(java.sql.Timestamp createdAt) {
		this.createdAt = createdAt;
	}

}
