package game.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.model.domain.Event;

@Repository
public class MybatisEventDAO implements EventDAO{
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public int insert(Event event) {
		return sessionTemplate.insert("Event.insert", event);
	}

	public List selectAll() {
		return null;
	}

	public Event select(int event_id) {
		return null;
	}

	public int update(Event event) {
		return 0;
	}

	public int delete(int event_id) {
		return 0;
	}
}