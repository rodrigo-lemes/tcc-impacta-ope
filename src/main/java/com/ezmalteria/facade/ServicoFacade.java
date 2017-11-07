package com.ezmalteria.facade;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezmalteria.dao.ServicoDao;
import com.ezmalteria.domain.LancamentoServicoTO;

@Service
public class ServicoFacade {

	@Autowired
	ServicoDao sdao;

	public List<LancamentoServicoTO> getAllServices() {

		List<LancamentoServicoTO> servicesList = (List<LancamentoServicoTO>) sdao.findAll();

		return servicesList;
	}

}
