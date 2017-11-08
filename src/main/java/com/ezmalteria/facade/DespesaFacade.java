package com.ezmalteria.facade;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezmalteria.dao.DespesaDao;
import com.ezmalteria.dao.FuncionarioDao;
import com.ezmalteria.domain.DespesasTO;
import com.ezmalteria.domain.FuncionarioTO;

@Service
public class DespesaFacade {

	@Autowired
	DespesaDao ddao;

	public List<DespesasTO> getAllExpenses() {

		List<DespesasTO> funcionarioMetadata = (List<DespesasTO>) ddao.findAll();

		return funcionarioMetadata;
	}

	public void saveExpense(DespesasTO despesa) {
		ddao.save(despesa);
	}

}
