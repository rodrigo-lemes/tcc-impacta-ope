package com.ezmalteria.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ezmalteria.domain.DespesasTO;

@Repository
public interface DespesaDao extends CrudRepository<DespesasTO, Long> {

}
