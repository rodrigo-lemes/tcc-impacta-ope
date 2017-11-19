package com.ezmalteria.controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ezmalteria.domain.AgendamentoTO;
import com.ezmalteria.domain.ClienteTO;
import com.ezmalteria.domain.DespesasTO;
import com.ezmalteria.domain.FuncionarioTO;
import com.ezmalteria.domain.LancamentoServicoTO;
import com.ezmalteria.domain.ProdutoTO;
import com.ezmalteria.facade.AgendamentoFacade;
import com.ezmalteria.facade.ClienteFacade;
import com.ezmalteria.facade.DespesaFacade;
import com.ezmalteria.facade.FuncionarioFacade;
import com.ezmalteria.facade.ProdutoFacade;
import com.ezmalteria.facade.ServicoFacade;
import com.ezsystem.dataBaseControl.JdbcManager;
import com.ezsystem.utils.ConversorDatas;
import com.ezsystem.utils.Logger;
import com.ezsystem.utils.javaMailUtil;

@Controller
@EnableAutoConfiguration
@EnableJpaRepositories("com.ezmalteria.dao")
@EntityScan("com.ezmalteria.domain")
@ComponentScan(basePackageClasses = com.ezmalteria.facade.FuncionarioFacade.class)
public class EzSystemController {

	@Autowired
	private FuncionarioFacade funcionarioFacade;

	@Autowired
	private ProdutoFacade produtoFacade;

	@Autowired
	private AgendamentoFacade agendamentoFacade;

	@Autowired
	private DespesaFacade despesaFacade;

	@Autowired
	private ServicoFacade servicoFacade;

	@Autowired
	private ClienteFacade clienteFacade;

	private FuncionarioTO funcionarioLoaded;

	javaMailUtil JMailTool;

	Logger log = new Logger();
	String codigoClienteSendoEditado = "";
	String cpfCadastradoEmUsuarioSendoEditado = "";
	String codigoEmProdutoSendoEditado = "";
	String codigoEmServicoSendoEditado = "";
	String codigoEmAgendamentoSendoEditado = "";
	String codigoEmDespesaSendoEditado = "";
	String codigoDeServicoPrestadoSendoEditado = "";
	String insertResult = "";
	/* inicio processo de login */

	// Erro ao tentar acessar pg sem estar logado
	String loginCheckedContext = "erroLogin";

	// mapeamento para o pagina de Login
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView login() {
		loginCheckedContext = "erroLogin";
		return new ModelAndView("login", "command", new FuncionarioTO());
	}

	// pagina inicial que nao checa o login
	@RequestMapping(value = "/index")
	public ModelAndView index(AgendamentoTO agendamento, ModelAndView model) {

		JdbcManager dataBaseTools = new JdbcManager();

		ResultSet produtos = dataBaseTools.selectJdbc("SELECT * FROM public.produto WHERE quantidade < 4");

		ArrayList<ProdutoTO> listaProdutosAcabando = new ArrayList<ProdutoTO>();

		try {
			while (produtos.next()) {
				ProdutoTO produtoAcabando = new ProdutoTO();

				produtoAcabando.setNomeProduto(produtos.getString("nomeProduto"));
				produtoAcabando.setMarca(produtos.getString("Marca"));
				produtoAcabando.setCor(produtos.getString("cor"));
				produtoAcabando.setCodigoProduto(produtos.getString("codigoProduto"));
				produtoAcabando.setQuantidade(produtos.getString("quantidade"));

				listaProdutosAcabando.add(produtoAcabando);

			}

		} catch (SQLException e) {

			log.gravarLog(e.toString());
		}

		ResultSet agendamentos = dataBaseTools
				.selectJdbc("SELECT * FROM public.AgendamentoTeste WHERE data = CURRENT_DATE() ORDER BY hora;");

		ArrayList<AgendamentoTO> listaAgendamentos = new ArrayList<AgendamentoTO>();

		ConversorDatas dateTool = new ConversorDatas();

		try {
			while (agendamentos.next()) {
				agendamento = new AgendamentoTO();

				agendamento.setData(dateTool.converterDataUsParaBr(agendamentos.getString("data")));
				agendamento.setCliente(agendamentos.getString("cliente"));
				agendamento.setFuncionario(agendamentos.getString("funcionario"));
				agendamento.setHora(agendamentos.getString("hora"));
				agendamento.setServico(agendamentos.getString("servico"));
				agendamento.setIdAgendamento(agendamentos.getString("idAgendamento"));

				listaAgendamentos.add(agendamento);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		if (!loginCheckedContext.equals("erroLogin")) {

			model = new ModelAndView("index", "command", new AgendamentoTO());

			model.addObject("listaProdutosAcabando", listaProdutosAcabando);
			model.addObject("listaAgendamentos", listaAgendamentos);

			return model;

		} else {
			return new ModelAndView("erroLogin");
		}

	}

	@RequestMapping(value = "/home", method = RequestMethod.POST)
	public ModelAndView inicio(final FuncionarioTO usuario, @ModelAttribute("command") AgendamentoTO agendamento) {

		funcionarioLoaded = funcionarioFacade.getFuncionarioByCredentials(usuario);

		ModelAndView model = new ModelAndView(loginCheckedContext);

		if (null != funcionarioLoaded) {
			loginCheckedContext = "LOGADO";
		}

		List<ProdutoTO> listaProdutosAcabando = produtoFacade.getLowStockProducts("5");
		/*List<ProdutoTO> listaProdutosAcabando = produtoFacade.getAllProducts();

		if (null != listaProdutosAcabando) {
			for (int index = 0; index < listaProdutosAcabando.size(); index++) {
				if (Integer.parseInt(listaProdutosAcabando.get(index).getQuantidade()) > 5) {
					listaProdutosAcabando.remove(index);
				}
			}
		}
*/
		List<AgendamentoTO> listaAgendamentos = agendamentoFacade.getAllDatings();

		try {

			if (null != funcionarioLoaded.getIdFuncionario() && !funcionarioLoaded.getIdFuncionario().isEmpty()) {

				// log.gravarLog("UsuarioExiste: " + usuario.getEmail());

				if (funcionarioLoaded.getEstado().equals("1")) {

					model = new ModelAndView("index");

					model.addObject("listaProdutosAcabando", listaProdutosAcabando);
					model.addObject("listaAgendamentos", listaAgendamentos);

					return model;
				} else {
					return new ModelAndView("acessoRestrito");
				}
			} else {
				log.gravarLog("Falha de Login: " + usuario.getEmail());

			}
		} catch (java.lang.IndexOutOfBoundsException e) {
		}
		// neste cenario, deu erro no login!
		return model;
	}

	/* FIM processo de login */

	// Agendamentos
	@RequestMapping(value = "/gerenciarAgendamentos", method = RequestMethod.GET)
	public ModelAndView agendamento() {

		if (!loginCheckedContext.equals("erroLogin")) {
			if (funcionarioLoaded.getPerfil().equalsIgnoreCase("adm") && funcionarioLoaded.getEstado().equals("1")) {

				ModelAndView model = new ModelAndView("gerenciarAgendamentos", "command", new AgendamentoTO());

				JdbcManager dataBaseTools = new JdbcManager();

				ArrayList<String> nomesClientes = new ArrayList<String>();

				ArrayList<String> nomesFuncionarios = new ArrayList<String>();

				ResultSet getNomeClientes = dataBaseTools.selectJdbc("SELECT nome FROM public.cliente");

				ResultSet getNomeFuncionarios = dataBaseTools.selectJdbc(
						"SELECT nome FROM public.funcionario WHERE perfil = 'func' AND statusFuncionario = '1'");

				// popular lista de clientes

				try {
					while (getNomeClientes.next()) {

						nomesClientes.add(getNomeClientes.getString("nome"));
					}

					while (getNomeFuncionarios.next()) {

						nomesFuncionarios.add(getNomeFuncionarios.getString("nome"));
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				model.addObject("nomesClientes", nomesClientes);
				model.addObject("nomesFuncionarios", nomesFuncionarios);

				return model;
			} else {

				return new ModelAndView("acessoRestrito");
			}
		} else {
			return new ModelAndView(loginCheckedContext, "command", null);
		}
	}

	@RequestMapping(value = "/salvarAgendamento", method = RequestMethod.POST)
	public ModelAndView salvarAgendamento(AgendamentoTO agendamento, ModelAndView model) {

		ConversorDatas dateTool = new ConversorDatas();

		JdbcManager dataBaseTools = new JdbcManager();
		insertResult = dataBaseTools
				.insertJdbc("" + "INSERT INTO public.AgendamentoTeste (data, hora, cliente, funcionario, servico) "
						+ " VALUES('" + dateTool.converterDataBrParaUS(agendamento.getData()) + "','"
						+ agendamento.getHora() + "','" + agendamento.getCliente() + "','"
						+ agendamento.getFuncionario() + "','" + agendamento.getServico() + "')");

		if (!loginCheckedContext.equals("erroLogin")) {

			if (insertResult.equals("1")) {
				System.out.println("Inserindo Att");

				String insertResultModelAttribute = insertResult;

				model = new ModelAndView("gerenciarAgendamentos", "command", new AgendamentoTO());

				model.addObject("insertResult", insertResultModelAttribute);

				insertResult = "";

				return model;
			} else {
				System.out.println("Inserindo Att");

				String insertResultModelAttribute = insertResult;

				model = new ModelAndView("gerenciarAgendamentos", "command", new AgendamentoTO());

				model.addObject("insertResult", insertResultModelAttribute);

				insertResult = "";

				return model;
			}

		} else {
			System.out.println("Falha insert att");
			return model = new ModelAndView(loginCheckedContext, "command", null);
		}

	}

	// formulario de edicao agendamento
	@RequestMapping(value = "/formularioDeEdicaoAgendamento", method = RequestMethod.POST)
	public String formularioDeEdicaoAgendamento(@ModelAttribute("command") AgendamentoTO agendamento, ModelMap model) {

		JdbcManager dataBaseTools = new JdbcManager();
		ResultSet dadosEditarAgendamento = null;

		dadosEditarAgendamento = dataBaseTools.selectJdbc(
				"SELECT * FROM public.AgendamentoTeste WHERE idAgendamento='" + agendamento.getIdAgendamento() + "'");
		codigoEmAgendamentoSendoEditado = agendamento.getIdAgendamento();
		ConversorDatas dateTools = new ConversorDatas();

		try {
			while (dadosEditarAgendamento.next()) {
				agendamento.setCliente(dadosEditarAgendamento.getString("cliente"));
				agendamento.setData(dateTools.converterDataUsParaBr(dadosEditarAgendamento.getString("data")));
				agendamento.setFuncionario(dadosEditarAgendamento.getString("funcionario"));
				agendamento.setHora(dadosEditarAgendamento.getString("hora"));
				agendamento.setServico(dadosEditarAgendamento.getString("servico"));
				agendamento.setIdAgendamento(dadosEditarAgendamento.getString("idAgendamento"));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		// ======
		if (funcionarioLoaded.getPerfil().equalsIgnoreCase("adm") && funcionarioLoaded.getEstado().equals("1")) {
			return "formularioDeEdicaoAgendamento";
		} else {
			return "acessoRestrito";
		}
	}

	// salvar edicao
	@RequestMapping(value = "/salvarAgendamentoEditado", method = RequestMethod.POST)
	public ModelAndView salvarAgendamentoEditado(AgendamentoTO agendamento, ModelAndView model) {

		JdbcManager dataBaseTools = new JdbcManager();
		ConversorDatas dateTool = new ConversorDatas();

		try {

			insertResult = dataBaseTools.updateJdbc("UPDATE public.AgendamentoTeste SET" + "   data='"
					+ dateTool.converterDataBrParaUS(agendamento.getData()) + "', hora='" + agendamento.getHora()
					+ "', cliente='" + agendamento.getCliente() + "', funcionario='" + agendamento.getFuncionario()
					+ "', servico='" + agendamento.getServico() + "'  WHERE idAgendamento='"
					+ codigoEmAgendamentoSendoEditado + "'");
			if (insertResult.equals("1")) {
				model = new ModelAndView("formularioDeEdicaoAgendamento", "command", new AgendamentoTO());

				String insertResultAttributeModel = insertResult;

				insertResult = "";

				model.addObject("insertResult", insertResultAttributeModel);
				return model;
			} else {
				model = new ModelAndView("formularioDeEdicaoAgendamento", "command", new AgendamentoTO());

				String insertResultAttributeModel = insertResult;

				insertResult = "";

				model.addObject("insertResult", insertResultAttributeModel);
				return model;
			}
		} catch (Exception e) {
			model = new ModelAndView("formularioDeEdicaoAgendamento", "command", new AgendamentoTO());

			String insertResultAttributeModel = insertResult;

			insertResult = "";

			model.addObject("insertResult", insertResultAttributeModel);
			return model;
		}

	}

	// deletar agendamento
	@RequestMapping(value = "/deletarAgendamento", method = RequestMethod.POST)
	public ModelAndView deletarAgendamento(AgendamentoTO agendamento, ModelAndView model) {

		JdbcManager dataBaseTools = new JdbcManager();

		insertResult = dataBaseTools.deleteJdbc(
				"DELETE FROM public.AgendamentoTeste WHERE idAgendamento='" + codigoEmAgendamentoSendoEditado + "'");

		model = new ModelAndView("formularioDeEdicaoAgendamento", "command", new AgendamentoTO());

		String insertResultAttributeModel = insertResult;

		model.addObject("insertResult", insertResultAttributeModel);

		insertResult = "";

		return model;

	}

	// Fim agendamento

	// Clientes
	// Cadastro
	@RequestMapping(value = "/gerenciarClientes", method = RequestMethod.GET)
	public ModelAndView clientes() {

		if (!loginCheckedContext.equals("erroLogin")) {
			if (funcionarioLoaded.getPerfil().equalsIgnoreCase("adm") && funcionarioLoaded.getEstado().equals("1")) {

				return new ModelAndView("gerenciarClientes", "command", new ClienteTO());
			} else {
				return new ModelAndView("acessoRestrito");
			}

		} else {
			return new ModelAndView(loginCheckedContext, "command", null);
		}
	}

	@RequestMapping(value = "/salvarClienteCadastrado", method = RequestMethod.POST)
	public ModelAndView salvarCliente(ClienteTO cliente, ModelAndView model) {

		clienteFacade.saveClient(cliente);
		String insertResultModelAttribute = insertResult;

		model = new ModelAndView("gerenciarClientes", "command", new ClienteTO());

		model.addObject("insertResult", insertResultModelAttribute);

		insertResult = "";
		return new ModelAndView(loginCheckedContext, "command", null);
	}

	// busca para editar
	@RequestMapping(value = "/editarDeletarCliente", method = RequestMethod.GET)
	public ModelAndView editarDeletarCliente(Model model) {

		JdbcManager dataBaseTools = new JdbcManager();

		ResultSet clientes = dataBaseTools.selectJdbc("SELECT * FROM public.cliente");

		ConversorDatas dateTool = new ConversorDatas();

		ArrayList<ClienteTO> listaClientes = new ArrayList<ClienteTO>();

		try {
			while (clientes.next()) {
				ClienteTO cliente = new ClienteTO();

				cliente.setNome(clientes.getString("nome"));
				cliente.setEmail(clientes.getString("email"));
				cliente.setCpf(clientes.getString("cpf"));
				cliente.setTelRes(clientes.getString("telefone"));
				cliente.setTelCel(clientes.getString("celular"));
				cliente.setSexo(clientes.getString("sexo"));
				cliente.setNascimento(dateTool.converterDataUsParaBr(clientes.getString("dataNascimento")));
				cliente.setIdCliente(clientes.getString("idCliente"));

				listaClientes.add(cliente);

			}

			log.gravarLog(listaClientes.toString());

			model.addAttribute("listaClientes", listaClientes);

		} catch (SQLException e) {
			log.gravarLog(e.toString());
		}

		model.addAttribute("command");

		if (!loginCheckedContext.equals("erroLogin")) {
			if (funcionarioLoaded.getPerfil().equalsIgnoreCase("adm") && funcionarioLoaded.getEstado().equals("1")) {

				return new ModelAndView("editarDeletarCliente", "command", new ClienteTO());
			} else {
				return new ModelAndView("acessoRestrito");
			}
		} else {
			return new ModelAndView(loginCheckedContext, "command", null);
		}

	}

	// formulario de edicao
	@RequestMapping(value = "/formularioDeEdicaoCliente", method = RequestMethod.POST)
	public String formularioDeEdicaoCliente(@ModelAttribute("command") ClienteTO cliente, ModelMap model) {

		JdbcManager dataBaseTools = new JdbcManager();
		ResultSet dadosEditarCliente = null;

		dadosEditarCliente = dataBaseTools
				.selectJdbc("SELECT * FROM public.cliente WHERE idCliente='" + cliente.getIdCliente() + "'");

		ConversorDatas dateTools = new ConversorDatas();

		try {
			while (dadosEditarCliente.next()) {
				cliente.setNome(dadosEditarCliente.getString("nome"));
				cliente.setNascimento(dateTools.converterDataUsParaBr(dadosEditarCliente.getString("dataNascimento")));
				cliente.setCpf(dadosEditarCliente.getString("cpf"));
				cliente.setSexo(dadosEditarCliente.getString("sexo"));
				cliente.setEmail(dadosEditarCliente.getString("email"));
				cliente.setTelCel(dadosEditarCliente.getString("celular"));
				cliente.setTelRes(dadosEditarCliente.getString("telefone"));
				cliente.setIdCliente(dadosEditarCliente.getString("idCliente"));

				System.out.println(cliente.getNome().toString());

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		codigoClienteSendoEditado = cliente.getIdCliente();

		model.addAttribute("nome", cliente.getNome());
		model.addAttribute("nascimento", cliente.getNascimento());
		model.addAttribute("sexo", cliente.getSexo());
		model.addAttribute("email", cliente.getEmail());
		model.addAttribute("telRes", cliente.getTelRes());
		model.addAttribute("telCel", cliente.getTelCel());
		model.addAttribute("cpf", cliente.getCpf());
		if (funcionarioLoaded.getPerfil().equalsIgnoreCase("adm") && funcionarioLoaded.getEstado().equals("1")) {

			return "formularioDeEdicaoCliente";
		} else {
			return "acessoRestrito";
		}

	}

	// salvar edicao
	@RequestMapping(value = "/salvarClienteEditado", method = RequestMethod.POST)
	public ModelAndView salvarClienteEditado(ClienteTO cliente, ModelAndView model) {

		JdbcManager dataBaseTools = new JdbcManager();
		ConversorDatas dateTool = new ConversorDatas();

		try {

			insertResult = dataBaseTools.updateJdbc("UPDATE public.cliente SET " + "`nome`='" + cliente.getNome()
					+ "', `celular`='" + cliente.getTelCel() + "', `telefone`='" + cliente.getTelRes() + "', `email`='"
					+ cliente.getEmail() + "', `dataNascimento`='"
					+ dateTool.converterDataBrParaUS(cliente.getNascimento()) + "', `sexo`='" + cliente.getSexo()
					+ "', `cpf`='" + cliente.getCpf() + "', `dataAlteracao`= NOW() WHERE idcliente = '"
					+ codigoClienteSendoEditado + "'"

			);
			if (insertResult.equals("1")) {
				model = new ModelAndView("formularioDeEdicaoCliente", "command", new ClienteTO());

				String insertResultAttributeModel = insertResult;

				insertResult = "";

				model.addObject("insertResult", insertResultAttributeModel);
				return model;
			} else {
				model = new ModelAndView("formularioDeEdicaoCliente", "command", new ClienteTO());

				String insertResultAttributeModel = insertResult;

				insertResult = "";

				model.addObject("insertResult", insertResultAttributeModel);
				return model;
			}
		} catch (Exception e) {
			model = new ModelAndView("formularioDeEdicaoCliente", "command", new ClienteTO());

			String insertResultAttributeModel = insertResult;

			insertResult = "";

			model.addObject("insertResult", insertResultAttributeModel);
			return model;
		}

	}

	// deletar cliente
	@RequestMapping(value = "/deletarCliente", method = RequestMethod.POST)
	public ModelAndView deletarCliente(ClienteTO cliente, ModelAndView model) {

		JdbcManager dataBaseTools = new JdbcManager();

		insertResult = dataBaseTools
				.deleteJdbc("DELETE FROM public.cliente WHERE idCliente='" + codigoClienteSendoEditado + "'");

		model = new ModelAndView("formularioDeEdicaoCliente", "command", new ClienteTO());

		String insertResultAttributeModel = insertResult;

		insertResult = "";

		model.addObject("insertResult", insertResultAttributeModel);
		return model;

	}

	// Relatorio
	@RequestMapping(value = "/relatorioClientes")
	public ModelAndView relatorioClientes(@ModelAttribute("command") ClienteTO cliente) {

		JdbcManager dataBaseTools = new JdbcManager();

		ResultSet clientes = dataBaseTools.selectJdbc("SELECT * FROM public.cliente ORDER BY dataInclusao");

		ArrayList<ClienteTO> listaClientes = new ArrayList<ClienteTO>();

		ModelAndView model = new ModelAndView("relatorioClientes");

		ConversorDatas dateTool = new ConversorDatas();

		String inicio = "";
		String fim = "";

		try {
			while (clientes.next()) {
				inicio = cliente.getDataPesquisaInicio();
				fim = cliente.getDataPesquisaFim();

				cliente = new ClienteTO();

				cliente.setNome(clientes.getString("nome"));
				cliente.setEmail(clientes.getString("email"));
				cliente.setCpf(clientes.getString("cpf"));
				cliente.setTelRes(clientes.getString("telefone"));
				cliente.setTelCel(clientes.getString("celular"));
				cliente.setSexo(clientes.getString("sexo"));
				cliente.setNascimento(clientes.getString("dataNascimento"));
				// cliente.setDataInclusao(dateTool.converterDataUsParaBr(clientes.getString("dataInclusao")));

				listaClientes.add(cliente);

				cliente.setDataPesquisaInicio(inicio);
				cliente.setDataPesquisaFim(fim);

				log.gravarLog("Exibindo dados Recuperados:\n" + clientes.getString("nome") + "\n"
						+ clientes.getString("email") + "\n" + clientes.getString("cpf") + "\n"
						+ clientes.getString("telefone") + "\n" + clientes.getString("celular") + "\n"
						+ clientes.getString("sexo") + "\n" + clientes.getString("dataNascimento") + "\n"
						+ clientes.getString("dataInclusao") + "\n\n");
			}

			model.addObject("listaClientes", listaClientes);
			model.addObject("dataPesquisaInicio", cliente.getDataPesquisaInicio());
			model.addObject("dataPesquisaFim", cliente.getDataPesquisaFim());

		} catch (SQLException e) {
			log.gravarLog(e.toString());
		}

		if (!loginCheckedContext.equals("erroLogin")) {
			if (funcionarioLoaded.getPerfil().equalsIgnoreCase("adm") && funcionarioLoaded.getEstado().equals("1")) {

				return model;
			} else {
				return new ModelAndView("acessoRestrito");
			}
		} else {
			return new ModelAndView("erroLogin");
		}
	}

	// Fim cliente

	// Funcionario
	// Cadastro
	@RequestMapping(value = "/gerenciarFuncionarios", method = RequestMethod.GET)
	public ModelAndView funcionario() {

		if (!loginCheckedContext.equals("erroLogin")) {
			if (funcionarioLoaded.getPerfil().equalsIgnoreCase("adm") && funcionarioLoaded.getEstado().equals("1")) {

				return new ModelAndView("gerenciarFuncionarios", "command", new FuncionarioTO());
			} else {
				return new ModelAndView("acessoRestrito");
			}
		} else {
			return new ModelAndView(loginCheckedContext, "command", null);
		}

	}

	// Salvar cadastro
	@RequestMapping(value = "/salvarFuncionarioCadastrado", method = RequestMethod.POST)
	public ModelAndView salvarFuncionario(FuncionarioTO funcionario, ModelAndView model) {

		funcionarioFacade.saveFuncionario(funcionario);

		String insertResultModelAttribute = insertResult;

		model = new ModelAndView("gerenciarFuncionarios", "command", new FuncionarioTO());
		model.addObject("insertResult", insertResultModelAttribute);
		insertResult = "";
		return model;

	}

	// busca para editar
	@RequestMapping(value = "/editarDeletarFuncionario", method = RequestMethod.GET)
	public ModelAndView editarDeletarFuncionario(Model model) {

		model.addAttribute("command");

		if (!loginCheckedContext.equals("erroLogin")) {
			if (funcionarioLoaded.getPerfil().equalsIgnoreCase("adm") && funcionarioLoaded.getEstado().equals("1")) {

				return new ModelAndView("editarDeletarFuncionario", "command", new FuncionarioTO());
			} else {
				return new ModelAndView("acessoRestrito");
			}
		} else {
			return new ModelAndView(loginCheckedContext, "command", null);
		}

	}

	// formulario de edicao
	@RequestMapping(value = "/formularioDeEdicaoFuncionario", method = RequestMethod.POST)
	public String formularioDeEdicaoFuncionario(@ModelAttribute("command") FuncionarioTO funcionario, ModelMap model) {

		JdbcManager dataBaseTools = new JdbcManager();
		ResultSet dadosEditarFuncionario = null;

		dadosEditarFuncionario = dataBaseTools
				.selectJdbc("SELECT * FROM public.funcionario WHERE cpf='" + funcionario.getCpf() + "'");

		ConversorDatas dateTools = new ConversorDatas();

		try {
			while (dadosEditarFuncionario.next()) {
				funcionario.setNome(dadosEditarFuncionario.getString("nome"));
				funcionario.setEstadoCivil(dadosEditarFuncionario.getString("estadoCivil"));
				funcionario.setRg(dadosEditarFuncionario.getString("rg"));
				funcionario.setCpf(dadosEditarFuncionario.getString("cpf"));
				funcionario.setNascimento(
						dateTools.converterDataUsParaBr(dadosEditarFuncionario.getString("dataNascimento")));
				funcionario.setTelRes(dadosEditarFuncionario.getString("telefone"));
				funcionario.setTelCel(dadosEditarFuncionario.getString("celular"));
				funcionario.setLogradouro(dadosEditarFuncionario.getString("logradouro"));
				funcionario.setNumero(dadosEditarFuncionario.getString("numero"));
				funcionario.setBairro(dadosEditarFuncionario.getString("bairro"));
				funcionario.setCidade(dadosEditarFuncionario.getString("cidade"));
				funcionario.setUf(dadosEditarFuncionario.getString("uf"));
				funcionario.setCep(dadosEditarFuncionario.getString("cep"));
				funcionario.setComplemento(dadosEditarFuncionario.getString("complemento"));
				funcionario.setTipoFuncionario(dadosEditarFuncionario.getString("tipoFuncionario"));
				funcionario.setCarteiraTrabalho(dadosEditarFuncionario.getString("carteiraTrabalho"));
				funcionario.setDataInclusao(
						dateTools.converterDataUsParaBr(dadosEditarFuncionario.getString("dataInclusao")));
				funcionario.setSexo(dadosEditarFuncionario.getString("sexo"));
				funcionario.setCodFunc(dadosEditarFuncionario.getString("codigoFuncionario"));
				funcionario.setEstado(dadosEditarFuncionario.getString("statusFuncionario"));
				funcionario.setSalarioFixo(dadosEditarFuncionario.getString("salario"));
				funcionario.setEmail(dadosEditarFuncionario.getString("email"));
				funcionario.setSenha(dadosEditarFuncionario.getString("senha"));
				funcionario.setPerfil(dadosEditarFuncionario.getString("perfil"));

				System.out.println(funcionario.getNome() + "," + funcionario.getEstadoCivil() + ","
						+ funcionario.getRg() + "," + funcionario.getCpf() + "," + funcionario.getNascimento() + ","
						+ funcionario.getTelRes() + "," + funcionario.getTelCel() + "," + funcionario.getLogradouro()
						+ "," + funcionario.getNumero() + "," + funcionario.getBairro() + "," + funcionario.getCidade()
						+ "," + funcionario.getUf() + "," + funcionario.getCep() + "," + funcionario.getComplemento()
						+ "," + funcionario.getTipoFuncionario() + "," + funcionario.getCarteiraTrabalho() + ","
						+ funcionario.getDataInclusao() + "," + funcionario.getSexo() + "," + funcionario.getCodFunc()
						+ "," + funcionario.getEstado() + "," + funcionario.getSalarioFixo() + ","
						+ funcionario.getEmail() + "," + funcionario.getSenha() + "," + funcionario.getPerfil()

				);

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		cpfCadastradoEmUsuarioSendoEditado = funcionario.getCpf();
		model.addAttribute("nome", funcionario.getNome());
		model.addAttribute("estadoCivil", funcionario.getEstadoCivil());
		model.addAttribute("rg", funcionario.getRg());
		model.addAttribute("cpf", funcionario.getCpf());
		model.addAttribute("nascimento", funcionario.getNascimento());
		model.addAttribute("telRes", funcionario.getTelRes());
		model.addAttribute("telCel", funcionario.getTelCel());
		model.addAttribute("logradouro", funcionario.getLogradouro());
		model.addAttribute("numero", funcionario.getNumero());
		model.addAttribute("bairro", funcionario.getBairro());
		model.addAttribute("cidade", funcionario.getCidade());
		model.addAttribute("uf", funcionario.getUf());
		model.addAttribute("cep", funcionario.getCep());
		model.addAttribute("complemento", funcionario.getComplemento());
		model.addAttribute("tipoFuncionario", funcionario.getTipoFuncionario());
		model.addAttribute("carteiraTrabalho", funcionario.getCarteiraTrabalho());
		model.addAttribute("dataInclusao", funcionario.getDataInclusao());
		model.addAttribute("sexo", funcionario.getSexo());
		model.addAttribute("codFunc", funcionario.getCodFunc());
		model.addAttribute("estado", funcionario.getEstado());
		model.addAttribute("salarioFixo", funcionario.getSalarioFixo());
		model.addAttribute("email", funcionario.getEmail());
		model.addAttribute("senha", funcionario.getSenha());
		model.addAttribute("perfil", funcionario.getPerfil());

		// ======

		return "formularioDeEdicaoFuncionario";
	}

	// salvar edicao
	@RequestMapping(value = "/salvarFuncionarioEditado", method = RequestMethod.POST)
	public ModelAndView salvarFuncionarioEditado(FuncionarioTO funcionario, ModelAndView model) {

		JdbcManager dataBaseTools = new JdbcManager();

		try {

			ConversorDatas dateTool = new ConversorDatas();

			insertResult = dataBaseTools.updateJdbc("UPDATE public.funcionario SET" + "	`nome`='"
					+ funcionario.getNome() + "', `estadoCivil`='" + funcionario.getEstadoCivil() + "', `rg`='"
					+ funcionario.getRg() + "', `cpf`='" + funcionario.getCpf() + "', `dataNascimento`='"
					+ dateTool.converterDataBrParaUS(funcionario.getNascimento()) + "', `telefone`='"
					+ funcionario.getTelRes() + "', `celular`='" + funcionario.getTelCel() + "', `logradouro`='"
					+ funcionario.getLogradouro() + "', `numero`='" + funcionario.getNumero() + "', `bairro`='"
					+ funcionario.getBairro() + "', `cidade`='" + funcionario.getCidade() + "', `uf`='"
					+ funcionario.getUf() + "', `cep`='" + funcionario.getCep() + "', `complemento`='"
					+ funcionario.getComplemento() + "', `tipoFuncionario`='" + funcionario.getTipoFuncionario()
					+ "', `carteiraTrabalho`='" + funcionario.getCarteiraTrabalho() + "', `statusFuncionario`='"
					+ funcionario.getEstado() + "', `dataInclusao`='"
					+ dateTool.converterDataBrParaUS(funcionario.getDataInclusao()) + "', `codigoFuncionario`='"
					+ funcionario.getCodFunc() + "', `salario`='" + funcionario.getSalarioFixo() + "', `email`='"
					+ funcionario.getEmail() + "', `senha`='" + funcionario.getSenha() + "', `perfil`='"
					+ funcionario.getPerfil() + "', `dataAlteracao`=NOW()" + ", `sexo`='" + funcionario.getSexo()
					+ "'  WHERE cpf='" + cpfCadastradoEmUsuarioSendoEditado + "'");

			System.out.println("insertResult - EDT_FUNC: " + insertResult);

			if (insertResult.equals("1")) {

				System.out.println("Criando modelo Ststus 1 insertResult - EDT_FUNC: " + insertResult);

				model = new ModelAndView("formularioDeEdicaoFuncionario", "command", new FuncionarioTO());

				String insertResultAttributeModel = insertResult;

				insertResult = "";

				model.addObject("insertResult", insertResultAttributeModel);
				return model;
			} else {
				System.out.println("Criando modelo Ststus x insertResult - EDT_FUNC: " + insertResult);
				model = new ModelAndView("formularioDeEdicaoFuncionario", "command", new FuncionarioTO());

				String insertResultAttributeModel = insertResult;

				insertResult = "";

				model.addObject("insertResult", insertResultAttributeModel);
				return model;
			}
		} catch (Exception e) {

			System.out.println("Criando modelo Ststus 1 - EXCEPTION insertResult - EDT_FUNC: " + insertResult);

			model = new ModelAndView("formularioDeEdicaoFuncionario", "command", new FuncionarioTO());

			String insertResultAttributeModel = insertResult;

			insertResult = "";

			model.addObject("insertResult", insertResultAttributeModel);
			return model;
		}

	}

	// deletar funcionario
	@RequestMapping(value = "/deletarFuncionario", method = RequestMethod.POST)
	public ModelAndView deletarFuncionario(FuncionarioTO funcionario, ModelAndView model) {

		JdbcManager dataBaseTools = new JdbcManager();

		insertResult = dataBaseTools
				.deleteJdbc("DELETE FROM public.funcionario WHERE cpf='" + funcionario.getCpf() + "'");

		model = new ModelAndView("formularioDeEdicaoFuncionario", "command", new FuncionarioTO());

		String insertResultAttributeModel = insertResult;

		insertResult = "";

		model.addObject("insertResult", insertResultAttributeModel);
		return model;

	}

	// Relatorio
	@RequestMapping(value = "/relatorioFuncionarios")
	public ModelAndView relatorioFuncionarios(@ModelAttribute("command") FuncionarioTO funcionario) {

		JdbcManager dataBaseTools = new JdbcManager();

		ResultSet funcionarios = dataBaseTools.selectJdbc("SELECT * FROM public.funcionario ORDER BY dataInclusao");

		ArrayList<FuncionarioTO> listaFuncionarios = new ArrayList<FuncionarioTO>();

		ConversorDatas dateTool = new ConversorDatas();

		String inicio = "";
		String fim = "";

		ModelAndView model = new ModelAndView("relatorioFuncionarios");

		try {
			while (funcionarios.next()) {

				inicio = funcionario.getDataPesquisaInicio();
				fim = funcionario.getDataPesquisaFim();

				funcionario = new FuncionarioTO();

				funcionario.setNome(funcionarios.getString("nome"));
				funcionario.setRg(funcionarios.getString("rg"));
				funcionario.setCpf(funcionarios.getString("cpf"));
				funcionario.setTelRes(funcionarios.getString("telefone"));
				funcionario.setTelCel(funcionarios.getString("celular"));
				funcionario.setTipoFuncionario(funcionarios.getString("tipoFuncionario"));
				funcionario.setCodFunc(funcionarios.getString("codigoFuncionario"));
				funcionario.setEstado(funcionarios.getString("statusFuncionario"));

				funcionario.setDataInclusao(dateTool.converterDataUsParaBr(funcionarios.getString("dataInclusao")));

				funcionario.setDataPesquisaInicio(inicio);
				funcionario.setDataPesquisaFim(fim);

				System.out.println("Banco " + funcionarios.getString("statusFuncionario"));
				System.out.println(funcionario.getEstado());

				listaFuncionarios.add(funcionario);

			}

			model.addObject("listaFuncionarios", listaFuncionarios);
			model.addObject("dataPesquisaInicio", funcionario.getDataPesquisaInicio());
			model.addObject("dataPesquisaFim", funcionario.getDataPesquisaFim());

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (!loginCheckedContext.equals("erroLogin")) {
			if (funcionarioLoaded.getPerfil().equalsIgnoreCase("adm") && funcionarioLoaded.getEstado().equals("1")) {

				return model;
			} else {
				return new ModelAndView("acessoRestrito");
			}
		} else {
			return new ModelAndView("erroLogin");
		}
	}

	// Fim funcionario

	// Despesa
	// Cadastro
	@RequestMapping(value = "/gerenciarDespesas", method = RequestMethod.GET)
	public ModelAndView despesas() {

		if (!loginCheckedContext.equals("erroLogin")) {
			if (funcionarioLoaded.getPerfil().equalsIgnoreCase("adm") && funcionarioLoaded.getEstado().equals("1")) {
				return new ModelAndView("gerenciarDespesas", "command", new DespesasTO());
			} else {
				return new ModelAndView("acessoRestrito");
			}
		} else {
			return new ModelAndView(loginCheckedContext, "command", null);
		}

	}

	// Salvar cadastro
	@RequestMapping(value = "/salvarDespesa", method = RequestMethod.POST)
	public ModelAndView salvarDespesa(DespesasTO despesa, ModelAndView model) {
		
		despesaFacade.saveExpense(despesa);

			String insertResultModelAttribute = insertResult;

			model = new ModelAndView("gerenciarDespesas", "command", new DespesasTO());

			model.addObject("insertResult", insertResultModelAttribute);
			insertResult = "";
			return model;

	}

	// busca para editar
	@RequestMapping(value = "/editarDeletarDespesa", method = RequestMethod.GET)
	public ModelAndView editarDeletarDespesa(Model model) {

		model.addAttribute("command");
		if (funcionarioLoaded.getPerfil().equalsIgnoreCase("adm") && funcionarioLoaded.getEstado().equals("1")) {

			if (!loginCheckedContext.equals("erroLogin")) {
				return new ModelAndView("editarDeletarDespesa", "command", new DespesasTO());
			} else {
				return new ModelAndView("acessoRestrito");
			}
		} else {
			return new ModelAndView(loginCheckedContext, "command", null);
		}

	}

	// formulario de edicao
	@RequestMapping(value = "/formularioDeEdicaoDespesa", method = RequestMethod.POST)
	public String formularioDeEdicaoDespesa(@ModelAttribute("command") DespesasTO despesa, ModelMap model) {

		JdbcManager dataBaseTools = new JdbcManager();
		ResultSet dadosEditarDespesa = null;

		dadosEditarDespesa = dataBaseTools
				.selectJdbc("SELECT * FROM public.despesa WHERE codigo='" + despesa.getCodigo() + "'");

		ConversorDatas dateTools = new ConversorDatas();

		try {
			while (dadosEditarDespesa.next()) {
				despesa.setDsDespesa(dadosEditarDespesa.getString("dsDespesa"));
				despesa.setTipoDespesa(dadosEditarDespesa.getString("tipoDespesa"));
				despesa.setValor(dadosEditarDespesa.getString("valor"));
				despesa.setDataInclusao(dateTools.converterDataUsParaBr(dadosEditarDespesa.getString("dataInclusao")));
				despesa.setCodigo(dadosEditarDespesa.getString("codigo"));

				System.out.println(despesa.getDsDespesa());

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		codigoEmDespesaSendoEditado = despesa.getCodigo();

		model.addAttribute("codigo", despesa.getCodigo());
		model.addAttribute("tipoDespesa", despesa.getTipoDespesa());
		model.addAttribute("dsDespesa", despesa.getDsDespesa());
		model.addAttribute("valor", despesa.getValor());
		model.addAttribute("dataInclusao", despesa.getDataInclusao());

		return "formularioDeEdicaoDespesa";
	}

	// salvar edicao
	// TO-DO
	@RequestMapping(value = "/salvarDespesaEditada", method = RequestMethod.POST)
	public ModelAndView salvarDespesaEditada(DespesasTO despesa, ModelAndView model) {

		ConversorDatas dateTool = new ConversorDatas();

		JdbcManager dataBaseTools = new JdbcManager();

		try {

			insertResult = dataBaseTools.updateJdbc("UPDATE public.despesa SET codigo='" + despesa.getCodigo()
					+ "',tipoDespesa='" + despesa.getTipoDespesa() + "',dsDespesa= '" + despesa.getDsDespesa()
					+ "',valor= '" + despesa.getValor() + "',dataInclusao= '"
					+ dateTool.converterDataBrParaUS(despesa.getDataInclusao()) + "' WHERE codigo='"
					+ codigoEmDespesaSendoEditado + "'");

			if (insertResult.equals("1")) {
				model = new ModelAndView("formularioDeEdicaoDespesa", "command", new DespesasTO());

				String insertResultAttributeModel = insertResult;

				model.addObject("insertResult", insertResultAttributeModel);

				insertResult = "";

				return model;
			} else {
				model = new ModelAndView("formularioDeEdicaoDespesa", "command", new DespesasTO());

				String insertResultAttributeModel = insertResult;

				model.addObject("insertResult", insertResultAttributeModel);

				insertResult = "";

				return model;
			}
		} catch (Exception e) {
			model = new ModelAndView("formularioDeEdicaoDespesa", "command", new DespesasTO());

			String insertResultAttributeModel = insertResult;

			model.addObject("insertResult", insertResultAttributeModel);

			insertResult = "";

			return model;
		}

	}

	// deletar despesa
	@RequestMapping(value = "/deletarDespesa", method = RequestMethod.POST)
	public ModelAndView deletarDespesa(DespesasTO despesa, ModelAndView model) {

		JdbcManager dataBaseTools = new JdbcManager();

		insertResult = dataBaseTools
				.deleteJdbc("DELETE FROM public.despesa WHERE codigo='" + codigoEmDespesaSendoEditado + "'");

		model = new ModelAndView("formularioDeEdicaoDespesa", "command", new DespesasTO());

		String insertResultAttributeModel = insertResult;

		model.addObject("insertResult", insertResultAttributeModel);

		insertResult = "";

		return model;

	}

	// Relatorio

	@RequestMapping(value = "/relatorioDespesas")
	public ModelAndView relatorioDespesas(@ModelAttribute("command") DespesasTO despesa) {

		JdbcManager dataBaseTools = new JdbcManager();

		ResultSet despesas = dataBaseTools.selectJdbc("SELECT * FROM public.despesa ORDER BY dataInclusao");

		ArrayList<DespesasTO> listaDespesas = new ArrayList<DespesasTO>();

		ModelAndView model = new ModelAndView("relatorioDespesas");

		ConversorDatas dateTool = new ConversorDatas();

		String inicio = "";
		String fim = "";

		try {
			while (despesas.next()) {
				inicio = despesa.getDataPesquisaInicio();
				fim = despesa.getDataPesquisaFim();
				despesa = new DespesasTO();

				despesa.setTipoDespesa(despesas.getString("tipoDespesa"));
				despesa.setDataInclusao(dateTool.converterDataUsParaBr(despesas.getString("dataInclusao")));
				despesa.setDsDespesa(despesas.getString("dsDespesa"));
				despesa.setCodigo(despesas.getString("codigo"));
				despesa.setValor(despesas.getString("valor"));

				despesa.setDataPesquisaInicio(inicio);
				despesa.setDataPesquisaFim(fim);
				System.out.println(despesa.getCodigo());
				listaDespesas.add(despesa);

			}

			model.addObject("listaDespesas", listaDespesas);
			model.addObject("dataPesquisaInicio", despesa.getDataPesquisaInicio());
			model.addObject("dataPesquisaFim", despesa.getDataPesquisaFim());

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (!loginCheckedContext.equals("erroLogin")) {
			if (funcionarioLoaded.getPerfil().equalsIgnoreCase("adm") && funcionarioLoaded.getEstado().equals("1")) {

				return model;
			} else {
				return new ModelAndView("acessoRestrito");
			}
		} else {
			return new ModelAndView("erroLogin");
		}
	}

	// Fim despesa

	// Servicos Realizados
	// cadastro
	@RequestMapping(value = "/gerenciarServicosRealizados", method = RequestMethod.GET)
	public ModelAndView gerenciarServicosRealizados() {
		if (!loginCheckedContext.equals("erroLogin")) {
			if (funcionarioLoaded.getEstado().equals("1")) {

				JdbcManager dataBaseTools = new JdbcManager();

				ArrayList<String> nomesClientes = new ArrayList<String>();

				ArrayList<String> nomesFuncionarios = new ArrayList<String>();

				ResultSet getNomeClientes = dataBaseTools.selectJdbc("SELECT nome FROM public.cliente");

				ResultSet getNomeFuncionarios = dataBaseTools.selectJdbc(
						"SELECT nome FROM public.funcionario WHERE perfil = 'func' AND statusFuncionario = '1'");

				// popular lista de clientes

				try {
					while (getNomeClientes.next()) {

						nomesClientes.add(getNomeClientes.getString("nome"));
					}

					while (getNomeFuncionarios.next()) {

						nomesFuncionarios.add(getNomeFuncionarios.getString("nome"));
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				ModelAndView model = new ModelAndView("gerenciarServicosRealizados", "command",
						new LancamentoServicoTO());

				model.addObject("nomesClientes", nomesClientes);
				model.addObject("nomesFuncionarios", nomesFuncionarios);

				return model;
			} else {
				return new ModelAndView("acessoRestrito");
			}
		} else {
			return new ModelAndView(loginCheckedContext, "command", null);
		}

	}

	// Salvar cadastro
	@RequestMapping(value = "/salvarServicoRealizado", method = RequestMethod.POST)
	public ModelAndView salvarServicoRealizado(LancamentoServicoTO registroServicoLancado, ModelAndView model) {

		JdbcManager dataBaseTools = new JdbcManager();

		try {

			ConversorDatas dateTool = new ConversorDatas();
			insertResult = dataBaseTools.insertJdbc("INSERT INTO public.lancamentoOrdemServico"
					+ " (`nomeCliente`, `comanda`, `alicate`,`tipoFuncionario`,"
					+ " `dataInclusao`, `manicurePreco`, `pedicurePreco`, `francesinhaPreco`, `esmaltarPreco`, `pernaintPreco`, `perna12Preco`,"
					+ " `virilhaPreco`, `intimaPreco`, `axilaPreco`, `sobrancelhaPreco`, `bucoPreco`, `preco`,"
					+ " `formaPagamento`, `nomeFuncionario`) " + "VALUES('" + registroServicoLancado.getNomeCliente()
					+ "','" + registroServicoLancado.getComanda() + "','" + registroServicoLancado.getAlicate() + "','"
					+ registroServicoLancado.getTipoFuncionario() + "','"
					+ dateTool.converterDataBrParaUS(registroServicoLancado.getDataInclusao()) + "','"
					+ registroServicoLancado.getManicurePreco() + "','" + registroServicoLancado.getPedicurePreco()
					+ "','" + registroServicoLancado.getFrancesinhaPreco() + "','"
					+ registroServicoLancado.getEsmaltarPreco() + "','" + registroServicoLancado.getPernaintPreco()
					+ "','" + registroServicoLancado.getPerna12Preco() + "','"
					+ registroServicoLancado.getVirilhaPreco() + "','" + registroServicoLancado.getIntimaPreco() + "','"
					+ registroServicoLancado.getAxilaPreco() + "','" + registroServicoLancado.getSobrancelhaPreco()
					+ "','" + registroServicoLancado.getBucoPreco() + "','" + registroServicoLancado.getPreco() + "','"
					+ registroServicoLancado.getFormaPagamento() + "','" + registroServicoLancado.getNomeFuncionario()
					+ "')");

			if (insertResult.equals("1")) {
				String insertResultModelAttribute = insertResult;

				model = new ModelAndView("gerenciarServicosRealizados", "command", new LancamentoServicoTO());

				model.addObject("insertResult", insertResultModelAttribute);
				insertResult = "";
				return model;
			} else {
				String insertResultModelAttribute = insertResult;

				model = new ModelAndView("gerenciarServicosRealizados", "command", new LancamentoServicoTO());

				model.addObject("insertResult", insertResultModelAttribute);
				insertResult = "";
				return model;
			}

		} catch (Exception e) {
			String insertResultModelAttribute = insertResult;

			model = new ModelAndView("gerenciarServicosRealizados", "command", new LancamentoServicoTO());

			model.addObject("insertResult", insertResultModelAttribute);
			insertResult = "";
			return model;
		}
	}

	// Busca para editar

	@RequestMapping(value = "/editarDeletarServicoRealizado", method = RequestMethod.GET)
	public ModelAndView editarDeletarServicoRealizado(Model model) {

		JdbcManager dataBaseTools = new JdbcManager();

		ResultSet servicosPrestados = dataBaseTools.selectJdbc(
				"SELECT * FROM public.lancamentoOrdemServico WHERE dataInclusao != '0001-01-01' ORDER BY nomeCliente,dataInclusao");

		ConversorDatas dateTool = new ConversorDatas();

		ArrayList<LancamentoServicoTO> listaServicos = new ArrayList<LancamentoServicoTO>();

		try {
			while (servicosPrestados.next()) {
				LancamentoServicoTO servico = new LancamentoServicoTO();

				servico.setIdLancamento(servicosPrestados.getString("idLancamento"));

				servico.setNomeCliente(servicosPrestados.getString("nomeCliente"));

				servico.setComanda(servicosPrestados.getString("comanda"));

				servico.setAlicate(servicosPrestados.getString("alicate"));

				servico.setTipoFuncionario(servicosPrestados.getString("tipoFuncionario"));

				servico.setDataInclusao(dateTool.converterDataUsParaBr(servicosPrestados.getString("dataInclusao")));

				servico.setManicurePreco(servicosPrestados.getString("manicurePreco"));

				servico.setPedicurePreco(servicosPrestados.getString("pedicurePreco"));

				servico.setFrancesinhaPreco(servicosPrestados.getString("francesinhaPreco"));

				servico.setEsmaltarPreco(servicosPrestados.getString("esmaltarPreco"));

				servico.setPernaintPreco(servicosPrestados.getString("pernaintPreco"));

				servico.setPerna12Preco(servicosPrestados.getString("perna12Preco"));

				servico.setVirilhaPreco(servicosPrestados.getString("virilhaPreco"));

				servico.setIntimaPreco(servicosPrestados.getString("intimaPreco"));

				servico.setAxilaPreco(servicosPrestados.getString("axilaPreco"));

				servico.setSobrancelhaPreco(servicosPrestados.getString("sobrancelhaPreco"));

				servico.setBucoPreco(servicosPrestados.getString("bucoPreco"));

				servico.setPreco(servicosPrestados.getString("preco"));

				servico.setFormaPagamento(servicosPrestados.getString("formaPagamento"));

				servico.setNomeFuncionario(servicosPrestados.getString("nomeFuncionario"));

				listaServicos.add(servico);

			}

			log.gravarLog(listaServicos.toString());

			System.out.println("primeiro item da lista: " + listaServicos.get(0).getIdLancamento());

			model.addAttribute("listaServicos", listaServicos);

		} catch (SQLException e) {
			log.gravarLog(e.toString());
		}

		model.addAttribute("command");

		if (!loginCheckedContext.equals("erroLogin")) {
			if (funcionarioLoaded.getPerfil().equalsIgnoreCase("adm") && funcionarioLoaded.getEstado().equals("1")) {

				return new ModelAndView("editarDeletarServicoRealizado", "command", new LancamentoServicoTO());
			} else {
				return new ModelAndView("acessoRestrito");
			}
		} else {
			return new ModelAndView(loginCheckedContext, "command", null);
		}

	}

	@RequestMapping(value = "/formularioDeEdicaoServicoRealizado", method = RequestMethod.POST)
	public String formularioDeEdicaoServicosRealizados(@ModelAttribute("command") LancamentoServicoTO servicos,
			ModelMap model) {

		JdbcManager dataBaseTools = new JdbcManager();

		ResultSet servicosPrestados = null;

		servicosPrestados = dataBaseTools.selectJdbc("SELECT * FROM public.lancamentoOrdemServico WHERE idLancamento ='"
				+ servicos.getIdLancamento() + "' AND dataInclusao != '0001-01-01' ORDER BY nomeCliente,dataInclusao");

		ConversorDatas dateTools = new ConversorDatas();

		try {
			while (servicosPrestados.next()) {

				servicos.setIdLancamento(servicosPrestados.getString("idLancamento"));

				servicos.setNomeCliente(servicosPrestados.getString("nomeCliente"));

				servicos.setComanda(servicosPrestados.getString("comanda"));

				servicos.setAlicate(servicosPrestados.getString("alicate"));

				servicos.setTipoFuncionario(servicosPrestados.getString("tipoFuncionario"));

				servicos.setDataInclusao(dateTools.converterDataUsParaBr(servicosPrestados.getString("dataInclusao")));

				servicos.setManicurePreco(servicosPrestados.getString("manicurePreco"));

				servicos.setPedicurePreco(servicosPrestados.getString("pedicurePreco"));

				servicos.setFrancesinhaPreco(servicosPrestados.getString("francesinhaPreco"));

				servicos.setEsmaltarPreco(servicosPrestados.getString("esmaltarPreco"));

				servicos.setPernaintPreco(servicosPrestados.getString("pernaintPreco"));

				servicos.setPerna12Preco(servicosPrestados.getString("perna12Preco"));

				servicos.setVirilhaPreco(servicosPrestados.getString("virilhaPreco"));

				servicos.setIntimaPreco(servicosPrestados.getString("intimaPreco"));

				servicos.setAxilaPreco(servicosPrestados.getString("axilaPreco"));

				servicos.setSobrancelhaPreco(servicosPrestados.getString("sobrancelhaPreco"));

				servicos.setBucoPreco(servicosPrestados.getString("bucoPreco"));

				servicos.setPreco(servicosPrestados.getString("preco"));

				servicos.setFormaPagamento(servicosPrestados.getString("formaPagamento"));

				servicos.setNomeFuncionario(servicosPrestados.getString("nomeFuncionario"));

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		codigoDeServicoPrestadoSendoEditado = servicos.getIdLancamento();

		// model.addAttribute("codigo", servicos.getCodigo());

		model.addAttribute("nomeCliente", servicos.getNomeCliente());

		model.addAttribute("comanda", servicos.getComanda());

		model.addAttribute("alicate", servicos.getAlicate());

		model.addAttribute("tipoFuncionario", servicos.getTipoFuncionario());

		model.addAttribute("dataInclusao", servicos.getDataInclusao());

		model.addAttribute("manicurePreco", servicos.getManicurePreco());

		model.addAttribute("pedicurePreco", servicos.getPedicurePreco());

		model.addAttribute("francesinhaPreco", servicos.getFrancesinhaPreco());

		model.addAttribute("esmaltarPreco", servicos.getEsmaltarPreco());

		model.addAttribute("pernaintPreco", servicos.getPernaintPreco());

		model.addAttribute("perna12Preco", servicos.getPerna12Preco());

		model.addAttribute("virilhaPreco", servicos.getVirilhaPreco());

		model.addAttribute("intimaPreco", servicos.getIntimaPreco());

		model.addAttribute("axilaPreco", servicos.getAxilaPreco());

		model.addAttribute("sobrancelhaPreco", servicos.getSobrancelhaPreco());

		model.addAttribute("bucoPreco", servicos.getBucoPreco());

		model.addAttribute("preco", servicos.getPreco());

		model.addAttribute("formaPagamento", servicos.getFormaPagamento());

		model.addAttribute("nomeFuncionario", servicos.getNomeFuncionario());

		return "formularioDeEdicaoServicosRealizados";
	}

	@RequestMapping(value = "/salvarEdicaoServicoRealizado", method = RequestMethod.POST)
	public ModelAndView salvarEdicaoServicoRealizado(LancamentoServicoTO servico, ModelAndView model) {

		ConversorDatas dateTool = new ConversorDatas();

		JdbcManager dataBaseTools = new JdbcManager();

		try {

			insertResult = dataBaseTools.updateJdbc(
					"UPDATE public.lancamentoOrdemServico SET nomeCliente='" + servico.getNomeCliente() + "', comanda='"

							+ servico.getComanda() + "', alicate='"

							+ servico.getAlicate() + "', tipoFuncionario='"

							+ servico.getTipoFuncionario() + "', dataInclusao='"

							+ dateTool.converterDataBrParaUS(servico.getDataInclusao()) + "', manicurePreco='"

							+ servico.getManicurePreco() + "', pedicurePreco='"

							+ servico.getPedicurePreco() + "', francesinhaPreco='"

							+ servico.getFrancesinhaPreco() + "', esmaltarPreco='"

							+ servico.getEsmaltarPreco() + "', pernaintPreco='"

							+ servico.getPernaintPreco() + "', perna12Preco='"

							+ servico.getPerna12Preco() + "', virilhaPreco='"

							+ servico.getVirilhaPreco() + "', intimaPreco='"

							+ servico.getIntimaPreco() + "', axilaPreco='"

							+ servico.getAxilaPreco() + "', sobrancelhaPreco='"

							+ servico.getSobrancelhaPreco() + "', bucoPreco='"

							+ servico.getBucoPreco() + "', preco='"

							+ servico.getPreco() + "', formaPagamento='"

							+ servico.getFormaPagamento() + "', nomeFuncionario='"

							+ servico.getNomeFuncionario()

							+ "' WHERE idLancamento='" + codigoDeServicoPrestadoSendoEditado + "'");

			if (insertResult.equals("1")) {
				model = new ModelAndView("formularioDeEdicaoServicosRealizados", "command", new LancamentoServicoTO());

				String insertResultAttributeModel = insertResult;

				insertResult = "";

				model.addObject("insertResult", insertResultAttributeModel);
				return model;
			} else {
				model = new ModelAndView("formularioDeEdicaoServicosRealizados", "command", new LancamentoServicoTO());

				String insertResultAttributeModel = insertResult;

				insertResult = "";

				model.addObject("insertResult", insertResultAttributeModel);
				return model;
			}
		} catch (Exception e) {
			model = new ModelAndView("formularioDeEdicaoServicosRealizados", "command", new LancamentoServicoTO());

			String insertResultAttributeModel = insertResult;

			insertResult = "";

			model.addObject("insertResult", insertResultAttributeModel);
			return model;
		}
	}

	// deletar servico
	@RequestMapping(value = "/deletarServicoRealizado", method = RequestMethod.POST)
	public ModelAndView deletarServicoRealizado(LancamentoServicoTO servico, ModelAndView model) {

		JdbcManager dataBaseTools = new JdbcManager();

		insertResult = dataBaseTools.deleteJdbc("DELETE FROM public.lancamentoOrdemServico WHERE idLancamento='"
				+ codigoDeServicoPrestadoSendoEditado + "'");
		model = new ModelAndView("formularioDeEdicaoServicosRealizados", "command", new LancamentoServicoTO());

		String insertResultAttributeModel = insertResult;

		insertResult = "";

		model.addObject("insertResult", insertResultAttributeModel);
		return model;

	}

	// Relatorio
	@RequestMapping(value = "/relatorioServicosRealizados")
	public ModelAndView relatorioServicosRealizados(@ModelAttribute("command") LancamentoServicoTO servico) {

		JdbcManager dataBaseTools = new JdbcManager();

		ConversorDatas dateTool = new ConversorDatas();

		ResultSet servicosPrestados = dataBaseTools
				.selectJdbc("SELECT * FROM public.lancamentoOrdemServico WHERE dataInclusao != '0001-01-01"
						+ "' AND dataInclusao >='" + dateTool.converterDataBrParaUS(servico.getDataPesquisaInicio())
						+ "' AND dataInclusao <='" + dateTool.converterDataBrParaUS(servico.getDataPesquisaFim())
						+ "' AND nomeCliente like '%" + servico.getNomePesquisaCliente()
						+ "%' AND nomeFuncionario like '%" + servico.getNomePesquisaFuncionario()
						+ "%' ORDER BY nomeCliente,dataInclusao");

		ArrayList<LancamentoServicoTO> listaServicos = new ArrayList<LancamentoServicoTO>();

		ModelAndView model = new ModelAndView("relatorioServicosRealizados");

		String inicio = "";
		String fim = "";
		String func = "";
		String cli = "";

		try {
			while (servicosPrestados.next()) {

				inicio = servico.getDataPesquisaInicio();
				fim = servico.getDataPesquisaFim();
				func = servico.getNomePesquisaFuncionario();
				cli = servico.getNomePesquisaCliente();

				System.out.println("Dados de filtro:\n");
				System.out.println(inicio);
				System.out.println(fim);
				System.out.println(func);
				System.out.println(cli);

				servico = new LancamentoServicoTO();

				servico.setIdLancamento(servicosPrestados.getString("idLancamento"));

				servico.setNomeCliente(servicosPrestados.getString("nomeCliente"));

				servico.setComanda(servicosPrestados.getString("comanda"));

				servico.setAlicate(servicosPrestados.getString("alicate"));

				servico.setTipoFuncionario(servicosPrestados.getString("tipoFuncionario"));

				servico.setDataInclusao(dateTool.converterDataUsParaBr(servicosPrestados.getString("dataInclusao")));

				servico.setManicurePreco(servicosPrestados.getString("manicurePreco"));

				servico.setPedicurePreco(servicosPrestados.getString("pedicurePreco"));

				servico.setFrancesinhaPreco(servicosPrestados.getString("francesinhaPreco"));

				servico.setEsmaltarPreco(servicosPrestados.getString("esmaltarPreco"));

				servico.setPernaintPreco(servicosPrestados.getString("pernaintPreco"));

				servico.setPerna12Preco(servicosPrestados.getString("perna12Preco"));

				servico.setVirilhaPreco(servicosPrestados.getString("virilhaPreco"));

				servico.setIntimaPreco(servicosPrestados.getString("intimaPreco"));

				servico.setAxilaPreco(servicosPrestados.getString("axilaPreco"));

				servico.setSobrancelhaPreco(servicosPrestados.getString("sobrancelhaPreco"));

				servico.setBucoPreco(servicosPrestados.getString("bucoPreco"));

				servico.setPreco(servicosPrestados.getString("preco"));

				servico.setFormaPagamento(servicosPrestados.getString("formaPagamento"));

				servico.setNomeFuncionario(servicosPrestados.getString("nomeFuncionario"));

				System.out.println("Restaurando dados de pesquisa");

				servico.setDataPesquisaInicio(inicio);
				servico.setDataPesquisaFim(fim);
				servico.setNomePesquisaCliente(cli);
				servico.setNomePesquisaFuncionario(func);

				System.out.println("Dados restaurados:");

				System.out.println(servico.getDataPesquisaInicio());
				System.out.println(servico.getDataPesquisaFim());
				System.out.println(servico.getNomePesquisaFuncionario());
				System.out.println(servico.getNomePesquisaCliente());

				System.out.println("Id servico processado: ");

				System.out.println(servico.getIdLancamento());

				listaServicos.add(servico);

			}

			log.gravarLog(listaServicos.toString());

			if (listaServicos.size() > 0) {
				System.out.println("primeiro item da lista: " + listaServicos.get(0).getIdLancamento());

			}

			model.addObject("listaServicos", listaServicos);
			model.addObject("dataPesquisaInicio", servico.getDataPesquisaInicio());
			model.addObject("dataPesquisaFim", servico.getDataPesquisaFim());
			model.addObject("nomePesquisaFuncionario", servico.getNomePesquisaFuncionario());
			model.addObject("nomePesquisaCliente", servico.getNomePesquisaCliente());
		} catch (SQLException e) {
			log.gravarLog(e.toString());
		}

		if (!loginCheckedContext.equals("erroLogin")) {
			if (funcionarioLoaded.getPerfil().equalsIgnoreCase("adm") && funcionarioLoaded.getEstado().equals("1")) {

				return model;
			} else {
				return new ModelAndView("acessoRestrito");
			}
		} else {
			return new ModelAndView(loginCheckedContext);
		}

	}

	// Fim servico realizado

	// Produto
	// Cadastrar produto
	@RequestMapping(value = "/gerenciarProdutos", method = RequestMethod.GET)
	public ModelAndView produto() {

		if (!loginCheckedContext.equals("erroLogin")) {
			if (funcionarioLoaded.getEstado().equals("1")) {

				return new ModelAndView("gerenciarProdutos", "command", new ProdutoTO());
			} else {
				return new ModelAndView("acessoRestrito");
			}
		} else {
			return new ModelAndView(loginCheckedContext, "command", null);
		}
	}

	// salvar cadastro
	@RequestMapping(value = "/salvarProduto", method = RequestMethod.POST)
	public ModelAndView salvarProduto(ProdutoTO produto, ModelAndView model) {

		produtoFacade.saveProduct(produto);

		String insertResultModelAttribute = insertResult;

		model = new ModelAndView("gerenciarProdutos", "command", new ProdutoTO());

		model.addObject("insertResult", insertResultModelAttribute);
		insertResult = "";
		return model;
	}

	// busca para editar
	@RequestMapping(value = "/editarDeletarProduto", method = RequestMethod.GET)
	public ModelAndView editarDeletarProduto(Model model) {

		model.addAttribute("command");

		if (!loginCheckedContext.equals("erroLogin")) {
			if (funcionarioLoaded.getEstado().equals("1")) {

				return new ModelAndView("editarDeletarProduto", "command", new ProdutoTO());
			} else {
				return new ModelAndView("acessoRestrito");
			}
		} else {
			return new ModelAndView(loginCheckedContext, "command", null);
		}

	}

	// formulario de edicao
	@RequestMapping(value = "/formularioDeEdicaoProduto", method = RequestMethod.POST)
	public String formularioDeEdicaoProduto(@ModelAttribute("command") ProdutoTO produto, ModelMap model) {

		JdbcManager dataBaseTools = new JdbcManager();
		ResultSet dadosEditarProduto = null;

		dadosEditarProduto = dataBaseTools
				.selectJdbc("SELECT * FROM public.produto WHERE codigoProduto='" + produto.getCodigoProduto() + "'");

		ConversorDatas dateTools = new ConversorDatas();

		try {
			while (dadosEditarProduto.next()) {
				produto.setNomeProduto(dadosEditarProduto.getString("nomeProduto"));
				produto.setTipo(dadosEditarProduto.getString("tipo"));
				produto.setMarca(dadosEditarProduto.getString("Marca"));
				produto.setCor(dadosEditarProduto.getString("cor"));
				produto.setQuantidade(dadosEditarProduto.getString("quantidade"));
				produto.setValor(dadosEditarProduto.getString("valor"));
				produto.setCodigoProduto(dadosEditarProduto.getString("codigoProduto"));

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		codigoEmProdutoSendoEditado = produto.getCodigoProduto();

		model.addAttribute("nomeProduto", produto.getNomeProduto());
		model.addAttribute("tipo", produto.getTipo());
		model.addAttribute("marca", produto.getMarca());
		model.addAttribute("cor", produto.getCor());
		model.addAttribute("quantidade", produto.getQuantidade());
		model.addAttribute("valor", produto.getValor());
		model.addAttribute("codigoProduto", produto.getCodigoProduto());

		return "formularioDeEdicaoProduto";
	}

	// salvar edicao
	@RequestMapping(value = "/salvarProdutoEditado", method = RequestMethod.POST)
	public ModelAndView salvarProdutoEditado(ProdutoTO produto, ModelAndView model) {

		JdbcManager dataBaseTools = new JdbcManager();

		try {

			insertResult = dataBaseTools.updateJdbc("UPDATE public.produto SET" + " `tipo`='" + produto.getTipo()
					+ "',`nomeProduto`='" + produto.getNomeProduto() + "',`Marca`='" + produto.getMarca() + "',`cor`='"
					+ produto.getCor() + "',`quantidade`='" + produto.getQuantidade() + "',`valor`='"
					+ produto.getValor() + "',`codigoProduto`='" + produto.getCodigoProduto()
					+ "' WHERE codigoProduto='" + codigoEmProdutoSendoEditado + "'");

			if (insertResult.equals("1")) {
				String insertResultAttribute = insertResult;

				model = new ModelAndView("formularioDeEdicaoProduto", "command", new ProdutoTO());

				insertResult = "";

				model.addObject("insertResult", insertResultAttribute);
				return model;
			} else {
				String insertResultAttribute = insertResult;

				model = new ModelAndView("formularioDeEdicaoProduto", "command", new ProdutoTO());

				insertResult = "";

				model.addObject("insertResult", insertResultAttribute);
				return model;
			}
		} catch (Exception e) {
			String insertResultAttribute = insertResult;

			model = new ModelAndView("formularioDeEdicaoProduto", "command", new ProdutoTO());

			insertResult = "";

			model.addObject("insertResult", insertResultAttribute);
			return model;
		}

	}

	// deletar produto
	@RequestMapping(value = "/deletarProduto", method = RequestMethod.POST)
	public ModelAndView deletarProduto(ProdutoTO produto, ModelAndView model) {

		JdbcManager dataBaseTools = new JdbcManager();

		insertResult = dataBaseTools
				.deleteJdbc("DELETE FROM public.produto WHERE codigoProduto='" + codigoEmProdutoSendoEditado + "'");

		String insertResultAttributeModel = insertResult;
		insertResult = "";

		model = new ModelAndView("formularioDeEdicaoProduto", "command", new ProdutoTO());

		model.addObject("insertResult", insertResultAttributeModel);

		return model;

	}

	// Relatorio
	@RequestMapping(value = "/relatorioProdutos")
	public ModelAndView relatorioProdutos() {

		JdbcManager dataBaseTools = new JdbcManager();

		ResultSet produtos = dataBaseTools.selectJdbc("SELECT * FROM public.produto ORDER BY (quantidade+0)");

		ArrayList<ProdutoTO> listaProdutos = new ArrayList<ProdutoTO>();

		ModelAndView model = new ModelAndView("relatorioProdutos");

		try {
			while (produtos.next()) {
				ProdutoTO produto = new ProdutoTO();

				produto.setNomeProduto(produtos.getString("nomeProduto"));
				produto.setMarca(produtos.getString("Marca"));
				produto.setCor(produtos.getString("cor"));
				produto.setCodigoProduto(produtos.getString("codigoProduto"));
				produto.setQuantidade(produtos.getString("quantidade"));
				produto.setValor(produtos.getString("valor"));
				listaProdutos.add(produto);

			}

			model.addObject("listaProdutos", listaProdutos);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (!loginCheckedContext.equals("erroLogin")) {
			if (funcionarioLoaded.getEstado().equals("1")) {

				return model;
			} else {
				return new ModelAndView("acessoRestrito");
			}
		} else {
			return new ModelAndView("erroLogin");
		}
	}

	// Fim produto

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView exit() {
		loginCheckedContext = "erroLogin";
		return new ModelAndView("login"/* isto chama login.jsp */, "command", new FuncionarioTO());
	}

	@RequestMapping(value = "/erroDeBusca")
	public String erroDeBusca() {
		return "erroDeBusca";
	}

	@RequestMapping(value = "/falhaConexao")
	public String falhaConexao() {
		return "falhaConexao";
	}

	@RequestMapping(value = "/recuperarSenha")
	public ModelAndView recuperarSenha() {
		return new ModelAndView("recuperarSenha", "command", new FuncionarioTO());
	}

	@RequestMapping(value = "/enviarEmailSenha")
	public String enviarEmailSenha(FuncionarioTO funcionario) {

		JdbcManager dataBaseTools = new JdbcManager();

		ResultSet resultadoBusca = dataBaseTools
				.selectJdbc("select senha from public.funcionario WHERE email = \'" + funcionario.getEmail() + "\'");

		String senha = "";

		try {
			while (resultadoBusca.next()) {
				senha = resultadoBusca.getString("senha");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (!senha.isEmpty()) {
			JMailTool.sendEmail("ezspwdrecovery@gmail.com", "ccx13980", funcionario.getEmail(),
					"Serviço para recuperação de senha.\n\nSenha Atual: " + senha, "solicitacao de envio de senha");
			System.out.println("Senha: " + senha);
			return "emailSenhaEnviado";
		}

		else {
			return "emailNaoLocalizado";
		}
	}

	@RequestMapping(value = "/relatorioFinanceiro")
	public String relatorioFinanceiro(Model modelo, @ModelAttribute("command") DespesasTO despesa) {
		// Entidades de busca

		List<DespesasTO> listaDespesas = despesaFacade.getAllExpenses();
		List<LancamentoServicoTO> listaServicosRealizados = servicoFacade.getAllServices();

		String inicio = "";
		String fim = "";

		modelo.addAttribute("listaDespesas", listaDespesas);
		modelo.addAttribute("dataPesquisaInicio", inicio);
		modelo.addAttribute("dataPesquisaFim", fim);

		modelo.addAttribute("listaServicosRealizados", listaServicosRealizados);

		if (null == funcionarioLoaded) {
			return "erroLogin";
		} else {
			if (funcionarioLoaded.getPerfil().equalsIgnoreCase("adm")) {
				return "/relatorioFinanceiro";
			} else {
				return "acessoRestrito";
			}
		}

	}

	@RequestMapping(value = "/baterPonto")
	public String baterPonto() {

		JdbcManager dataBaseTools = new JdbcManager();

		ResultSet resultado = null;
		resultado = dataBaseTools
				.selectJdbc("SELECT * FROM public.folhaDePonto WHERE dataInclusao = CURRENT_DATE() AND idFuncionario = "
						+ funcionarioLoaded.getIdFuncionario());
		String dado = "";

		try {
			while (resultado.next()) {
				dado = resultado.getString("dataInclusao");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (dado.isEmpty()) {
			dataBaseTools
					.insertJdbc("INSERT INTO public.folhaDePonto (dataInclusao, idFuncionario) VALUES (CURRENT_DATE(),'"
							+ funcionarioLoaded.getIdFuncionario() + "')");
		} else {
			return "erroPonto";
		}

		return "baterPonto";
	}

	public static void main(String[] args) throws Exception {
		SpringApplication.run(EzSystemController.class, args);
	}

}
