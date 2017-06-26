delete from TB_AVALIACAO;  
delete from TB_CONSUMO;
delete from TB_OFERTA_UNIDADE; 
delete from TB_OFERTA; 
delete from TB_REVISTA;
delete from TB_TELEFONE;
delete from TB_ASSINATURA; 
delete from TB_PLANO;  
delete from TB_CARTAO;
delete from TB_CLIENTE;
delete from TB_IMAGEM; 
delete from TB_UNIDADE;
delete from TB_PARCEIRO; 
delete from TB_PESSOA_FISICA;  
delete from TB_ENDERECO;
delete from TB_CATEGORIA;  
delete from TB_CIDADE; 
delete from TB_MARCA_FRANQUIA; 
delete from TB_TIPO_PESSOA;
delete from TB_UF; 

-- UFS 

insert into tb_uf(id_uf, sigla, nome) Values(12, 'AC', 'Acre');
insert into tb_uf(id_uf, sigla, nome) Values(27, 'AL', 'Alagoas'); 
insert into tb_uf(id_uf, sigla, nome) Values(13, 'AM', 'Amazonas');
insert into tb_uf(id_uf, sigla, nome) Values(16, 'AP', 'Amapá');
insert into tb_uf(id_uf, sigla, nome) Values(29, 'BA', 'Bahia');
insert into tb_uf(id_uf, sigla, nome) values (23, 'CE', 'Ceará');  
insert into tb_uf(id_uf, sigla, nome) values (53, 'DF', 'Distrito Federal');
insert into tb_uf(id_uf, sigla, nome) values (32, 'ES', 'Espírito Santo'); 
insert into tb_uf(id_uf, sigla, nome) values (52, 'GO', 'Goiás');  
insert into tb_uf(id_uf, sigla, nome) values (21, 'MA', 'Maranhão');
insert into tb_uf(id_uf, sigla, nome) values (31, 'MG', 'Minas Gerais');
insert into tb_uf(id_uf, sigla, nome) values (50, 'MS', 'Mato Grosso do Sul'); 
insert into tb_uf(id_uf, sigla, nome) values (51, 'MT', 'Mato Grosso');
insert into tb_uf(id_uf, sigla, nome) values (15, 'PA', 'Pará');
insert into tb_uf(id_uf, sigla, nome) values (25, 'PB', 'Paraíba');
insert into tb_uf(id_uf, sigla, nome) values (26, 'PE', 'Pernambuco'); 
insert into tb_uf(id_uf, sigla, nome) values (22, 'PI', 'Piauí');  
insert into tb_uf(id_uf, sigla, nome) values (41, 'PR', 'Paraná'); 
insert into tb_uf(id_uf, sigla, nome) values (33, 'RJ', 'Rio de Janeiro'); 
insert into tb_uf(id_uf, sigla, nome) values (24, 'RN', 'Rio Grande do Norte');
insert into tb_uf(id_uf, sigla, nome) values (11, 'RO', 'Rondônia');
insert into tb_uf(id_uf, sigla, nome) values (14, 'RR', 'Roraima');
insert into tb_uf(id_uf, sigla, nome) values (43, 'RS', 'Rio Grande do Sul');  
insert into tb_uf(id_uf, sigla, nome) values (42, 'SC', 'Santa Catarina'); 
insert into tb_uf(id_uf, sigla, nome) values (28, 'SE', 'Sergipe');
insert into tb_uf(id_uf, sigla, nome) values (35, 'SP', 'São Paulo');  
insert into tb_uf(id_uf, sigla, nome) values (17, 'TO', 'Tocantins');  

-- CIDADES

insert into tb_cidade(id_cidade, nome, id_uf) values (1, 'Brasília', 53);  
insert into tb_cidade(id_cidade, nome, id_uf) values (2, 'Goiânia', 52);
insert into tb_cidade(id_cidade, nome, id_uf) values (3, 'Porto Alegre', 43);  
insert into tb_cidade(id_cidade, nome, id_uf) values (4, 'São Paulo', 35); 
insert into tb_cidade(id_cidade, nome, id_uf) values (5, 'Caldas Novas', 52); 

-- CATEGORIAS 

insert into tb_categoria(id_categoria, nome) values (nextval('SEQ_CATEGORIA'), 'Alimentação');
insert into tb_categoria(id_categoria, nome) values (nextval('SEQ_CATEGORIA'), 'Sorvetes');
insert into tb_categoria(id_categoria, nome) values (nextval('SEQ_CATEGORIA'), 'Food Truck');

-- TIPO PESSOA 

insert into tb_tipo_pessoa(id_tipo_pessoa, nome) values (1, 'Administrador');  
insert into tb_tipo_pessoa(id_tipo_pessoa, nome) values (2, 'Parceiro');
insert into tb_tipo_pessoa(id_tipo_pessoa, nome) values (3, 'Cliente');
insert into tb_tipo_pessoa(id_tipo_pessoa, nome) values (4, 'Usuario');

insert into tb_revista(id_revista, edicao, descricao, inicio_vigencia, fim_vigencia, pdf, imagem)
values(nextval('SEQ_REVISTA'), 'JUN/2017', 'REVISTA DE JUN/2017', to_date('01/06/2017', 'DD/MM/YYYY'), to_date('30/07/2017', 'DD/MM/YYYY'), '', '');

insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Hamburgueria do Cheff', 'http://descontae.com.br/img/logos/245_thumb.jpg', 'http://descontae.com.br/img/logos/245_thumb.jpg', 'http://descontae.com.br/img/logos/245_thumb.jpg');

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'Logradouro', 'Complemento', 'Núm', 'Bairro', 1, null, null);

insert into tb_pessoa_fisica(id_pessoa, nome, email, cpf, telefone, facebook, instagram, id_tipo_pessoa, id_endereco, data_cadastro, data_ultima_atualizacao, idioma)  
values(nextval('SEQ_PESSOA_FISICA'), 'Pessoa Hamburgueria Cheff', 'nao@teconto.com.br', '12353786243', '6112345678', null, null, 2, (select max(id_endereco) from tb_endereco), '08/06/2017', '08/06/2017', 'pt-BR');  

insert into tb_parceiro(id_parceiro, nome, nome_fantasia, email, cnpj, id_categoria, id_pessoa, id_marca_franquia, data_cadastro, data_ultima_atualizacao) 
values(nextval('SEQ_PARCEIRO'), 'Hamburgueria do Cheff', 'Hamburgueria do Cheff', 'nao@teconto.com', '63279427000190', 3, (select max(id_pessoa) from tb_pessoa_fisica), (select max(id_marca_franquia) from tb_marca_franquia), '08/06/2017', '08/06/2017');

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'Logradouro', 'Complemento', 'Núm', 'Bairro', 1, null, null);

insert into tb_unidade(id_unidade, nome, id_parceiro, inicio_expediente, fim_expediente, id_endereco)  
values(nextval('SEQ_UNIDADE'), 'Hamburgueria do Cheff', (select max(id_parceiro) from tb_parceiro), null, null, (select max(id_endereco) from tb_endereco));

insert into tb_oferta(id_oferta, descricao, regras, imagem_site, valor, desconto, id_pessoa, situacao)  
values(nextval('SEQ_OFERTA'), '15% de desconto na conta final.', '', '', 0, 0.15, (select max(id_pessoa) from tb_pessoa_fisica), 'A');

insert into tb_oferta_unidade(id_oferta_unidade, id_oferta, id_unidade, id_revista)
values(nextval('SEQ_OFERTA_UNIDADE'), (select max(id_oferta) from tb_oferta), (select max(id_unidade) from tb_unidade), (select max(id_revista) from tb_revista));




insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Crepe Voyage', 'http://descontae.com.br/img/logos/246_thumb.jpg', 'http://descontae.com.br/img/logos/246_thumb.jpg', 'http://descontae.com.br/img/logos/246_thumb.jpg' );

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'Logradouro', 'Complemento', 'Núm', 'Bairro', 1, null, null);

insert into tb_pessoa_fisica(id_pessoa, nome, email, cpf, telefone, facebook, instagram, id_tipo_pessoa, id_endereco, data_cadastro, data_ultima_atualizacao, idioma)  
values(nextval('SEQ_PESSOA_FISICA'), 'Pessoa Crepe Voyage', 'nao@teconto.com.br', '12353786243', '6112345678', null, null, 2, (select max(id_endereco) from tb_endereco), '08/06/2017', '08/06/2017', 'pt-BR');

insert into tb_parceiro(id_parceiro, nome, nome_fantasia, email, cnpj, id_categoria, id_pessoa, id_marca_franquia, data_cadastro, data_ultima_atualizacao) 
values(nextval('SEQ_PARCEIRO'), 'Crepe Voyage', 'Crepe Voyage', 'nao@teconto.com', '63279427000190', 3, (select max(id_pessoa) from tb_pessoa_fisica), (select max(id_marca_franquia) from tb_marca_franquia), '08/06/2017', '08/06/2017');

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'Logradouro', 'Complemento', 'Núm', 'Bairro', 1, null, null);  

insert into tb_unidade(id_unidade, nome, id_parceiro, inicio_expediente, fim_expediente, id_endereco)  
values(nextval('SEQ_UNIDADE'), 'Crepe Voyage', (select max(id_parceiro) from tb_parceiro), null, null, (select max(id_endereco) from tb_endereco)); 

insert into tb_oferta(id_oferta, descricao, regras, imagem_site, valor, desconto, id_pessoa, situacao)  
values(nextval('SEQ_OFERTA'), 'Na compra de um Crepe ganhe uma bebida ou 25% de desconto na conta final.', '', '', 0, 0.25, (select max(id_pessoa) from tb_pessoa_fisica), 'A'); 

insert into tb_oferta_unidade(id_oferta_unidade, id_oferta, id_unidade, id_revista)
values(nextval('SEQ_OFERTA_UNIDADE'), (select max(id_oferta) from tb_oferta), (select max(id_unidade) from tb_unidade), (select max(id_revista) from tb_revista)); 




insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'El Perro Negro', 'http://descontae.com.br/img/logos/247_thumb.jpg', 'http://descontae.com.br/img/logos/247_thumb.jpg', 'http://descontae.com.br/img/logos/247_thumb.jpg'); 

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'Logradouro', 'Complemento', 'Núm', 'Bairro', 1, null, null);  

insert into tb_pessoa_fisica(id_pessoa, nome, email, cpf, telefone, facebook, instagram, id_tipo_pessoa, id_endereco, data_cadastro, data_ultima_atualizacao, idioma)  
values(nextval('SEQ_PESSOA_FISICA'), 'Pessoa El Perro Negro', 'nao@teconto.com.br', '12353786243', '6112345678', null, null, 2, (select max(id_endereco) from tb_endereco), '08/06/2017', '08/06/2017', 'pt-BR');  

insert into tb_parceiro(id_parceiro, nome, nome_fantasia, email, cnpj, id_categoria, id_pessoa, id_marca_franquia, data_cadastro, data_ultima_atualizacao) 
values(nextval('SEQ_PARCEIRO'), 'El Perro Negro', 'El Perro Negro', 'nao@teconto.com', '63279427000190', 3, (select max(id_pessoa) from tb_pessoa_fisica), (select max(id_marca_franquia) from tb_marca_franquia), '08/06/2017', '08/06/2017');

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'Logradouro', 'Complemento', 'Núm', 'Bairro', 1, null, null);  

insert into tb_unidade(id_unidade, nome, id_parceiro, inicio_expediente, fim_expediente, id_endereco)  
values(nextval('SEQ_UNIDADE'), 'El Perro Negro', (select max(id_parceiro) from tb_parceiro), null, null, (select max(id_endereco) from tb_endereco)); 

insert into tb_oferta(id_oferta, descricao, regras, imagem_site, valor, desconto, id_pessoa, situacao)  
values(nextval('SEQ_OFERTA'), '20% de desconto em qualquer Hot Dog do cardápio.', '', '', 0, 0.20, (select max(id_pessoa) from tb_pessoa_fisica), 'A'); 

insert into tb_oferta_unidade(id_oferta_unidade, id_oferta, id_unidade, id_revista)
values(nextval('SEQ_OFERTA_UNIDADE'), (select max(id_oferta) from tb_oferta), (select max(id_unidade) from tb_unidade), (select max(id_revista) from tb_revista)); 





insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Chef na Rua', 'http://descontae.com.br/img/logos/193_thumb.jpg', 'http://descontae.com.br/img/logos/193_thumb.jpg', 'http://descontae.com.br/img/logos/193_thumb.jpg' );

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'Logradouro', 'Complemento', 'Núm', 'Bairro', 1, null, null);  

insert into tb_pessoa_fisica(id_pessoa, nome, email, cpf, telefone, facebook, instagram, id_tipo_pessoa, id_endereco, data_cadastro, data_ultima_atualizacao, idioma)  
values(nextval('SEQ_PESSOA_FISICA'), 'Pessoa Chef na Rua', 'nao@teconto.com.br', '12353786243', '6112345678', null, null, 2, (select max(id_endereco) from tb_endereco), '08/06/2017', '08/06/2017', 'pt-BR');  

insert into tb_parceiro(id_parceiro, nome, nome_fantasia, email, cnpj, id_categoria, id_pessoa, id_marca_franquia, data_cadastro, data_ultima_atualizacao) 
values(nextval('SEQ_PARCEIRO'), 'Chef na Rua', 'El Perro Negro', 'nao@teconto.com', '63279427000190', 3, (select max(id_pessoa) from tb_pessoa_fisica), (select max(id_marca_franquia) from tb_marca_franquia), '08/06/2017', '08/06/2017');

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'Logradouro', 'Complemento', 'Núm', 'Bairro', 1, null, null);  

insert into tb_unidade(id_unidade, nome, id_parceiro, inicio_expediente, fim_expediente, id_endereco)  
values(nextval('SEQ_UNIDADE'), 'Chef na Rua', (select max(id_parceiro) from tb_parceiro), null, null, (select max(id_endereco) from tb_endereco)); 

insert into tb_oferta(id_oferta, descricao, regras, imagem_site, valor, desconto, id_pessoa, situacao)  
values(nextval('SEQ_OFERTA'), 'Escolha um entre todos os produtos do cardápio e ganhe 20% de desconto: Risotos, Massas e Pizzas.', '', '', 0, 0.20, (select max(id_pessoa) from tb_pessoa_fisica), 'A'); 

insert into tb_oferta_unidade(id_oferta_unidade, id_oferta, id_unidade, id_revista)
values(nextval('SEQ_OFERTA_UNIDADE'), (select max(id_oferta) from tb_oferta), (select max(id_unidade) from tb_unidade), (select max(id_revista) from tb_revista)); 





insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Burger House', 'http://descontae.com.br/img/logos/248_thumb.jpg', 'http://descontae.com.br/img/logos/248_thumb.jpg', 'http://descontae.com.br/img/logos/248_thumb.jpg' );

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'Logradouro', 'Complemento', 'Núm', 'Bairro', 1, null, null);  

insert into tb_pessoa_fisica(id_pessoa, nome, email, cpf, telefone, facebook, instagram, id_tipo_pessoa, id_endereco, data_cadastro, data_ultima_atualizacao, idioma)  
values(nextval('SEQ_PESSOA_FISICA'), 'Pessoa Burger House', 'nao@teconto.com.br', '12353786243', '6112345678', null, null, 2, (select max(id_endereco) from tb_endereco), '08/06/2017', '08/06/2017', 'pt-BR');  

insert into tb_parceiro(id_parceiro, nome, nome_fantasia, email, cnpj, id_categoria, id_pessoa, id_marca_franquia, data_cadastro, data_ultima_atualizacao) 
values(nextval('SEQ_PARCEIRO'), 'Burger House', 'Burger House', 'nao@teconto.com', '63279427000190', 3, (select max(id_pessoa) from tb_pessoa_fisica), (select max(id_marca_franquia) from tb_marca_franquia), '08/06/2017', '08/06/2017');

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'Logradouro', 'Complemento', 'Núm', 'Bairro', 1, null, null);  

insert into tb_unidade(id_unidade, nome, id_parceiro, inicio_expediente, fim_expediente, id_endereco)  
values(nextval('SEQ_UNIDADE'), 'Burger House', (select max(id_parceiro) from tb_parceiro), null, null, (select max(id_endereco) from tb_endereco)); 

insert into tb_oferta(id_oferta, descricao, regras, imagem_site, valor, desconto, id_pessoa, situacao)  
values(nextval('SEQ_OFERTA'), 'Na compra de qualquer hambúrguer a batata rústica acompanhado de um molho é grátis.', '', '', 8, 0.0, (select max(id_pessoa) from tb_pessoa_fisica), 'A'); 

insert into tb_oferta_unidade(id_oferta_unidade, id_oferta, id_unidade, id_revista)
values(nextval('SEQ_OFERTA_UNIDADE'), (select max(id_oferta) from tb_oferta), (select max(id_unidade) from tb_unidade), (select max(id_revista) from tb_revista)); 




insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Speed Hot Dog', 'http://descontae.com.br/img/logos/249_thumb.jpg', 'http://descontae.com.br/img/logos/249_thumb.jpg', 'http://descontae.com.br/img/logos/249_thumb.jpg' );

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'Logradouro', 'Complemento', 'Núm', 'Bairro', 1, null, null);  

insert into tb_pessoa_fisica(id_pessoa, nome, email, cpf, telefone, facebook, instagram, id_tipo_pessoa, id_endereco, data_cadastro, data_ultima_atualizacao, idioma)  
values(nextval('SEQ_PESSOA_FISICA'), 'Pessoa Speed Hot Dog', 'nao@teconto.com.br', '12353786243', '6112345678', null, null, 2, (select max(id_endereco) from tb_endereco), '08/06/2017', '08/06/2017', 'pt-BR');  

insert into tb_parceiro(id_parceiro, nome, nome_fantasia, email, cnpj, id_categoria, id_pessoa, id_marca_franquia, data_cadastro, data_ultima_atualizacao) 
values(nextval('SEQ_PARCEIRO'), 'Speed Hot Dog', 'Speed Hot Dog', 'nao@teconto.com', '63279427000190', 3, (select max(id_pessoa) from tb_pessoa_fisica), (select max(id_marca_franquia) from tb_marca_franquia), '08/06/2017', '08/06/2017');

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'Logradouro', 'Complemento', 'Núm', 'Bairro', 1, null, null);  

insert into tb_unidade(id_unidade, nome, id_parceiro, inicio_expediente, fim_expediente, id_endereco)  
values(nextval('SEQ_UNIDADE'), 'Speed Hot Dog', (select max(id_parceiro) from tb_parceiro), null, null, (select max(id_endereco) from tb_endereco)); 

insert into tb_oferta(id_oferta, descricao, regras, imagem_site, valor, desconto, id_pessoa, situacao)  
values(nextval('SEQ_OFERTA'), '20% de desconto no HotDog ao molho. Direito ao Self-Service de 17 ingredientes e 7 molhos.', '', '', 8, 0.0, (select max(id_pessoa) from tb_pessoa_fisica), 'A'); 

insert into tb_oferta_unidade(id_oferta_unidade, id_oferta, id_unidade, id_revista)
values(nextval('SEQ_OFERTA_UNIDADE'), (select max(id_oferta) from tb_oferta), (select max(id_unidade) from tb_unidade), (select max(id_revista) from tb_revista)); 



insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Master Truck', 'http://descontae.com.br/img/logos/250_thumb.jpg', 'http://descontae.com.br/img/logos/250_thumb.jpg', 'http://descontae.com.br/img/logos/250_thumb.jpg' );

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'Logradouro', 'Complemento', 'Núm', 'Bairro', 1, null, null);  

insert into tb_pessoa_fisica(id_pessoa, nome, email, cpf, telefone, facebook, instagram, id_tipo_pessoa, id_endereco, data_cadastro, data_ultima_atualizacao, idioma)  
values(nextval('SEQ_PESSOA_FISICA'), 'Pessoa Master Truck', 'nao@teconto.com.br', '12353786243', '6112345678', null, null, 2, (select max(id_endereco) from tb_endereco), '08/06/2017', '08/06/2017', 'pt-BR');  

insert into tb_parceiro(id_parceiro, nome, nome_fantasia, email, cnpj, id_categoria, id_pessoa, id_marca_franquia, data_cadastro, data_ultima_atualizacao) 
values(nextval('SEQ_PARCEIRO'), 'Master Truck', 'Master Truck', 'nao@teconto.com', '63279427000190', 3, (select max(id_pessoa) from tb_pessoa_fisica), (select max(id_marca_franquia) from tb_marca_franquia), '08/06/2017', '08/06/2017');

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'Logradouro', 'Complemento', 'Núm', 'Bairro', 1, null, null);  

insert into tb_unidade(id_unidade, nome, id_parceiro, inicio_expediente, fim_expediente, id_endereco)  
values(nextval('SEQ_UNIDADE'), 'Master Truck', (select max(id_parceiro) from tb_parceiro), null, null, (select max(id_endereco) from tb_endereco)); 

insert into tb_oferta(id_oferta, descricao, regras, imagem_site, valor, desconto, id_pessoa, situacao)  
values(nextval('SEQ_OFERTA'), 'File Au Poivre de R$28 por R$24 ou Master Clásico (R$22) + Batata (R$5) por R$24.', '', '', 8, 0.0, (select max(id_pessoa) from tb_pessoa_fisica), 'A'); 

insert into tb_oferta_unidade(id_oferta_unidade, id_oferta, id_unidade, id_revista)
values(nextval('SEQ_OFERTA_UNIDADE'), (select max(id_oferta) from tb_oferta), (select max(id_unidade) from tb_unidade), (select max(id_revista) from tb_revista)); 




insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Samurai Truck', 'http://descontae.com.br/img/logos/251_thumb.jpg', 'http://descontae.com.br/img/logos/251_thumb.jpg', 'http://descontae.com.br/img/logos/251_thumb.jpg' );

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'Logradouro', 'Complemento', 'Núm', 'Bairro', 1, null, null);  

insert into tb_pessoa_fisica(id_pessoa, nome, email, cpf, telefone, facebook, instagram, id_tipo_pessoa, id_endereco, data_cadastro, data_ultima_atualizacao, idioma)  
values(nextval('SEQ_PESSOA_FISICA'), 'Pessoa Samurai Truck', 'nao@teconto.com.br', '12353786243', '6112345678', null, null, 2, (select max(id_endereco) from tb_endereco), '08/06/2017', '08/06/2017', 'pt-BR');  

insert into tb_parceiro(id_parceiro, nome, nome_fantasia, email, cnpj, id_categoria, id_pessoa, id_marca_franquia, data_cadastro, data_ultima_atualizacao) 
values(nextval('SEQ_PARCEIRO'), 'Samurai Truck', 'Samurai Truck', 'nao@teconto.com', '63279427000190', 3, (select max(id_pessoa) from tb_pessoa_fisica), (select max(id_marca_franquia) from tb_marca_franquia), '08/06/2017', '08/06/2017');

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'Logradouro', 'Complemento', 'Núm', 'Bairro', 1, null, null);  

insert into tb_unidade(id_unidade, nome, id_parceiro, inicio_expediente, fim_expediente, id_endereco)  
values(nextval('SEQ_UNIDADE'), 'Samurai Truck', (select max(id_parceiro) from tb_parceiro), null, null, (select max(id_endereco) from tb_endereco)); 

insert into tb_oferta(id_oferta, descricao, regras, imagem_site, valor, desconto, id_pessoa, situacao)  
values(nextval('SEQ_OFERTA'), 'Na compra de qualquer item do cardápio o segundo do mesmo item sai com 30% de desconto. *não é válido para bebidas.', '', '', 8, 0.0, (select max(id_pessoa) from tb_pessoa_fisica), 'A'); 

insert into tb_oferta_unidade(id_oferta_unidade, id_oferta, id_unidade, id_revista)
values(nextval('SEQ_OFERTA_UNIDADE'), (select max(id_oferta) from tb_oferta), (select max(id_unidade) from tb_unidade), (select max(id_revista) from tb_revista)); 




insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Stadt Beer Truck', 'http://descontae.com.br/img/logos/252_thumb.jpg', 'http://descontae.com.br/img/logos/252_thumb.jpg', 'http://descontae.com.br/img/logos/252_thumb.jpg');

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'Logradouro', 'Complemento', 'Núm', 'Bairro', 1, null, null);  

insert into tb_pessoa_fisica(id_pessoa, nome, email, cpf, telefone, facebook, instagram, id_tipo_pessoa, id_endereco, data_cadastro, data_ultima_atualizacao, idioma)  
values(nextval('SEQ_PESSOA_FISICA'), 'Pessoa Stadt Beer Truck', 'nao@teconto.com.br', '12353786243', '6112345678', null, null, 2, (select max(id_endereco) from tb_endereco), '08/06/2017', '08/06/2017', 'pt-BR');  

insert into tb_parceiro(id_parceiro, nome, nome_fantasia, email, cnpj, id_categoria, id_pessoa, id_marca_franquia, data_cadastro, data_ultima_atualizacao) 
values(nextval('SEQ_PARCEIRO'), 'Stadt Beer Truck', 'Stadt Beer Truck', 'nao@teconto.com', '63279427000190', 3, (select max(id_pessoa) from tb_pessoa_fisica), (select max(id_marca_franquia) from tb_marca_franquia), '08/06/2017', '08/06/2017');

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'Logradouro', 'Complemento', 'Núm', 'Bairro', 1, null, null);  

insert into tb_unidade(id_unidade, nome, id_parceiro, inicio_expediente, fim_expediente, id_endereco)  
values(nextval('SEQ_UNIDADE'), 'Stadt Beer Truck', (select max(id_parceiro) from tb_parceiro), null, null, (select max(id_endereco) from tb_endereco)); 

insert into tb_oferta(id_oferta, descricao, regras, imagem_site, valor, desconto, id_pessoa, situacao)  
values(nextval('SEQ_OFERTA'), 'Desconto no Chopp Pilsen Grande de R$13 por R$10 ou desconto no Chopp Pilsen Pequeno de R$10 por R$8.', '', '', 8, 0.0, (select max(id_pessoa) from tb_pessoa_fisica), 'A'); 

insert into tb_oferta_unidade(id_oferta_unidade, id_oferta, id_unidade, id_revista)
values(nextval('SEQ_OFERTA_UNIDADE'), (select max(id_oferta) from tb_oferta), (select max(id_unidade) from tb_unidade), (select max(id_revista) from tb_revista)); 





insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Burger King', '', '', '' );

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'Logradouro', 'Complemento', 'Núm', 'Bairro', 1, null, null);  

insert into tb_pessoa_fisica(id_pessoa, nome, email, cpf, telefone, facebook, instagram, id_tipo_pessoa, id_endereco, data_cadastro, data_ultima_atualizacao, idioma)  
values(nextval('SEQ_PESSOA_FISICA'), 'Pessoa Burger King', 'nao@teconto.com.br', '12353786243', '6112345678', null, null, 2, (select max(id_endereco) from tb_endereco), '08/06/2017', '08/06/2017', 'pt-BR');  

insert into tb_parceiro(id_parceiro, nome, nome_fantasia, email, cnpj, id_categoria, id_pessoa, id_marca_franquia, data_cadastro, data_ultima_atualizacao) 
values(nextval('SEQ_PARCEIRO'), 'Burger King', 'Burger King', 'nao@teconto.com', '63279427000190', 1, (select max(id_pessoa) from tb_pessoa_fisica), (select max(id_marca_franquia) from tb_marca_franquia), '08/06/2017', '08/06/2017');

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'SCRN 706/707 Bloco E', 'Loja', '32', 'Asa Norte', 1, null, null);  

insert into tb_unidade(id_unidade, nome, id_parceiro, inicio_expediente, fim_expediente, id_endereco)  
values(nextval('SEQ_UNIDADE'), 'Burger King 706/7N', (select max(id_parceiro) from tb_parceiro), null, null, (select max(id_endereco) from tb_endereco)); 

insert into tb_oferta(id_oferta, descricao, regras, imagem_site, valor, desconto, id_pessoa, situacao)  
values(nextval('SEQ_OFERTA'), 'Combo Whopper com 20% de desconto: de R$23,90 por R$18,90 ou Combo Whopper Furioso com 5 reais de desconto: de R$26,90 por R$21,90.', '', '', 8, 0.0, (select max(id_pessoa) from tb_pessoa_fisica), 'A'); 

insert into tb_oferta_unidade(id_oferta_unidade, id_oferta, id_unidade, id_revista)
values(nextval('SEQ_OFERTA_UNIDADE'), (select max(id_oferta) from tb_oferta), (select max(id_unidade) from tb_unidade), (select max(id_revista) from tb_revista)); 

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'SIG Quadra 06', '2380, Ed. Office 3000 Loja', '15', 'Sudoeste', 1, null, null);  

insert into tb_unidade(id_unidade, nome, id_parceiro, inicio_expediente, fim_expediente, id_endereco)  
values(nextval('SEQ_UNIDADE'), 'Burger King Sudoeste', (select max(id_parceiro) from tb_parceiro), null, null, (select max(id_endereco) from tb_endereco)); 

insert into tb_oferta_unidade(id_oferta_unidade, id_oferta, id_unidade, id_revista)
values(nextval('SEQ_OFERTA_UNIDADE'), (select max(id_oferta) from tb_oferta), (select max(id_unidade) from tb_unidade), (select max(id_revista) from tb_revista)); 

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '75690000', 'Logradouro', 'Complemento', 'Núm', 'Caldas Novas', 5, null, null);  

insert into tb_unidade(id_unidade, nome, id_parceiro, inicio_expediente, fim_expediente, id_endereco)  
values(nextval('SEQ_UNIDADE'), 'Burger King Caldas Novas', (select max(id_parceiro) from tb_parceiro), null, null, (select max(id_endereco) from tb_endereco)); 

insert into tb_oferta_unidade(id_oferta_unidade, id_oferta, id_unidade, id_revista)
values(nextval('SEQ_OFERTA_UNIDADE'), (select max(id_oferta) from tb_oferta), (select max(id_unidade) from tb_unidade), (select max(id_revista) from tb_revista)); 




insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'SUBWAY', 'http://descontae.com.br/img/logos/71_thumb.jpg', 'http://descontae.com.br/img/logos/71_thumb.jpg', 'http://descontae.com.br/img/logos/71_thumb.jpg' );

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'Logradouro', 'Complemento', 'Núm', 'Bairro', 1, null, null);  

insert into tb_pessoa_fisica(id_pessoa, nome, email, cpf, telefone, facebook, instagram, id_tipo_pessoa, id_endereco, data_cadastro, data_ultima_atualizacao, idioma)  
values(nextval('SEQ_PESSOA_FISICA'), 'Pessoa SUBWAY', 'nao@teconto.com.br', '12353786243', '6112345678', null, null, 2, (select max(id_endereco) from tb_endereco), '08/06/2017', '08/06/2017', 'pt-BR');  

insert into tb_parceiro(id_parceiro, nome, nome_fantasia, email, cnpj, id_categoria, id_pessoa, id_marca_franquia, data_cadastro, data_ultima_atualizacao) 
values(nextval('SEQ_PARCEIRO'), 'SUBWAY', 'SUBWAY', 'nao@teconto.com', '63279427000190', 3, (select max(id_pessoa) from tb_pessoa_fisica), (select max(id_marca_franquia) from tb_marca_franquia), '08/06/2017', '08/06/2017');

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'SHIN CA 1 Bloco A', 'Shopping Deck Norte', '', 'Lago Norte', 1, null, null);  

insert into tb_unidade(id_unidade, nome, id_parceiro, inicio_expediente, fim_expediente, id_endereco)  
values(nextval('SEQ_UNIDADE'), 'SUBWAY Deck Norte', (select max(id_parceiro) from tb_parceiro), null, null, (select max(id_endereco) from tb_endereco)); 

insert into tb_oferta(id_oferta, descricao, regras, imagem_site, valor, desconto, id_pessoa, situacao)  
values(nextval('SEQ_OFERTA'), 'Compre um combo de 15cm da linha Exclusivo e ganhe um sanduiche subway de 15cm do mesmo sabor.', '', '', 8, 0.0, (select max(id_pessoa) from tb_pessoa_fisica), 'A'); 

insert into tb_oferta_unidade(id_oferta_unidade, id_oferta, id_unidade, id_revista)
values(nextval('SEQ_OFERTA_UNIDADE'), (select max(id_oferta) from tb_oferta), (select max(id_unidade) from tb_unidade), (select max(id_revista) from tb_revista)); 





insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Bendito Suco', 'http://descontae.com.br/img/logos/187_thumb.jpg', 'http://descontae.com.br/img/logos/187_thumb.jpg', 'http://descontae.com.br/img/logos/187_thumb.jpg' );

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'Logradouro', 'Complemento', 'Núm', 'Bairro', 1, null, null);  

insert into tb_pessoa_fisica(id_pessoa, nome, email, cpf, telefone, facebook, instagram, id_tipo_pessoa, id_endereco, data_cadastro, data_ultima_atualizacao, idioma)  
values(nextval('SEQ_PESSOA_FISICA'), 'Pessoa Bendito Suco', 'nao@teconto.com.br', '12353786243', '6112345678', null, null, 2, (select max(id_endereco) from tb_endereco), '08/06/2017', '08/06/2017', 'pt-BR');  

insert into tb_parceiro(id_parceiro, nome, nome_fantasia, email, cnpj, id_categoria, id_pessoa, id_marca_franquia, data_cadastro, data_ultima_atualizacao) 
values(nextval('SEQ_PARCEIRO'), 'Bendito Suco', 'Bendito Suco', 'nao@teconto.com', '63279427000190', 3, (select max(id_pessoa) from tb_pessoa_fisica), (select max(id_marca_franquia) from tb_marca_franquia), '08/06/2017', '08/06/2017');

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'CLN 413 Bloco E', 'Loja', '19', 'Asa Norte', 1, null, null);  

insert into tb_unidade(id_unidade, nome, id_parceiro, inicio_expediente, fim_expediente, id_endereco)  
values(nextval('SEQ_UNIDADE'), 'Bendito Suco', (select max(id_parceiro) from tb_parceiro), null, null, (select max(id_endereco) from tb_endereco)); 

insert into tb_oferta(id_oferta, descricao, regras, imagem_site, valor, desconto, id_pessoa, situacao)  
values(nextval('SEQ_OFERTA'), 'Na compra de 1 wrap Ganhe um suco pedal nortuno ou um Bendito Suco de 450ml.', '', '', 8, 0.0, (select max(id_pessoa) from tb_pessoa_fisica), 'A'); 

insert into tb_oferta_unidade(id_oferta_unidade, id_oferta, id_unidade, id_revista)
values(nextval('SEQ_OFERTA_UNIDADE'), (select max(id_oferta) from tb_oferta), (select max(id_unidade) from tb_unidade), (select max(id_revista) from tb_revista)); 




insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Chiquinho Sorvetes', 'http://descontae.com.br/img/logos/70_thumb.jpg', 'http://descontae.com.br/img/logos/70_thumb.jpg', 'http://descontae.com.br/img/logos/70_thumb.jpg');

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'Logradouro', 'Complemento', 'Núm', 'Bairro', 1, null, null);  

insert into tb_pessoa_fisica(id_pessoa, nome, email, cpf, telefone, facebook, instagram, id_tipo_pessoa, id_endereco, data_cadastro, data_ultima_atualizacao, idioma)  
values(nextval('SEQ_PESSOA_FISICA'), 'Pessoa Chiquinho Sorvetes', 'nao@teconto.com.br', '12353786243', '6112345678', null, null, 2, (select max(id_endereco) from tb_endereco), '08/06/2017', '08/06/2017', 'pt-BR');  

insert into tb_parceiro(id_parceiro, nome, nome_fantasia, email, cnpj, id_categoria, id_pessoa, id_marca_franquia, data_cadastro, data_ultima_atualizacao) 
values(nextval('SEQ_PARCEIRO'), 'Chiquinho Sorvetes', 'Chiquinho Sorvetes', 'nao@teconto.com', '63279427000190', 3, (select max(id_pessoa) from tb_pessoa_fisica), (select max(id_marca_franquia) from tb_marca_franquia), '08/06/2017', '08/06/2017');

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'SHCGN 706/707 Bloco G', 'Térreo', '', 'Asa Norte', 1, null, null);  

insert into tb_unidade(id_unidade, nome, id_parceiro, inicio_expediente, fim_expediente, id_endereco)  
values(nextval('SEQ_UNIDADE'), 'Chiquinho Sorvetes', (select max(id_parceiro) from tb_parceiro), null, null, (select max(id_endereco) from tb_endereco)); 

insert into tb_oferta(id_oferta, descricao, regras, imagem_site, valor, desconto, id_pessoa, situacao)  
values(nextval('SEQ_OFERTA'), 'Shake Mix de R$12 por R$10', 'Exceto sabores de café.', '', 8, 0.0, (select max(id_pessoa) from tb_pessoa_fisica), 'A'); 

insert into tb_oferta_unidade(id_oferta_unidade, id_oferta, id_unidade, id_revista)
values(nextval('SEQ_OFERTA_UNIDADE'), (select max(id_oferta) from tb_oferta), (select max(id_unidade) from tb_unidade), (select max(id_revista) from tb_revista)); 




insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Sushi BSB Delivery', '', '', '' );

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'Logradouro', 'Complemento', 'Núm', 'Bairro', 1, null, null);  

insert into tb_pessoa_fisica(id_pessoa, nome, email, cpf, telefone, facebook, instagram, id_tipo_pessoa, id_endereco, data_cadastro, data_ultima_atualizacao, idioma)  
values(nextval('SEQ_PESSOA_FISICA'), 'Pessoa Sushi BSB Delivery', 'nao@teconto.com.br', '12353786243', '6112345678', null, null, 2, (select max(id_endereco) from tb_endereco), '08/06/2017', '08/06/2017', 'pt-BR');  

insert into tb_parceiro(id_parceiro, nome, nome_fantasia, email, cnpj, id_categoria, id_pessoa, id_marca_franquia, data_cadastro, data_ultima_atualizacao) 
values(nextval('SEQ_PARCEIRO'), 'Sushi BSB Delivery', 'Sushi BSB Delivery', 'nao@teconto.com', '63279427000190', 3, (select max(id_pessoa) from tb_pessoa_fisica), (select max(id_marca_franquia) from tb_marca_franquia), '08/06/2017', '08/06/2017');

insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values(nextval('SEQ_ENDERECO'), '70000000', 'CLN 413 Bloco E', 'Loja', '19', 'Asa Norte', 1, null, null);  

insert into tb_unidade(id_unidade, nome, id_parceiro, inicio_expediente, fim_expediente, id_endereco)  
values(nextval('SEQ_UNIDADE'), 'Sushi BSB Delivery', (select max(id_parceiro) from tb_parceiro), null, null, (select max(id_endereco) from tb_endereco)); 

insert into tb_oferta(id_oferta, descricao, regras, imagem_site, valor, desconto, id_pessoa, situacao)  
values(nextval('SEQ_OFERTA'), '10% de desconto em todos os produtos do cardápio. Todo pedido vira combo, ou seja, ganhe um refrigerante lata 350ml.', 
'Promoção exclusiva para pedidos através do telefone: (61) 3034 - 5969 ou pelo site www.sushidelivery.com.br *Informar que é cliente Descontaê via telefone ou no campo observações do pedido pelo site.', '', 8, 0.0, (select max(id_pessoa) from tb_pessoa_fisica), 'A'); 

insert into tb_oferta_unidade(id_oferta_unidade, id_oferta, id_unidade, id_revista)
values(nextval('SEQ_OFERTA_UNIDADE'), (select max(id_oferta) from tb_oferta), (select max(id_unidade) from tb_unidade), (select max(id_revista) from tb_revista)); 


update tb_endereco set loc_latitude = -15.769257, loc_longitude = -47.890767;
update tb_unidade set inicio_expediente = '08:00', fim_expediente = '18:00';


/*
insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Doux Brigaderia', 'http://descontae.com.br/img/logos/22_thumb.jpg', 'http://descontae.com.br/img/logos/22_thumb.jpg', 'http://descontae.com.br/img/logos/22_thumb.jpg' 
from tb_marca_franquia;

insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Açaí Pump', 'http://descontae.com.br/img/logos/4_thumb.jpg', 'http://descontae.com.br/img/logos/4_thumb.jpg', 'http://descontae.com.br/img/logos/4_thumb.jpg' 
from tb_marca_franquia;

insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Treviso Galeteria', 'http://descontae.com.br/img/logos/39_thumb.jpg', 'http://descontae.com.br/img/logos/39_thumb.jpg', 'http://descontae.com.br/img/logos/39_thumb.jpg' 
from tb_marca_franquia;

insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Kabanas Bar e Restaurante', 'http://descontae.com.br/img/logos/28_thumb.jpg', 'http://descontae.com.br/img/logos/28_thumb.jpg', 'http://descontae.com.br/img/logos/28_thumb.jpg' 
from tb_marca_franquia;

insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Chão de Estrelas Restaurante', 'http://descontae.com.br/img/logos/29_thumb.jpg', 'http://descontae.com.br/img/logos/29_thumb.jpg', 'http://descontae.com.br/img/logos/29_thumb.jpg' 
from tb_marca_franquia;

insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Merkadão Paulista ', 'http://descontae.com.br/img/logos/27_thumb.jpg', 'http://descontae.com.br/img/logos/27_thumb.jpg', 'http://descontae.com.br/img/logos/27_thumb.jpg' 
from tb_marca_franquia;

insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Crepe de Paris', '', '', '' 
from tb_marca_franquia;

insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Zimbrus', '', '', '' 
from tb_marca_franquia;

insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'D.O.C Vinhos', 'http://descontae.com.br/img/logos/19_thumb.jpg', 'http://descontae.com.br/img/logos/19_thumb.jpg', 'http://descontae.com.br/img/logos/19_thumb.jpg' 
from tb_marca_franquia;

insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'La Eskina', 'http://descontae.com.br/img/logos/26_thumb.jpg', 'http://descontae.com.br/img/logos/26_thumb.jpg', 'http://descontae.com.br/img/logos/26_thumb.jpg' 
from tb_marca_franquia;

insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Sao Paulo Restaurante e Pizzaria', '', '', '' 
from tb_marca_franquia;

insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Moagem Cozinha e Bar', 'http://descontae.com.br/img/logos/33_thumb.jpg', 'http://descontae.com.br/img/logos/33_thumb.jpg', 'http://descontae.com.br/img/logos/33_thumb.jpg' 
from tb_marca_franquia;

insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'TNT FitFood', 'http://descontae.com.br/img/logos/196_thumb.jpg', 'http://descontae.com.br/img/logos/196_thumb.jpg', 'http://descontae.com.br/img/logos/196_thumb.jpg' 
from tb_marca_franquia;

insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Abençoado Bar ', 'http://descontae.com.br/img/logos/235_thumb.jpg', 'http://descontae.com.br/img/logos/235_thumb.jpg', 'http://descontae.com.br/img/logos/235_thumb.jpg' 
from tb_marca_franquia;

insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Bamboa Cozinha e Bar', 'http://descontae.com.br/img/logos/236_thumb.jpg', 'http://descontae.com.br/img/logos/236_thumb.jpg', 'http://descontae.com.br/img/logos/236_thumb.jpg' 
from tb_marca_franquia;

insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Tchê Garoto', 'http://descontae.com.br/img/logos/197_thumb.jpg', 'http://descontae.com.br/img/logos/197_thumb.jpg', 'http://descontae.com.br/img/logos/197_thumb.jpg' 
from tb_marca_franquia;

insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Quiosque da Jô', 'http://descontae.com.br/img/logos/44_thumb.jpg', 'http://descontae.com.br/img/logos/44_thumb.jpg', 'http://descontae.com.br/img/logos/44_thumb.jpg' 
from tb_marca_franquia;

insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Laap Restaurante Argentino', 'http://descontae.com.br/img/logos/21_thumb.jpg', 'http://descontae.com.br/img/logos/21_thumb.jpg', 'http://descontae.com.br/img/logos/21_thumb.jpg' 
from tb_marca_franquia;

insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Bangalô Galeteria', 'http://descontae.com.br/img/logos/41_thumb.jpg', 'http://descontae.com.br/img/logos/41_thumb.jpg', 'http://descontae.com.br/img/logos/41_thumb.jpg' 
from tb_marca_franquia;

insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Apache Hamburgueria', 'http://descontae.com.br/img/logos/190_thumb.jpg', 'http://descontae.com.br/img/logos/190_thumb.jpg', 'http://descontae.com.br/img/logos/190_thumb.jpg' 
from tb_marca_franquia;

insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'O Tal do Picadinho', 'http://descontae.com.br/img/logos/195_thumb.jpg', 'http://descontae.com.br/img/logos/195_thumb.jpg', 'http://descontae.com.br/img/logos/195_thumb.jpg' 
from tb_marca_franquia;

insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Piratas Bar', '', '', '' 
from tb_marca_franquia;

insert into tb_marca_franquia(id_marca_franquia, nome, imagem_logo, imagem_fundo_app, imagem_thumbnail) 
values(nextval('SEQ_MARCA_FRANQUIA'), 'Assados e Grelhados', 'http://descontae.com.br/img/logos/16_thumb.jpg', 'http://descontae.com.br/img/logos/16_thumb.jpg', 'http://descontae.com.br/img/logos/16_thumb.jpg' 
from tb_marca_franquia;


*/








/*

-- REVISTA 
insert into tb_revista(id_revista, edicao, descricao, inicio_vigencia, fim_vigencia, pdf, imagem)
values (1, 'JUN/2017', 'REVISTA DE JUN/2017', to_date('01/06/2017', 'DD/MM/YYYY'), to_date('30/07/2017', 'DD/MM/YYYY'), '', '');

-- PARCEIRO 1  
insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values (1, '70735110', 'SQN 303 Bloco K', 'Apto', '101', 'Asa Norte', 1, null, null);  

insert into tb_pessoa_fisica(id_pessoa, nome, email, cpf, telefone, facebook, instagram, id_tipo_pessoa, id_endereco, data_cadastro, data_ultima_atualizacao)  
values(1, 'Parceiro 1', 'nao@teconto.com.br', '12353786243', '6112345678', null, null, 2, 1, '08/06/2017', '08/06/2017');  

insert into tb_parceiro(id_parceiro, nome, nome_fantasia, email, cnpj, id_categoria, id_pessoa, id_marca_franquia, data_cadastro, data_ultima_atualizacao) 
values(1, 'SUBWAY CNPJ 1', 'SUBWAY', 'nao@teconto.com', '63279427000190', 1, 1, 1, '08/06/2017', '08/06/2017');

-- SUBWAY 304N 
insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values (2, '70736520', 'SCN 304 Bloco B', 'Loja', '7', 'Asa Norte', 1, -15.774597, -47.885590);

insert into tb_unidade(id_unidade, nome, id_parceiro, inicio_expediente, fim_expediente, id_endereco)  
values (1, 'SUBWAY 304N', 1, null, null, 2); 

insert into tb_oferta(id_oferta, descricao, regras, imagem_site, valor, desconto, id_pessoa, situacao)  
values (1, 'DESCONTO 10%', 'REGRAS', '', 5.00, 0.1, 1, 'A'); 

insert into tb_oferta_unidade(id_oferta_unidade, id_oferta, id_unidade, id_revista)
values (1, 1, 1, 1);

-- SUBWAY 706N 
insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values (3, '70235520', 'SCN 706/707 Bloco F', 'Loja', '36/39', 'Asa Norte', 1, -15.769196, -47.890580);

insert into tb_unidade(id_unidade, nome, id_parceiro, inicio_expediente, fim_expediente, id_endereco)  
values (2, 'SUBWAY 706N', 1, null, null, 3); 

insert into tb_oferta_unidade(id_oferta_unidade, id_oferta, id_unidade, id_revista)
values (2, 1, 2, 1);

-- PARCEIRO 2  
insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values (4, '71505220', 'SHIN QI 03 Conjunto 02', 'Casa', '8', 'Lago Norte', 1, null, null);

insert into tb_pessoa_fisica(id_pessoa, nome, email, cpf, telefone, facebook, instagram, id_tipo_pessoa, id_endereco, data_cadastro, data_ultima_atualizacao)  
values(2, 'Parceiro 2', 'nao@teconto.com.br', '50561648875', '6198765432', null, null, 2, 2, '08/06/2017', '08/06/2017');  

insert into tb_parceiro(id_parceiro, nome, nome_fantasia, email, cnpj, id_categoria, id_pessoa, id_marca_franquia, data_cadastro, data_ultima_atualizacao) 
values(2, 'SUBWAY CNPJ 2', 'SUBWAY', 'nao@teconto.com', '94033097000182', 1, 2, 1, '08/06/2017', '08/06/2017');

-- SUBWAY 405s 
insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values (5, '70239500', 'SCS 405 Bloco A', 'Loja', '6', 'Asa Sul', 1, -15.814477, -47.889956);  

insert into tb_unidade(id_unidade, nome, id_parceiro, inicio_expediente, fim_expediente, id_endereco)  
values (3, 'SUBWAY 405S', 2, null, null, 5); 

insert into tb_oferta(id_oferta, descricao, regras, imagem_site, valor, desconto, id_pessoa, situacao)
values (2, 'Subway Club por R$5,00', '', '', 5.00, 0.2, 2, 'A');  

insert into tb_oferta_unidade(id_oferta_unidade, id_oferta, id_unidade, id_revista)
values (3, 2, 3, 1);

-- PARCEIRO 3  
insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values (6, '71505220', 'SHIN QI 03 Conjunto 02', 'Casa', '2', 'Lago Norte', 1, null, null);

insert into tb_pessoa_fisica(id_pessoa, nome, email, cpf, telefone, facebook, instagram, id_tipo_pessoa, id_endereco, data_cadastro, data_ultima_atualizacao)  
values(3, 'Parceiro 3', 'nao@teconto.com.br', '82153342880', '6198765432', null, null, 2, 6, '08/06/2017', '08/06/2017');  

insert into tb_parceiro(id_parceiro, nome, nome_fantasia, email, cnpj, id_categoria, id_pessoa, id_marca_franquia, data_cadastro, data_ultima_atualizacao) 
values(3, 'Chiquinho Sorvetes', 'CHIQUINHO SORVETES', 'nao@teconto.com', '04233588000184', 2, 3, 2, '08/06/2017', '08/06/2017');

-- CHIQUINHO 706N  
insert into tb_endereco(id_endereco, cep, logradouro, complemento, numero, bairro, id_cidade, loc_latitude, loc_longitude) 
values (7, '70736520', 'SCN 304 Bloco G', 'Loja', '13', 'Asa Norte', 1, -15.769257, -47.890767);

insert into tb_unidade(id_unidade, nome, id_parceiro, inicio_expediente, fim_expediente, id_endereco)  
values (4, 'CHIQUINHO 304N', 3, null, null, 7);  

insert into tb_oferta(id_oferta, descricao, regras, imagem_site, valor, desconto, id_pessoa, situacao)
values (3, 'Compre 1 casquinha e leve 2', '', '', 1.00, 0.2, 3, 'A'); 

insert into tb_oferta_unidade(id_oferta_unidade, id_oferta, id_unidade, id_revista)
values (4, 3, 4, 1);

insert into tb_avaliacao(id_avaliacao, id_pessoa, id_unidade, nota_satisfacao) 
select p.id_pessoa * 2 + u.id_unidade * 10, p.id_pessoa, u.id_unidade, trunc(random() * 5) 
  from tb_unidade u,
tb_pessoa_fisica p  
left join tb_avaliacao a on p.id_pessoa = a.id_pessoa
*/
