CREATE DATABASE Gym_Life;

USE Gym_Life;

CREATE TABLE usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
email VARCHAR(100),
CONSTRAINT chkEmail CHECK (email LIKE('%@%.%')),
senha VARCHAR(100)
);

SELECT id,nome, email, senha FROM usuario WHERE email like '%@%' AND senha like '%';

CREATE TABLE planilha_treino(
id INT PRIMARY KEY AUTO_INCREMENT,
agrupamento VARCHAR(45),
dia_semana	VARCHAR(45),
fkUsuario INT, 
CONSTRAINT fkPlanilha_Usuario FOREIGN KEY(fkUsuario) REFERENCES usuario(id)
);

SELECT * FROM planilha_treino;

INSERT INTO planilha_treino(agrupamento, dia_semana, fkUsuario) VALUES
('Peito/Triceps', 'Segunda-Feira', 1);


SELECT 
	u.nome as 'Nome',
				p.agrupamento AS 'agrupamento'
						FROM usuario as u
								JOIN planilha_treino as p ON u.id = p.fkUsuario; 