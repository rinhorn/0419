package game.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.model.domain.Event_Game;

@Repository
public class MybatisEvent_GameDAO implements Event_GameDAO{
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public int insert(Event_Game event_Game) {
		return sessionTemplate.insert("Event_Game.insert", event_Game);
	}

	@Override
	public List selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Event_Game select(int event_game_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Event_Game event_Game) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int event_game_id) {
		// TODO Auto-generated method stub
		return 0;
	}

}