package com.ezmalteria.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ezmalteria.domain.LancamentoServicoTO;

@Repository
public interface ServicoDao extends CrudRepository<LancamentoServicoTO, Long> {

}
