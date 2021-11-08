-- Categorias e produtos

-- 1) Queremos ter uma lista de todas as categorias;
SELECT * FROM categorias;

-- 2) Como as categorias não possuem imagens, você está interessado em obter apenas um Nome e descrição da lista de categorias;
SELECT CategoriaNome, Descricao
FROM categorias;

-- 3) Obtenha uma lista dos produtos;
SELECT * FROM produtos;

-- 4) Existem produtos descontinuados? (Descontinuado = 1);


 -- 5) Na sexta-feira, você deve se reunir com o fornecedor nr. 8. Quais são os produtos que eles fornecem;
SELECT * FROM produtos
WHERE ProvedorID =8;

-- 6) Queremos saber todos os produtos cujo preço unitário se encontra;
-- entre 10 e 22.;
SELECT * FROM produtos
WHERE PrecoUnitario 
BETWEEN 10 AND 22;  



-- 7) Fica definido que um produto deve ser solicitado ao fornecedor se suas unidades em estoque forem inferiores ao nível de reabastecimento. Existem produtos a solicitar?;
SELECT * FROM produtos
WHERE UnidadesEstoque < NivelReabastecimento;


-- 8) Você quer saber todos os produtos da lista anterior, mas que as unidades pedidas sejam iguais a zero.;
SELECT * FROM produtos
WHERE UnidadesEstoque < NivelReabastecimento
AND UnidadesPedidas =0;

-- Clientes

-- 1) Obtenha uma lista de todos os clientes com contato, empresa, cargo, País. Classifique a lista por país.
SELECT Contato, Empresa, Titulo AS Cargo, Pais 
FROM clientes
ORDER BY Pais ASC;


-- 2) Queremos atender todos os clientes que possuem o título de  “Proprietário". Esse título estará em inglês (Owner).
SELECT Contato, Empresa, Titulo AS Cargo, Pais 
FROM clientes
WHERE Titulo ='Owner';

-- 3) A operadora de telefonia atendeu um cliente e não lembra o nome dele. Sabe apenas que começa com "C". Podemos ajudá-lo a obter uma lista com
-- todos os contatos que começam com a letra C?

SELECT Contato, Empresa, Titulo AS Cargo, Pais 
FROM clientes
WHERE Contato
Like 'c%';

-- Faturas

-- 1) Obtenha uma lista de todas as faturas, ordenadas por data da fatura em ordem ascendente.
SELECT * FROM faturas
ORDER BY DataFatura ASC;

-- 2) Agora é necessário uma lista de faturas com o país de envio "EUA" e
-- que a FormaeEnvio seja diferente de 3.
SELECT * FROM faturas
WHERE PaisEnvio ='USA'
AND FormaEnvio <>3;


-- 3) O cliente 'GOURL' fez um pedido?
SELECT * FROM faturas
WHERE ClienteID ='GOURL';


-- 4) Você deseja visualizar todas as faturas dos funcionários 2, 3, 5, 8 e 9.
SELECT * FROM faturas
WHERE EmpregadoID IN ('2', '3', '5', '8', '9');


-- 5) Retorne o valor total (qtd * preco unitario) para cada item da fatura. Dê um apelido (alias) para a coluna calculada.
SELECT PrecoUnitario * Quantidade AS Valor_Total
FROM detalhefatura;




-- 6) A coluna “desconto” armazena o percentual do desconto. Faça uma consulta que, além de retornar todos os campos, retorne o valor do desconto em reais, não em percentual. Dê um alias para essa coluna calculada.
SELECT FaturaId, ProdutoID, PrecoUnitario, Quantidade, Desconto,  Desconto * PrecoUnitario AS Desconto_Reais
FROM detalhefatura;

-- 7) Retorne a fatura com o maior valor total. DICA: o valor total da fatura é dado pela soma do produto qtd * valor unitario de todos os itens da fatura. DICA 2: Faça o agrupamento pelo faturaid (group by faturaId).
SELECT FaturaId, ProdutoID, PrecoUnitario, Quantidade, Desconto, PrecoUnitario * Quantidade AS Total
FROM detalhefatura
GROUP BY FaturaId;


