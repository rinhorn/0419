package game.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.model.domain.Master;
import game.model.repository.MasterDAO;

@Service
public class MasterServiceImpl implements MasterService {
	@Autowired
	private MasterDAO masterDAO;

	public Master loginCheck(Master master) {
		return masterDAO.loginCheck(master);
	}

}