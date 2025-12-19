/* ======================================================
   ********************************************************
   *      GABARITO - EXERCICIOS - NIVEL FACIL (10)
					-- TABELA ACCOUNT --
   ********************************************************
   ====================================================== */

-- 1. Mostrar todas as colunas e 20 primeiras linhas
SELECT TOP 20 *
FROM dbo.DimAccount;

-- 2. Contar quantas contas existem no arquivo
SELECT COUNT (*) as TOTAL_Contas
FROM dbo.DimAccount;

-- 3. Listar todas as AccountType distintos e n�o nulos
SELECT DISTINCT AccountType
FROM dbo.DimAccount
WHERE AccountType IS NOT NULL;

-- 4. Contar quantas contas t�m AccountType nulo
SELECT COUNT(*) TOTAL_Contas
FROM dbo.DimAccount
WHERE AccountType IS NULL;

-- 5. Retornar AccountKey, AccountDescription e AccountType ordenado por AccountDescription
SELECT AccountKey, AccountDescription, AccountType
FROM dbo.DimAccount
ORDER BY AccountDescription;

-- 6. Listar contas cujo AccountDescription cont�m a palavra 'Cash' (case-insensitive)
SELECT AccountKey, AccountDescription
FROM dbo.DimAccount
WHERE AccountDescription LIKE '%Cash%'

-- 7. Mostrar as 10 maiores AccountCodeAlternateKey (maior valor num�rico)
SELECT top 10 AccountKey, AccountDescription, AccountCodeAlternateKey as COD_ALTERNATIVO
FROM dbo.DimAccount
ORDER BY AccountCodeAlternateKey DESC;

-- 8. Selecionar as contas cujo Operator = '+'
SELECT 
AccountKey as ID_Conta, 
AccountDescription as Descricao, 
Operator as Operador 
FROM dbo.DimAccount
WHERE Operator = '+'

-- 9. Substituir nulos em AccountType por 'SEM REGISTRO' (exibir apenas)
SELECT 
AccountKey, 
AccountDescription,
    ISNULL(AccountType, 'SEM REGISTRO')
FROM dbo.DimAccount;

-- 10. Verificar quantos ValueType diferentes existem e listar
SELECT ValueType, COUNT(*) as QTD_TIPOS_VALORES
FROM dbo.DimAccount
GROUP BY ValueType
ORDER BY QTD_TIPOS_VALORES DESC;


/* ======================================================
   ********************************************************
   *      GABARITO - EXERCICIOS - NIVEL MEDIO (10)
					-- TABELA ACCOUNT --
   ********************************************************
   ====================================================== */

-- 11. Contar quantas contas por AccountType (ordenado por quantidade desc)
SELECT AccountType, COUNT(*) QTD_TIPOS
FROM dbo.DimAccount
GROUP BY AccountType
ORDER BY QTD_TIPOS DESC;

-- Alternativa fazendo a troca do NULL por 'SEM REGISTRO'
SELECT ISNULL(AccountType, 'SEM REGISTRO') AS AccountType, COUNT(*) AS total
FROM dbo.DimAccount
GROUP BY ISNULL(AccountType, 'SEM REGISTRO')
ORDER BY total DESC;