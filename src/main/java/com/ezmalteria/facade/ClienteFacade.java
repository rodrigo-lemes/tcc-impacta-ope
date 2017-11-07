package com.ezmalteria.facade;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezmalteria.dao.ClienteDao;
import com.ezmalteria.domain.ClienteTO;

@Service
public class ClienteFacade {

	@Autowired
	ClienteDao cdao;

	public List<ClienteTO> getAllClients() {

		List<ClienteTO> clientList = (List<ClienteTO>) cdao.findAll();

		return clientList;
	}
	
	public void saveClient(ClienteTO client){
		cdao.save(client);
	}

}
