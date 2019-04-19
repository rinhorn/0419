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
import game.model.domain.Event;
import game.model.service.EventService;

@Controller
public class EventController {
	@Autowired
	private EventService eventService;

	@Autowired
	private FileManager fileManager;

	@RequestMapping(value = "/admin/event/regist", method = RequestMethod.POST)
	public ModelAndView registEvent(Event event, HttpServletRequest request) {
		MultipartFile myFile_img = event.getMyFile_img();
		String filename_img = myFile_img.getOriginalFilename();
		MultipartFile myFile_icon = event.getMyFile_icon();
		String filename_icon = myFile_icon.getOriginalFilename();

		String realPath = request.getServletContext().getRealPath("/data/event");

		File uploadFile_img = null;
		File uploadFile_icon = null;
		try {
			uploadFile_img = new File(realPath + "/" + filename_img);
			myFile_img.transferTo(uploadFile_img);
			filename_img = fileManager.renameByDate(uploadFile_img, realPath);
			
			uploadFile_icon = new File(realPath + "/" + filename_icon);
			myFile_icon.transferTo(uploadFile_icon);
			filename_icon = fileManager.renameByDate(uploadFile_icon, realPath);
			
			if (filename_img != null && filename_icon != null) {
				event.setEvent_img(filename_img);
				event.setEvent_icon(filename_icon);
				eventService.insert(event);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		ModelAndView mav = new ModelAndView("/admin/event/index");
		return mav;
	}
}