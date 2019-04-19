package game.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import game.common.file.FileManager;
import game.model.domain.Game;
import game.model.service.GameService;

@Controller
public class GameController {
	@Autowired
	private GameService gameService;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="/admin/game/regist", method=RequestMethod.POST)
	public ModelAndView registGame(Game game, HttpServletRequest request) {
		String[] myFile_name = new String[game.getMyfile().length];
		
		for(int i=0;i<game.getMyfile().length;i++) {
			String realPath = request.getServletContext().getRealPath("/data/game");
			//System.out.println(realPath);
			MultipartFile myFile_one = game.getMyfile()[i];
			String filename = myFile_one.getOriginalFilename();
			
			File uploadFile = null;
			try {
				uploadFile = new File(realPath + "/" + filename);
				myFile_one.transferTo(uploadFile);
				filename = fileManager.renameByDate(uploadFile, realPath);

				if (filename != null) {
					myFile_name[i]=filename;
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} 
		}
		gameService.insert(game, myFile_name);
		
		ModelAndView mav = new ModelAndView("/admin/game/index");
		return mav;
	}
}
