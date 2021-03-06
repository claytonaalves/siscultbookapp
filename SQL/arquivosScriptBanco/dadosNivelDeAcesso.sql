﻿/* Massa de Dados para bando cultbook*/

/* Dados para a tabela - niveldeacesso*/
INSERT INTO niveldeacesso (niveldeacesso) VALUES ('Administrador');
INSERT INTO niveldeacesso (niveldeacesso) VALUES ('Gerente');
INSERT INTO niveldeacesso (niveldeacesso) VALUES ('Funcionario');
INSERT INTO niveldeacesso (niveldeacesso) VALUES ('Cliente');

/* Dados para a tabela acesso - cadastrando os acessos que terão filtro */
INSERT INTO acesso (comando, descricao) VALUES ('cadastrarCliente', 'Cadastrar Cliente');
INSERT INTO acesso (comando, descricao) VALUES ('consultarCliente', 'Consultar Cliente');
INSERT INTO acesso (comando, descricao) VALUES ('atualizarCliente', 'Atualizar Cliente');
INSERT INTO acesso (comando, descricao) VALUES ('editarCliente', 'Editar Cliente');
INSERT INTO acesso (comando, descricao) VALUES ('excluirCliente', 'Excluir Cliente');

INSERT INTO acesso (comando, descricao) VALUES ('cadastrarFuncionario', 'Cadastrar Funcionario');
INSERT INTO acesso (comando, descricao) VALUES ('consultarFuncionario', 'Consultar Funcionario');
INSERT INTO acesso (comando, descricao) VALUES ('atualizarFuncionario', 'Atualizar Funcionario');
INSERT INTO acesso (comando, descricao) VALUES ('editarFuncionario', 'Editar Funcionario');
INSERT INTO acesso (comando, descricao) VALUES ('excluirFuncionario', 'Excluir Funcionario');

INSERT INTO acesso (comando, descricao) VALUES ('cadastrarEditora', 'Cadastrar Editora');
INSERT INTO acesso (comando, descricao) VALUES ('consultarEditora', 'Consultar Editora');
INSERT INTO acesso (comando, descricao) VALUES ('atualizarEditora', 'Atualizar Editora');
INSERT INTO acesso (comando, descricao) VALUES ('editarEditora', 'Editar Editora');
INSERT INTO acesso (comando, descricao) VALUES ('excluirEditora', 'Excluir Editora');

INSERT INTO acesso (comando, descricao) VALUES ('cadastrarAutor', 'Cadastrar Autor');
INSERT INTO acesso (comando, descricao) VALUES ('consultarAutor', 'Consultar Autor');
INSERT INTO acesso (comando, descricao) VALUES ('atualizarAutor', 'Atualizar Autor');
INSERT INTO acesso (comando, descricao) VALUES ('editarAutor', 'Editar Autor');
INSERT INTO acesso (comando, descricao) VALUES ('excluirAutor', 'Excluir Autor');

INSERT INTO acesso (comando, descricao) VALUES ('cadastrarLivro', 'Consultar Livro');
INSERT INTO acesso (comando, descricao) VALUES ('editarLivro', 'Cadastrar Livro');
INSERT INTO acesso (comando, descricao) VALUES ('atualizarLivro', 'Atualizar Livro');
INSERT INTO acesso (comando, descricao) VALUES ('consultarLivro', 'Editar Livro');
INSERT INTO acesso (comando, descricao) VALUES ('excluirLivro', 'Excluir Livro');

INSERT INTO acesso (comando, descricao) VALUES ('autorizarAcesso', 'Autorizar Acessos');
INSERT INTO acesso (comando, descricao) VALUES ('atualizarAcesso', 'Atualizar Acessos');
INSERT INTO acesso (comando, descricao) VALUES ('editarNivelAcesso', 'Editar Nível de Acesso');
INSERT INTO acesso (comando, descricao) VALUES ('consultarNivelAcesso', 'Consultar Níveis de Acesso');
INSERT INTO acesso (comando, descricao) VALUES ('cadastrarNivelAcesso', 'Cadastrar Nível de Acesso');
INSERT INTO acesso (comando, descricao) VALUES ('atualizarNivelAcesso', 'Atualizar Nível de Acesso');
INSERT INTO acesso (comando, descricao) VALUES ('excluirNivelAcesso', 'Excluir Nível de Acesso');

INSERT INTO acesso (comando, descricao) VALUES ('gravarPedido', 'Efetivar Pedido');


/* Dado para a tabela -  funcionario cadastrando um Administrador */
INSERT INTO funcionario (cargo, dataadmissao, datademissao, nomecompleto, datanascimento, cpf, sexo, rua, bairro, 
cidade, estado, senha, codigoniveldeacesso, ultimoacesso, status, cep) 
VALUES (1,'Administrador',(SELECT NOW()),null,'Administrador Geral Sistema',(SELECT NOW()),'01345678900',
'masculino','rua','bairro','cidade','RJ','12345678',(SELECT NOW()),'Ativo',1,'12345678');
