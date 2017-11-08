package com.ezmalteria.facade;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezmalteria.dao.FuncionarioDao;
import com.ezmalteria.domain.FuncionarioTO;

@Service
public class FuncionarioFacade {

	@Autowired
	FuncionarioDao fdao;

	public FuncionarioTO getFuncionarioByCredentials(final FuncionarioTO funcionarioCredentials) {

		FuncionarioTO funcionarioMetadata = fdao.findOneByEmailAndSenha(funcionarioCredentials.getEmail(),funcionarioCredentials.getSenha());

		return funcionarioMetadata;
	}
	
	public void saveFuncionario(FuncionarioTO funcionarioMetaData){
		fdao.save(funcionarioMetaData);
	}

}
