CREATE DATABASE Gym_Life;

USE Gym_Life;

CREATE TABLE usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
email VARCHAR(100) UNIQUE,
CONSTRAINT chkEmail CHECK (email LIKE('%@%.%')),
senha VARCHAR(100)
);

select * from usuario;

CREATE TABLE planilha_treino(
id INT PRIMARY KEY AUTO_INCREMENT,
agrupamento VARCHAR(45),
dia_semana	VARCHAR(45),
fkUsuario INT, 
CONSTRAINT fkPlanilha_Usuario FOREIGN KEY(fkUsuario) REFERENCES usuario(id)
);




SELECT u.nome,
p.dia_semana as 'Dia da Semana:',
p.agrupamento as agrupamento,COUNT(p.agrupamento) as 
qtdAgrupamento FROM planilha_treino as p JOIN usuario as u ON u.id = p.fkUsuario 
WHERE p.agrupamento < (SELECT  COUNT(p.agrupamento) FROM planilha_treino)
GROUP BY u.nome, p.agrupamento, p.dia_semana;

SELECT agrupamento, COUNT(*) AS total
FROM planilha_treino
GROUP BY agrupamento
ORDER BY total DESC
LIMIT 1;

SELECT u.nome, p.dia_semana, COUNT(*) AS total
FROM planilha_treino AS p
JOIN usuario AS u ON p.fkUsuario = u.id
GROUP BY p.dia_semana, u.nome
ORDER BY total DESC
LIMIT 1;  
