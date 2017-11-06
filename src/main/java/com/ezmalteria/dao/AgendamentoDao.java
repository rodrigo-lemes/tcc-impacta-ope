package com.ezmalteria.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ezmalteria.domain.AgendamentoTO;
import com.ezmalteria.domain.ProdutoTO;

@Repository
public interface AgendamentoDao extends CrudRepository<AgendamentoTO, Long> {

}
