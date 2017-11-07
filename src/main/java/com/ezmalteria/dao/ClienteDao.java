package com.ezmalteria.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ezmalteria.domain.ClienteTO;

@Repository
public interface ClienteDao extends CrudRepository<ClienteTO, Long> {

}
