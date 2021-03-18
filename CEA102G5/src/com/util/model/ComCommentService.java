package com.util.model;

import java.util.List;
import java.util.Set;

import com.talent.model.TalDAO;
import com.talent.model.TalDAO_interface;
import com.talent.model.TalVO;

public class ComCommentService {
	ComCommentDAO_interface dao = null;
	public ComCommentService() {
		dao = new ComCommentDAO();
	}
	public List<ComCommentVO> getAll() {
		return dao.getAll();
	}
}
