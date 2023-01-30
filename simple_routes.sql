USE mat_construcao;
-- -----------------------------------------------------
-- Consultas Simples
-- -----------------------------------------------------

-- Consultar ID, Nome e CNPJ de todos os FORNECEDORES
SELECT numero, nom_fornecedor, cnpj_fornecedor
	FROM fornecedor;

-- Consultar CPF, Nome e data de cadastro de todos os CLIENTES
SELECT cpf_cliente, nom_cliente, dat_cadastro 
	FROM cliente;

-- Consultar todos os dados de PRODUTOS da categoria 15
SELECT * 
	FROM produto
	WHERE cod_categoria = 15;

-- Consultar todos os dados dos FUNCIONÁRIOS do sexo feminino 
SELECT * 
	FROM funcionario
	WHERE sexo = 'Feminino';
  
  ###################VERIFICAR A GRAFIA NO INSERT
    
SELECT * FROM compra
	WHERE dat_compra > '2021-11-15';
    
 ################### VERIFICAR AS DATAS NO INSERT
 
 -- -----------------------------------------------------
-- Consultas INNER
-- -----------------------------------------------------

-- Consulta que retorna a descrição do produto e sua unidade de medida filtrado pelo código de tipo de 
-- produto = 04211 (Alvenaria de peças de barro e cerâmica - vedação)
SELECT produto.desc_produto, produto.unid_medida
FROM produto
INNER JOIN tipo_produto
ON produto.cod_tipo_produto = tipo_produto.cod_tipo_produto
	WHERE tipo_produto.cod_tipo_produto = '04211';

-- Consulta que retorna todos os FUNCIONARIOS que somente têm telefone fixo

-- Consulta que retorna todas as vendas que foram pagas com cartão de crédito

-- Consulta que retorna o CNPJ do fornecedor cuja compra foi maior R$ 5546465465465464,00

-- Consulta que retorna o nome e o CPF dos clientes cujos valores de venda foram maiores que R$ 5546465465465464,00
    
-- -----------------------------------------------------
-- Consultas OUTER
-- -----------------------------------------------------
    
    /*
SELECT concessionaria.nom_concessionaria, fabricante.num_cgc_fabricante
FROM concessionaria 
RIGHT OUTER JOIN fabricante
ON concessionaria.num_cgc_fabricante = fabricante.num_cgc_fabricante */