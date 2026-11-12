package Model;

import DAO.setDAO;

public class SetBO {
	
	public SetJb find(SetJb set) {
		setDAO setDAO = new setDAO();
		SetJb result = setDAO.find(set);
		
		if (result == null) {
			
			return result;
		}
		return result;
		
	}
	
	public boolean insert(SetJb set) {
		
		return false;
	}

}
