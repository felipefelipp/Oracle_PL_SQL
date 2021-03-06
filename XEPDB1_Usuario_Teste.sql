-- Mostra a estrutura da tabela
DESC countries;

DESC EMPLOYEES;

DESC JOBS;

DESC LOCATIONS;


-- UTILIZANDO O SELECT MAIS B�SICO DA TABELA

SELECT * 
FROM EMPLOYEES;

SELECT *
FROM JOBS;

SELECT *
FROM DEPARTMENTS;


-- SELECIONANDO COLUNAS ESPEC�FICAS DA TABELA

SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS;


SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
FROM EMPLOYEES;


--EXPRESS�ES ARITIMETICAS

SELECT FIRST_NAME, LAST_NAME, SALARY, (SALARY + 100) * 1.15 NOVO_SALARIO
FROM EMPLOYEES;

-- VALOR NULO (AUSENCIA DE VALOR)
SELECT FIRST_NAME, LAST_NAME, JOB_ID, SALARY, COMMISSION_PCT
FROM EMPLOYEES;

--EXPRESS�ES COM VALOR NULO
SELECT FIRST_NAME, LAST_NAME, JOB_ID, COMMISSION_PCT, 20000 * COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL;

--ALIAS DE COLUNA (CABE�ALHO)

SELECT FIRST_NAME AS PRIMEIRO_NOME, LAST_NAME AS ULTIMO_NOME, SALARY AS SAL�RIO
FROM EMPLOYEES;

-- OU (A PALAVRA AS � OPCIONAL MAS O ALIAS SEMPRE VAI FICAR EM MAI�SCULO)

SELECT FIRST_NAME PRIMEIRO_NOME, LAST_NAME ULTIMO_NOME, SALARY SAL�RIO
FROM EMPLOYEES;

-- UTILIZANDO O ALIAS COM LETRAS MIN�SUCULAS E ESPA�O 

SELECT FIRST_NAME "Primeiro nome", LAST_NAME "�ltimo nome", SALARY "Sal�rio($)", COMMISSION_PCT "Percentual de Comiss�o"
FROM EMPLOYEES;

--OPERADOR DE CONCATENA��O

SELECT FIRST_NAME || ' ' || LAST_NAME || ', Data de admiss�o: ' || HIRE_DATE "Funcion�rio"
FROM EMPLOYEES; 

-- LINHAS DUPLICADAS

SELECT DEPARTMENT_ID
FROM EMPLOYEES;

-- RESOLVENDO ESSE PROBLEMA COM A CL�USULA DISTINCT

SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES;

SELECT DISTINCT LAST_NAME, FIRST_NAME
FROM EMPLOYEES;


--UTILIZANDO A CLAUSULA WHERE

SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

--UTILIZANDO STRINGS DE CARACTERE NA CLAUSULA WHERE

SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

SELECT FIRST_NAME, LAST_NAME, JOB_ID, DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE = '30/01/04';


--OPERADORES DE COMPARA��O

SELECT FIRST_NAME || ' '|| LAST_NAME, SALARY, JOB_ID
FROM EMPLOYEES 
WHERE SALARY >= 10000;


SELECT FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY BETWEEN 10000 AND 15000;

--SELECIONANDO VALORES DENTRO DE UMA LISTA UTILIZANDO O OPERADOR IN

SELECT EMPLOYEE_ID, LAST_NAME, FIRST_NAME, SALARY, MANAGER_ID, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID IN ('IT_PROG', 'FI_ACCOUNT', 'SA_REP');


--COMPARA��ES UTILIZANDO O OPERADOR LIKE (% - QUALQUER COISA A FRENTE OU ATR�S), (_ UM CARACTERE QUALQUER A FRENTE OU ATR�S)

SELECT FIRST_NAME, LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%a';

SELECT FIRST_NAME, LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_a%';

-- COMPARA��ES COM O NULL
SELECT LAST_NAME, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;


--UTILIZANDO O OPERADOR AND

SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, SALARY 
FROM EMPLOYEES
WHERE SALARY >= 5000
AND JOB_ID = 'IT_PROG';

--UTILIZANDO O OPERADOR OR 

SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, SALARY 
FROM EMPLOYEES
WHERE SALARY >= 7000
OR JOB_ID = 'IT_PROG';

--UTILIZANDO O OPERADOR NOT

SELECT EMPLOYEE_ID, LAST_NAME, SALARY, MANAGER_ID, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID NOT IN ('IT_PROG', 'FI_ACCOUNT', 'SA_REP');

--REGRAS DE PRECEDENCIA
/*
1 - OPERADORES ARITIM�TICOS
2 - OPERADOR DE CONCATEN��O
3 - CONDI��ES DE COMPARA��O
4 - IS [NOT] NULL, LIKE, [NOT]IN]
5 - [NOT] BETWEEN
6 - NOT EQUAL TO
7 - NOT CONDI��O L�GICA
8 - AND CONDI��O L�GICA
9 - OR CONDI��O L�GICA 
*/


-- PODEMOS FAZER A ORDENA��O COM PARENTESES
SELECT LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE (JOB_ID = 'SA_REP' OR JOB_ID = 'IT_PROG')
AND SALARY > 10000;

-- ORDENA��O DE DADOS - ASCENDENTE
SELECT LAST_NAME, JOB_ID, DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES
ORDER BY HIRE_DATE ASC; -- SE EU N�O UTILIZAR O ASC, ELE J� ORDENA ASCENDENTEMENTE DE FORMA AUTOM�TICA

SELECT LAST_NAME, JOB_ID, DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES
ORDER BY HIRE_DATE ASC; 

-- ORDENA��O DE DADOS - DESCENDENTE 
SELECT LAST_NAME, JOB_ID, DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES
ORDER BY HIRE_DATE DESC;

-- SE FOR QUERER ORDENAR OS DADOS A PARTIR DE UMA EXRESS�O MATEM�TICA, DEVER� SER DA SEGUINTE FORMA
SELECT EMPLOYEE_ID, LAST_NAME, SALARY * 12 SALARIO_ANUAL
FROM EMPLOYEES
ORDER BY SALARIO_ANUAL;

-- OU

SELECT EMPLOYEE_ID, LAST_NAME, SALARY * 12
FROM EMPLOYEES
ORDER BY SALARY * 12;


-- ORDENANDO UTILIZANDO A POSI��O NUM�RICA DA COLUNA(NESSE CASO ELE EST� REFERENCIANDO A COLUNA 4, OU SEJA, HIRE_DATE
SELECT LAST_NAME, JOB_ID, DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES
ORDER BY 4;

-- ORDENANDO M�LTIPLAS COLUNAS(NESSE CASO ELE PEGA A REFERENCIA DA PRIMEIRA COLUNA E S� DEPOIS VEM A 2�
SELECT LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID, SALARY DESC;

SELECT LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID DESC , SALARY DESC;

--UTILIZANDO VARI�VEIS DE SUBSTITUI��O - &
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID = &EMPLOYEE_ID;

--UTILIZANDO VARI�VEIS DE SUBSTITUI��O -- &&
/*UTILIZE && SE VOC� DESEJA REUTILIZAR O VALOR DA VARI�VEL SEM SOLICITAR UM PROMPT PARA O USU�RIO A CADA VEZ QUE 
REFERENCIAR A VARI�VEL*/

SELECT EMPLOYEE_ID, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID = &&EMPLOYEE_ID;


-- VARI�VEIS DE SUBSTITUI��O COM VALORES DO TIPO CHARACTER E DATE(UTILIZE ASPAS SIMPLES PARA VALORES DO TIPO CHARACTER)
SELECT LAST_NAME, DEPARTMENT_ID, JOB_ID, SALARY * 12
FROM EMPLOYEES
WHERE JOB_ID = '&JOB_ID';

-- UTILIZANDO O COMANDO DEFINE
DEFINE EMPLOYEE_ID = 101;

SELECT EMPLOYEE_ID,LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID = &EMPLOYEE_ID;

DEFINE EMPLOYEE_ID; 

UNDEFINE EMPLOYEE_ID;


-
-- UTILIZANDO FUN��ES SINGLE ROW
-- MANIPULANDO STRINGS DE CATACTERES

SELECT LOWER('INTRODU��O ORACLE 19C')
FROM DUAL; 
-- DEIXA TUDO EM MIN�SCULO

SELECT UPPER('introdu��o oracle 19c')
FROM DUAL; -- DEIXA TUDO EM MAI�SCULO

SELECT INITCAP('INTRODU��O ORACLE 19C')
FROM DUAL; -- DEIXA A PRIMEIRA LETRA DE CADA PALAVRA EM MAI�SCULO E O RESTO FICA MIN�SCULO 


-- NA PRATICA
SELECT EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE LAST_NAME = 'KING'; -- N�O TROUXE RESULTADO PORQUE A COMPARA��O COM STRINGS NO ORACLE � CASE SENSITIVO

SELECT EMPLOYEE_ID, LAST_NAME "EST� EM MIN�SCULO PORQUE N�O USEI O UPPER AQUI - LAST_NAME", DEPARTMENT_ID
FROM EMPLOYEES
WHERE UPPER(LAST_NAME) = 'KING'; 
-- DEU CERTO PORQUE COM O UPPER TODOS OS LAST_NAME FICARAM MAI�SCULOS E SERVIRAM DE COMPARA��O EM SEGUIDA


-- MAIS FUN��ES DE MANIPULA��O DE CARACTERES 
SELECT CONCAT('CURSO: ', 'INTRODU��O oracle 19c')
FROM DUAL; -- CONCATENA OS STRINGS

SELECT SUBSTR('INTRODU��O oracle 19C', 1, 11)
FROM DUAL; 
/* ESTA FUNC�O PEGA APENAS PARTE DO STRING QUE EU QUISER, PRIMEIRO EU DEFINO O VALOR INICIAL{POSSO USAR O VALOR QUE EU QUISER}
, OU SEJA,NESTE CASO, A POSI��O 1  E DEPOIS A POSI��O FINAL QUE EU QUISER */

SELECT LENGTH('Introdu��o ORACLE 19c')
FROM DUAL; -- MOSTRA A QUANTIDADE DE CARACTERES 

SELECT INSTR('Introdu��o ORACLE 19C', 'ORACLE')
FROM DUAL; -- RETORNA A POSI��O DO STRING EM QUE EU ESTOU PROCURANDO, CASO N�O TIVER, ELE RETORNA 0

-- PRATICA

SELECT 
CONCAT('Curso:', 'Introdu��o ORACLE 19c'), SUBSTR('Introdu��o ORACLE 19c', 1,11), LENGTH('Introdu��o ORACLE 19c'),
INSTR('Introdu��o ORACLE 19c', 'ORACLE')
FROM DUAL;



-- MAIS FUN��ES DE MANIPULA��O DE CARACTERES 
SELECT LPAD('Introdu��o ORACLE 19c', 30, '*')
FROM DUAL; 
/* ELE PEGA OS ARTERISCOS PRESENTES NO TERCEIRO PAR�METRO DA FUN��O E INSERE NO LADO ESQUERDO DO CONJUNTO DE CARACTERES
PRESENTES NO 1� PAR�METRO AT� DAR 30 CARACTERES, QUE � O TAMANHO QUE EU DEFINI NO 2� PAR�METRO*/


SELECT RPAD('Introdu��o ORACLE 19c', 30, '*')
FROM DUAL; 
/* ELE PEGA OS ARTERISCOS PRESENTES NO TERCEIRO PAR�METRO DA FUN��O E INSERE AO LADO DIREITO DO CONJUNTO DE CARACTERES
PRESENTES NO 1� PAR�METRO AT� DAR 30 CARACTERES, QUE � O TAMANHO QUE EU DEFINI NO 2� PAR�METRO*/


SELECT REPLACE('Introdu��o ORACLE 12c', '12c', '19c')
FROM DUAL; -- SUBSTITUI O ARGUMENTO PASSADO NO 2� PAR�METRO PELO 3� PAR�METRO


SELECT TRIM(';', FROM 'nome@gmail.com;');
FROM DUAL -- REMOVE O PRIMEIRO PAR�METRO DA FUN��O AONDE QUER QUE ESTEJA ESTE ARGUMENTO NA STRING

-- PRATICA 
SELECT FIRST_NAME "Nome", LPAD(FIRST_NAME, 20, ' ') "Nome alinhado a direita",
RPAD(FIRST_NAME, 20, ' ') "Nome alinhado a esquerda"
FROM EMPLOYEES;

SELECT JOB_TITLE, REPLACE(JOB_TITLE, 'President', 'Presidente') CARGO
FROM JOBS
WHERE JOB_TITLE = 'President';

-- FUN��ES TIPO NUMBER

SELECT ROUND(45.965, 2)
FROM DUAL; -- ARREDONDA E DEIXA A QUANTIDADE DE CASAS DECIMAIS QUE EU INFORMAR NO 2 ARGUMENTO

SELECT ROUND(45.965, 0)
FROM DUAL; -- ARREDONDA E DEIXA A QUANTIDADE DE CASAS DECIMAIS QUE EU INFORMAR NO 2 ARGUMENTO

SELECT TRUNC(45.965, 2), TRUNC(45.965, 0) 
FROM DUAL; -- APENAS DEIXA A QUANTIDADE DE CASAS DECIMAIS QUE EU QUISER, N�O ARREDONDA O N�MERO


SELECT MOD(1333, 452) RESTO_DA_DIVISAO
FROM DUAL;

SELECT ABS(-9) VALOR_ABSOLUTO, SQRT(9) RAIZ_QUADRADA
FROM DUAL;

-- FUN��ES DO TIPO DATE/ TRABALHANDO COM DATA

SELECT SYSDATE, SYSDATE + 30, SYSDATE + 60, SYSDATE - 30
FROM DUAL;

SELECT FIRST_NAME || ' ' || LAST_NAME NOME, ROUND((SYSDATE - HIRE_DATE) / 7, 0)"Semanas de trabalho"
FROM EMPLOYEES; -- O RESULTADO DE CALCULO ENTRE DUAS DATAS � OBTIDO EM N�MERO DE DIAS

-- OUTRAS FUN��ES DO TIPO DATE

SELECT FIRST_NAME || ' ' || LAST_NAME NOME, ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE), 2) "Meses de trabalho"
FROM EMPLOYEES;

SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3), NEXT_DAY(SYSDATE, 'SEXTA FEIRA'), LAST_DAY(SYSDATE) ULTIMO_DIA_DO_MES
FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE,'DD/MM/YYYY HH24:MI:SS')
FROM DUAL;


SELECT SYSDATE, TO_CHAR(TRUNC(SYSDATE),'DD/MM/YYYY HH24:MI:SS' )
FROM DUAL;

-- TO CHAR COM DATAS

SELECT last_name,TO_CHAR(hire_date, 'DD/MM/YYYY  HH24:MI:SS') DT_ADMISS�O
FROM employees;

SELECT sysdate,TO_CHAR(sysdate, 'DD/MM/YYYY  HH24:MI:SS') DATA
FROM   dual;

SELECT last_name, TO_CHAR(hire_date, 'DD, "de" Month "de" YYYY') DT_ADMISS�O
FROM employees;

SELECT last_name, TO_CHAR(hire_date, 'FMDD, "de" Month "de" YYYY') DT_ADMISS�O
FROM employees; -- O FM TIRA ESPA�OS EM BRANCO E ZEROS � ESQUERDA

-- TO_CHAR COM NUMEROS
SELECT FIRST_NAME, LAST_NAME, TO_CHAR(SALARY, 'L99G999G999D99') SALARIO
FROM EMPLOYEES; -- L = MOEDA LOCAL, G UNIDADE DE MILHAR E CENTENA, D = CASA DECIMAL

-- UTILIZANDO O TO_NUMBER
SELECT TO_NUMBER('1200,50')
FROM DUAL;


-- UTILIZANDO TO_DATE
SELECT TO_DATE('06/05/2021', 'DD/MM/YYYY') DATA
FROM DUAL;

SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE = TO_DATE('17/06/2003', 'DD/MM/YYYY');
-- PARA USAR A DATA COMO COMPARA��O, EU DEVO TRANSFORMAR ELA PARA O TIPO DATE PRIMEIRO, POIS ELA VEM COMO CARACTERE

-- FUN��ES ANINHADAS

SELECT FIRST_NAME, LAST_NAME, ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE), 0) NUMERO_MESES_DESDE_A_CONTRATACAO
FROM EMPLOYEES
WHERE HIRE_DATE = TO_DATE('17/06/2003', 'DD/MM/YYYY');


-- FUN��ES GEN�RICAS (QUE TRABALHAM COM QUAISQUER TIPOS DE DADOS):
SELECT LAST_NAME, SALARY, NVL(COMMISSION_PCT, 0), SALARY * 12 SALARIO_ANUAL,
    (SALARY * 12) + (SALARY*12*NVL(COMMISSION_PCT, 0)) REMUNERACAO_ANUAL
FROM EMPLOYEES; -- ELE TRANSFORMA TODOS COMMISSION_PCT QUE S�O NULOS EM 0


-- UTILIZANDO A FUN��O COALESCE

SELECT COALESCE(NULL, NULL, 'EXPRESS�O 3'), COALESCE(NULL, 'EXPRESS�O 2', 'EXPRESS�O 3'),
       COALESCE('EXPRESS�O 1', 'EXPRESS�O 2', 'EXPRESS�O 3')
FROM DUAL; --PRIMEIRO ELE ANALISA A PRIMEIRA CONDI��O, SE FOR NULO ELE ANALISA O PROXIMO, SE N�O FOR NULO ELE MOSTRA NA TELA


SELECT LAST_NAME, EMPLOYEE_ID, COMMISSION_PCT, MANAGER_ID,
       COALESCE(TO_CHAR(COMMISSION_PCT), TO_CHAR(MANAGER_ID), 'SEM PERCENTUAL DE COMISS�O E SEM GERENTE')
FROM EMPLOYEES;

-- UTILIZANDO NVL 2
SELECT LAST_NAME, SALARY, COMMISSION_PCT, NVL2(COMMISSION_PCT, 10, 0)
FROM EMPLOYEES; -- SE COMMISION_PCT FOR NULO, ELE TRAZ O TERCEIRO ARGUMENTO (0), SE N�O FOR NULO, ELE TRAZ O 2� ARGUEMENTO (2)

-- NULLIF

SELECT NULLIF(1000, 1000), NULLIF(1000, 2000)
FROM DUAL; -- SE OS ARGUMENTOS FOREM IGUAIS, RETORNA NULL, SE FOREM DIFERENTES, RETORNA O 1 ARGUMENTO


--        EXPRESS�ES CONDICIONAIS

-- EXPRESS�O CASE

SELECT LAST_NAME, JOB_ID, SALARY, 
                          CASE JOB_ID 
                            WHEN 'IT_PROG'
                          THEN 1.10 * SALARY
                            WHEN 'ST_CLERK'
                          THEN 1.15 * SALARY
                            WHEN 'SA_REP'
                          THEN 1.20 * SALARY
                            ELSE SALARY
                     END "NOVO SALARIO"
FROM EMPLOYEES;                        
                   
-- DECODE

SELECT LAST_NAME, JOB_ID, SALARY, 
DECODE(JOB_ID, 'IT_PROG' , 1.10 * SALARY,
               'ST_CLERK', 1.15 * SALARY,
               'SA_REP'  , 1.20 * SALARY
                         , SALARY) "Novo Salario"
FROM EMPLOYEES;



-- Utilizando as fun��es AVG e SUM

SELECT AVG(SALARY), SUM(SALARY)
FROM EMPLOYEES;  -- FUN��O AVG TRAZ AS MEDIAS DE TODOS OS SALARIOS DESSA LINHA E A FUN�AO SUM SOMA OS SAL�RIOS

-- UTILIZANDO FUN��ES MIN E MAX

SELECT MIN(HIRE_DATE), MAX(HIRE_DATE)
FROM EMPLOYEES; -- MIN RETORNA A MENOR DATA DE ADMISSAO E MAX RETORNA A MAIOR DATA DE ADMISSAO

SELECT MIN(SALARY), MAX(SALARY)
FROM EMPLOYEES;


SELECT COUNT(*)
FROM EMPLOYEES; -- RETORNA O N�MERO DE LINHAS

SELECT COUNT(COMMISSION_PCT)
FROM EMPLOYEES;  -- ELE CONTA AS LINHAS EM QUE N�O TEM VALOR NULO

SELECT COUNT(NVL(COMMISSION_PCT, 0))
FROM EMPLOYEES; -- TRANSFORMEI OS VALORES NULOS EM 0 E FIZ A CONTAGEM

SELECT COUNT(DISTINCT DEPARTMENT_ID)
FROM EMPLOYEES; -- CONTA APENAS OS VALORES DISTINTOS

-- LEMBRANDO QUE ESTAS FUN��ES(FUN��ES DE GRUPO) IGNORAM OS VALORES NULOS

SELECT AVG(COMMISSION_PCT)
FROM EMPLOYEES;

-- ESTA MEDIA EST� ERRADA PORQUE ELA IGNOROU VALORES NULOS, A FORMA CORRETA SERIA

SELECT TRUNC(AVG(NVL(COMMISSION_PCT, 0)),2)
FROM EMPLOYEES; -- DESTA FORMA EST� CORRETA. OBS. ADICIONEI O TRUNC APENAS PARA TESTE


-- FUN��ES DE GRUPOS (IMPORTANTE!!!!! FUN��ES DE GRUPOS IGNORAM VALORES NULOS)
-- UTILIZANDO FUN��ES MIN E MAX
SELECT MIN(HIRE_DATE), MAX(HIRE_DATE)
FROM EMPLOYEES;

SELECT MIN(SALARY), MAX(SALARY)
FROM EMPLOYEES;

-- COUNT - CONTA O N�MERO DE LINHAS
SELECT COUNT(*)
FROM EMPLOYEES; -- MOSTRA O N�MERO TOTAL DE LINHAS

SELECT COUNT(COMMISSION_PCT)
FROM EMPLOYEES; -- CONTA AS LINAHS QUE N�O FOREM NULAS


SELECT COUNT(NVL(COMMISSION_PCT, 0))
FROM EMPLOYEES; -- RESOLVE OPROBLEMA DA CONSULTA ANTERIOR POR�M, SE EU QUERO CONTAR TODAS AS LINHAS, � S� UTILIZAR O *

SELECT COUNT(DISTINCT(DEPARTMENT_ID))
FROM EMPLOYEES;

-- TRATAMENTO DE NULOS EM FUN��ES DE GRUPO
SELECT TRUNC(AVG(NVL(COMMISSION_PCT, 0)), 2)
FROM EMPLOYEES;

-- CRIANDO GRUPOS UTILIZANDO A CL�USULA GROUP BY
SELECT DEPARTMENT_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 1; -- A CL�USULA GROUP BY ARECE COM O DISTINCT, POR�M, ELE FORMA GRUPOS DE VALORES IGUAIS, E NESTE CASO, TROUXE A M�DIA DOS SAL�RIOS TAMB�M


SELECT DEPARTMENT_ID, JOB_ID, SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
ORDER BY DEPARTMENT_ID, JOB_ID; -- EU S� POSSO EXIBIR OS DADOS DAS COLUNAS EM QUE ESTIVER NA FUN��O DE GRUPO(GROUP BY), SUM(SALARY) DEU CERTO PORQUE J� � UMA FUN��O DE GRUPO


-- FUN��ES INCORRETAS UTILIZANDO FUN��ES DE GRUPO

SELECT DEPARTMENT_ID, JOB_ID, LAST_NAME,  SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
ORDER BY DEPARTMENT_ID, JOB_ID;-- DEU ERRADO PORQUE LAST_NAME N�O FOI COLOCADO NA FUN��O GROUP BY

SELECT EMPLOYEE_ID, AVG(SALARY)
FROM EMPLOYEES;


SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
WHERE MAX(SALARY) > 10000
GROUP BY DEPARTMENT_ID; -- A CL�USULA WHERE(SOZIHA) N�O PODE SER UTILIZADA EM FUN��ES DE GRUPO PORQUE ELA SELECIONA LINHAS

-- RESOLVENDO O PROBLEMA ANTERIOR UTILIZANDO A CL�USULA HAVING

SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY) > 10000
ORDER BY DEPARTMENT_ID;

SELECT JOB_ID, SUM(SALARY) TOTAL
FROM EMPLOYEES
WHERE JOB_ID <> 'SA_REP'
GROUP BY JOB_ID
HAVING SUM(SALARY) > 10000
ORDER BY SUM(SALARY);


SELECT TRUNC(MAX(AVG(SALARY)))
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;


-- FUN��ES DE GRUPO S� PODEM SER ANINHADAS 1 VEZ

SELECT SUM(MAX(AVG(SALARY)))
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;



-- EXIBINDO DADOS A PARTIR DE M�LTIPLAS TABELAS

-- UTILIZANDO PREFIXOS COLUNA COM NOMES DE TABELA
SELECT EMPLOYEES.EMPLOYEE_ID, EMPLOYEES.LAST_NAME,
       EMPLOYEES.DEPARTMENT_ID, DEPARTMENTS.DEPARTMENT_NAME
FROM EMPLOYEES JOIN DEPARTMENTS
     ON (EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID);
     
-- UTILIZANDO ALIAS DE TABELA

SELECT e.EMPLOYEE_ID, e.LAST_NAME, e.DEPARTMENT_ID, d.DEPARTMENT_NAME
FROM EMPLOYEES e JOIN DEPARTMENTS d -- O COMANDO JOIN FAZ A LIGA��O DAS TABELAS
ON (e.DEPARTMENT_ID = d.DEPARTMENT_ID);


SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID, CITY
FROM DEPARTMENTS
NATURAL JOIN LOCATIONS; 
/*O COMANDO NATURAL JOIN FAZ A LIGA��O ENTRE DUAS TABELAS ATRAV�S DE COLUNAS
QUE TENHAM O MESMO NOME E DADOS, SE AS COLUNAS TIVEREM OS MESMOS NOMES POR�M 
DADOS DIFERENTES, A CONSULTA RETORNAR� UM ERRO
*/    

--JOIN COM A CL�USULA USING 
SELECT e.EMPLOYEE_ID, e.LAST_NAME, d.LOCATION_ID, DEPARTMENT_ID, d.DEPARTMENT_NAME
FROM EMPLOYEES e 
    JOIN DEPARTMENTS d USING (DEPARTMENT_ID); -- N�O PREFIXE UMA COLUNA QUE � UTILIZADA NA CL�USULA USING
-- AS CL�USULAS USING E NATURAL JOIN N�O S�O MUITO UTILIZADAS


-- JOIN COM A CL�USULA ON
SELECT e.EMPLOYEE_ID, e.LAST_NAME, e.DEPARTMENT_ID, d.LOCATION_ID
FROM EMPLOYEES e JOIN DEPARTMENTS d
ON (e.DEPARTMENT_ID = d.DEPARTMENT_ID);


SELECT e.EMPLOYEE_ID, j.JOB_TITLE, d.DEPARTMENT_NAME, l.CITY, l.STATE_PROVINCE, l.COUNTRY_ID
FROM EMPLOYEES e
    JOIN JOBS j        ON (e.JOB_ID = j.JOB_ID)
    JOIN DEPARTMENTS d ON (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
    JOIN LOCATIONS l   ON (d.LOCATION_ID = l.LOCATION_ID)
ORDER BY e.EMPLOYEE_ID;


-- INCLUINDO CONDI��ES ADICIONAIS A CONDI��O DE JOIN NA CL�USULA WHERE
-- ESTA FORMA � BEM INTERESSANTE DE FAZER PORQUE AS CONDI��ES DE LIGA��O FICAM NA CL�USULA ON E AS CONDI��ES RELACIONAIS FICAM NAS CL�USULAS WHERE

SELECT e.EMPLOYEE_ID, e.LAST_NAME, e.SALARY, e.DEPARTMENT_ID, d.DEPARTMENT_NAME
FROM EMPLOYEES e JOIN DEPARTMENTS d
ON (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
WHERE (e.SALARY BETWEEN 10000 AND 15000);


-- SELF JOIN UTILIZANDO A CL�USULA ON

SELECT EMPREGADO.EMPLOYEE_ID "Id empregado", EMPREGADO.LAST_NAME "Sobrenome empregado", 
       GERENTE.EMPLOYEE_ID "Id gerente", GERENTE.LAST_NAME "Sobrenome gerente"
FROM EMPLOYEES empregado JOIN EMPLOYEES gerente
ON (EMPREGADO.MANAGER_ID = GERENTE.EMPLOYEE_ID)
ORDER BY EMPREGADO.EMPLOYEE_ID;


-- NONEQUIJOINS
SELECT E.EMPLOYEE_ID, E.SALARY, J.GRADE_LEVEL, J.LOWEST_SAL, J.HIGHEST_SAL
FROM EMPLOYEES E
    JOIN JOB_GRADES J 
        ON NVL(E.SALARY, 0) BETWEEN J.LOWEST_SAL AND J.HIGHEST_SAL
ORDER BY E.SALARY;



-- OUTER JOIN - RETORNANDO REGISTROS QUE N�O CORRESPONDEM A CONDI��O DE JOIN UTILIZANDO OUTER JOIN
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D -- RETORNA OS DADOS EM QUE A COLUNA DA ESQUERDA N�O CORRESPONDE A DA DIREITA
        ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
ORDER BY D.DEPARTMENT_ID;

-- 
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E RIGHT OUTER JOIN DEPARTMENTS D -- RETORNA OS DADOS EM QUE A COLUNA DA DIREITA N�O CORRESPONDE A DA ESQUERDA
        ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
ORDER BY D.DEPARTMENT_ID;


SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E FULL OUTER JOIN DEPARTMENTS D -- RETORNA OS DADOS EM QUE A COLUNA DA DIREITA N�O CORRESPONDE A DA ESQUERDA E VICE VERSA, MOSTRA QUANDO OS DADOS DAS COLUNAS S�O DIFERENTES
        ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
ORDER BY D.DEPARTMENT_ID;

--

-- GERANDO UM PRODUTO CARTESIANO
SELECT LAST_NAME, DEPARTMENT_NAME
    FROM EMPLOYEES
        CROSS JOIN DEPARTMENTS;
        
        
-- UTILIZANDO EQUIJOIN SINTAXE ORACLE
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_ID, D.LOCATION_ID
FROM EMPLOYEES E,
     DEPARTMENTS D
WHERE (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
ORDER BY E.DEPARTMENT_ID;
-- A CONDI��O DE LIGA��O N�O EST� NA CL�USULA ON E SIM NA CL�USULA WHERE

-- INCLUINDO CONDI��ES ADICIONAIS A CONDI��O JOIN UTILIZANDO AND
SELECT E.EMPLOYEE_ID, E.SALARY, J.JOB_TITLE, D.DEPARTMENT_NAME,
       L.CITY, L.STATE_PROVINCE, L.COUNTRY_ID
FROM EMPLOYEES E,
     JOBS J,
     DEPARTMENTS D,
     LOCATIONS L
WHERE (E.JOB_ID = J.JOB_ID) AND
      (D.DEPARTMENT_ID = E.DEPARTMENT_ID) AND
      (D.LOCATION_ID = L.LOCATION_ID) AND
      (E.SALARY >= 1000)
ORDER BY E.EMPLOYEE_ID;


-- NONEQUIJOIN UTILIZANDO SINTAXE ORACLE
SELECT E.EMPLOYEE_ID, E.SALARY, J.GRADE_LEVEL, J.LOWEST_SAL, J.HIGHEST_SAL
FROM EMPLOYEES E,
     JOB_GRADES J
WHERE NVL(E.SALARY, 0) BETWEEN J.LOWEST_SAL AND J.HIGHEST_SAL
ORDER BY E.SALARY;

-- OUTER JOIN UTILIZANDO SINTAXE ORACLE
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E,
     DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+) 
-- RETORNA ITENS EM QUE A COLUNA DA DIREITA PODE N�O CORRESPONDER A DA ESQUERDA
ORDER BY E.DEPARTMENT_ID;


SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E,
     DEPARTMENTS D
WHERE E.DEPARTMENT_ID(+) = D.DEPARTMENT_ID
-- RETORNA ITENS EM QUE A COLUNA DA ESQUERDA PODE N�O CORRESPONDER A DA DIREITA 
ORDER BY E.FIRST_NAME;


-- OUTER JOIN E SELF JOIN UTLIZIANDO SINTAXE ORACLE

SELECT EMPREGADO.EMPLOYEE_ID "Id empregado", EMPREGADO.LAST_NAME "Sobrenome empregado",
       GERENTE.EMPLOYEE_ID "Id gerente", GERENTE.LAST_NAME "Sobrenome gerente"
FROM EMPLOYEES empregado,
     EMPLOYEES gerente
WHERE (EMPREGADO.MANAGER_ID = GERENTE.EMPLOYEE_ID(+))
ORDER BY EMPREGADO.EMPLOYEE_ID;


-- PRODUTO CARTESIANO(ERRO DE L�GICA)
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, J.JOB_ID, J.JOB_TITLE
FROM EMPLOYEES E,
     JOBS J
     
     -- CORRIGINDO PRODUTO CARTESIANO(ERRO DE L�GICA)
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, J.JOB_ID, J.JOB_TITLE
FROM EMPLOYEES E,
     JOBS J
WHERE E.JOB_ID = E.JOB_ID;



-- SUB CONSULTAS - SINGLE ROW
-- MOSTRE AS INFORMA��ES DOS FUNCION�RIOS EM QUE O SAL�RIO � MAIOR DO QUE A M�DIA
SELECT FIRST_NAME, LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY > 
            (SELECT AVG(NVL(SALARY, 0))
             FROM EMPLOYEES);


-- UTILIZANDO SUB_CONSULTAS NA CL�USULA HAVING
SELECT E1.DEPARTMENT_ID, MAX(E1.SALARY)
FROM EMPLOYEES E1
GROUP BY E1.DEPARTMENT_ID
HAVING MAX(SALARY) < (SELECT AVG(NVL(E2.SALARY, 0))
                     FROM EMPLOYEES E2);



-- SUB-CONSULTAS SINGLE-ROW

SELECT FIRST_NAME, LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >
                (SELECT AVG(NVL(SALARY, 0))
                 FROM EMPLOYEES);
-- RETORNA OS EMPREGADO EM QUE O SAL�RIO � MAIOR DO QUE A M�DIA



-- UTILIZANDO SUB-CONSULTAS NA CL�USULA HAVING
SELECT E1.DEPARTMENT_ID, MAX(E1.SALARY)
FROM EMPLOYEES E1
GROUP BY E1.DEPARTMENT_ID
HAVING MAX(SALARY) < (SELECT AVG(E2.SALARY)
                      FROM EMPLOYEES E2);
--RETORNA OS DADOS DO DEPARTAMENTO E SAL�RIO MAXIMO EM QUE O SALARIO � MENOR QUE A M�DIA
                      
   
   
-- ERROS UTILIZANDO SUB-CONSULTAS SINGLE ROW
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
FROM EMPLOYEES 
WHERE SALARY = 
               (SELECT AVG(NVL(SALARY, 0))
                FROM EMPLOYEES
                GROUP BY DEPARTMENT_ID);
-- OCORREU O ERO PORQUE O GROUP BY RETORNA MAIS DE UMA LINHA


-- SUB-CONSULTAS MULTIPLE ROW

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
FROM EMPLOYEES 
WHERE SALARY IN
               (SELECT AVG(NVL(SALARY, 0))
                FROM EMPLOYEES
                GROUP BY DEPARTMENT_ID);
-- RETORNA OS EMPREGADOS EM QUE O SAL�RIO SEJA IGUAL AOS VALORES DO 2 SELECT 


-- MULTIPLE ROW COM NOT IN
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
FROM EMPLOYEES 
WHERE SALARY NOT IN
               (SELECT AVG(NVL(SALARY, 0))
                FROM EMPLOYEES
                GROUP BY DEPARTMENT_ID);


-- UTLIZANDO ANY EM SUB-CONSULTAS MULTIPLE ROW
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES 
WHERE SALARY < ANY
               (SELECT SALARY
                FROM EMPLOYEES
                WHERE JOB_ID = 'IT_PROG');
-- RETORNA OS EMPREGADOS QUE SEJA MENOR QUE QUALQUER(ANY) UM DOS VALORES DO 2 SELECT



-- UTLIZANDO ALL EM SUB-CONSULTAS MULTIPLE ROW
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES 
WHERE SALARY < ALL
               (SELECT SALARY
                FROM EMPLOYEES
                WHERE JOB_ID = 'IT_PROG');
-- RETORNA OS EMPREGADOS QUE SEJA MENOR QUE TODOS(ALL) OS VALORES DO 2 SELECT



-- SUB-CONSULTAS CORRELACIONADAS
SELECT E1.EMPLOYEE_ID, E1.FIRST_NAME, E1.LAST_NAME, E1.DEPARTMENT_ID, E1.SALARY
FROM EMPLOYEES E1
WHERE E1.SALARY >= (SELECT TRUNC(AVG(NVL(SALARY,0)),0)
                    FROM EMPLOYEES E2
                    WHERE E1.DEPARTMENT_ID = E2.DEPARTMENT_ID);


-- UTILIZANDO SUB-CONSULTAS MULTIPLE COLUM
SELECT E1.EMPLOYEE_ID, E1.FIRST_NAME, E1.JOB_ID, E1.SALARY
FROM EMPLOYEES E1
WHERE (E1.JOB_ID, E1.SALARY) IN (SELECT E2.JOB_ID, MAX(E2.SALARY)
                                 FROM EMPLOYEES E2
                                 GROUP BY E2.JOB_ID);
-- SE USAR + DE 1 COLUNA COMO EXPRESS�I RELACIONAL, DEVE-SE TER A MESMA QUANTIDADE DE COLUNAS NO 2 SELECT



