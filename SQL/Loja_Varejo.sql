-- Vendas por Cliente --
CREATE VIEW VendasPorCliente AS
SELECT 
	clientes.ID_Cliente,
    Nome,
    Sobrenome,
    SUM(Qtd_Vendida) AS Qtd_Vendida,
    SUM(Receita_Venda) AS Valor
FROM clientes
JOIN pedidos ON clientes.ID_Cliente = pedidos.ID_Cliente
GROUP BY ID_Cliente, Nome, Sobrenome;

-- Desempenho das Lojas --
CREATE VIEW DesempenhoLojas AS
SELECT
	lojas.ID_Loja,
	Loja,
    Gerente,
    SUM(Qtd_Vendida) AS Vendas,
    SUM(Receita_Venda) AS Valor_Pedido,
    SUM(Custo_Venda) AS Custo_Pedido,
    (SUM(Receita_Venda) - SUM(Custo_Venda)) AS Lucro
FROM lojas
JOIN pedidos ON lojas.ID_Loja = pedidos.ID_Loja
GROUP BY ID_Loja, Loja, Gerente;

-- Popularidade dos Produtos --
CREATE VIEW PopularidadeProdutos AS
SELECT
	produtos.ID_Produto,
	Nome_Produto,
    COUNT(Nome_Produto) AS Vendas,
    Marca_Produto,
    Categoria
FROM produtos
JOIN categorias ON produtos.ID_Categoria = categorias.ID_Categoria
JOIN pedidos ON produtos.ID_Produto = pedidos.ID_Produto
GROUP BY ID_Produto, Nome_Produto, Marca_Produto, Categoria;