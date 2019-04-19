package game.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import game.model.domain.Category;
import game.model.domain.Game;
import game.model.service.CategoryService;
import game.model.service.GameService;

@RestController
public class RestGameController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private GameService gameService;

	@RequestMapping(value = "/rest/admin/categories", method = RequestMethod.GET)
	public List getCategory() {
		List<Category> ctList = categoryService.selectAll();
		return ctList;
	}

	@RequestMapping(value = "/rest/admin/games", method = RequestMethod.GET)
	public List getGames() {
		System.out.println("게임 목록 제공");
		return gameService.selectAll();
	}
}
