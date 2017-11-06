package com.ezmalteria.facade;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezmalteria.dao.AgendamentoDao;
import com.ezmalteria.domain.AgendamentoTO;

@Service
public class AgendamentoFacade {

	@Autowired
	AgendamentoDao adao;

	public List<AgendamentoTO> getAllDatings() {

		List<AgendamentoTO> datingList = (List<AgendamentoTO>) adao.findAll();

		return datingList;
	}

}
