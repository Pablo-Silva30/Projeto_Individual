CREATE DATABASE Gym_Life;

USE Gym_Life;

CREATE TABLE usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
email VARCHAR(100),
CONSTRAINT chkEmail CHECK (email LIKE('%@%.%')),
senha VARCHAR(100),
fkImc INT,
CONSTRAINT fkImcUser FOREIGN KEY(fkImc) REFERENCES imc(id)
);

INSERT INTO usuario(nome, email, senha, fkImc) VALUES
('Pablo', 'pablo@gmail.com', '123', 1); 

CREATE TABLE imc(
id INT PRIMARY KEY AUTO_INCREMENT,
imc INT
);

INSERT INTO imc(imc) VALUES 
(25);

CREATE TABLE planilha_treino(
id INT PRIMARY KEY AUTO_INCREMENT,
experiencia VARCHAR(45),
agrupamento VARCHAR(45),
dia_semana	VARCHAR(45),
fkUsuario INT, 
CONSTRAINT fkPlanilha_Usuario FOREIGN KEY(fkUsuario) REFERENCES usuario(id)
);


INSERT INTO planilha_treino(experiencia, agrupamento, dia_semana, fkUsuario) VALUES
('Intermediario', 'Peito/Triceps', 'Segunda-Feira', 1);


SELECT 
	u.nome as 'Nome',
		i.imc AS 'IMC',
			p.experiencia as 'Nivel', 
				p.agrupamento AS 'agrupamento'
						FROM usuario as u JOIN imc as i ON i.id = u.fkImc
								JOIN planilha_treino as p ON u.id = p.fkUsuario; 