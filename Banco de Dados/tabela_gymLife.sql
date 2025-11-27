CREATE DATABASE Gym_Life;

USE Gym_Life;

CREATE TABLE usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
email VARCHAR(100) UNIQUE,
senha VARCHAR(100)
);

CREATE TABLE planilha_treino (
id INT PRIMARY KEY AUTO_INCREMENT,
agrupamento VARCHAR(45),
dia_semana	VARCHAR(45),
fkUsuario INT, 
CONSTRAINT fkPlanilha_Usuario FOREIGN KEY(fkUsuario) REFERENCES usuario(idUsuario)
);




SELECT p.agrupamento as agrupamento,COUNT(agrupamento) as qtdAgrupamento
 FROM planilha_treino as p 
 JOIN usuario as u ON u.id = p.fkUsuario 
 WHERE p.fkUsuario = p.fkUsuario
 GROUP BY p.agrupamento
 ORDER BY p.agrupamento
 LIMIT 1;

SELECT u.nome,p.agrupamento, COUNT(*) AS total
FROM planilha_treino AS p
JOIN usuario AS u ON p.fkUsuario = u.id
WHERE u.id = p.fkUsuario
GROUP BY p.agrupamento, u.nome 
ORDER BY total DESC
LIMIT 1;


SELECT u.nome, p.dia_semana, COUNT(p.agrupamento) AS total
FROM planilha_treino AS p
JOIN usuario AS u ON p.fkUsuario = u.id
WHERE u.id = p.fkUsuario
GROUP BY p.dia_semana, u.nome
ORDER BY total DESC;  


SELECT u.nome,p.agrupamento, COUNT(*) AS total
FROM planilha_treino AS p
JOIN usuario AS u ON p.fkUsuario = u.id
WHERE u.id = 1
GROUP BY u.nome, p.agrupamento;

