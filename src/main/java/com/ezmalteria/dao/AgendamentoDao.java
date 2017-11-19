package com.ezmalteria.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ezmalteria.domain.AgendamentoTO;

@Repository
public interface AgendamentoDao extends CrudRepository<AgendamentoTO, Long> {

}
