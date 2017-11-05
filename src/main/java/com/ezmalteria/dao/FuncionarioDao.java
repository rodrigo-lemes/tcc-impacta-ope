package com.ezmalteria.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.ezmalteria.domain.FuncionarioTO;

@Repository
public interface FuncionarioDao extends CrudRepository<FuncionarioTO, Long> {

	//public FuncionarioTO findOneByLicensePlate(String licensePlate);

}
