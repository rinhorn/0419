package game.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.model.domain.Game;

@Repository
public class MybatisGameDAO implements GameDAO{
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public int insert(Game game) {
		return sessionTemplate.insert("Game.insert", game);
	}

	public List selectAll() {
		return sessionTemplate.selectList("Game.selectAll");
	}

	public Game select(int game_id) {
		return null;
	}

	public int update(Game game) {
		return 0;
	}

	public int delete(int game_id) {
		return 0;
	}
}
