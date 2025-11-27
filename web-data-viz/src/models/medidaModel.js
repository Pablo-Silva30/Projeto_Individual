var database = require("../database/config");

function mostrargrafico1(fkUsuario) {

    var instrucaoSql = `SELECT p.agrupamento as agrupamento,COUNT(agrupamento) as qtdAgrupamento FROM planilha_treino as p JOIN usuario as u ON u.id = p.fkUsuario WHERE p.fkUsuario = '${fkUsuario}' GROUP BY agrupamento;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function mostrargrafico2(visitante) {

    var instrucaoSql = `SELECT agrupamento as agrupamento,COUNT(agrupamento) as qtdAgrupamento FROM planilha_treino GROUP BY agrupamento;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function kpi1(fkUsuario) {

    var instrucaoSql = `SELECT u.nome,p.agrupamento, COUNT(p.agrupamento) AS total
    FROM planilha_treino AS p
    JOIN usuario AS u ON u.id = p.fkUsuario
    WHERE u.id = ${fkUsuario}
    GROUP BY u.nome, p.agrupamento
    ORDER BY total
    DESC LIMIT 1;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function kpi2(fkUsuario) {

    var instrucaoSql = `SELECT u.nome,p.dia_semana, COUNT(p.agrupamento) AS total
    FROM planilha_treino AS p
    JOIN usuario AS u ON u.id = p.fkUsuario
    WHERE u.id = ${fkUsuario}
    GROUP BY u.nome, p.dia_semana
    ORDER BY total 
    DESC LIMIT 1;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}
module.exports = {
    mostrargrafico1,
    mostrargrafico2,
    kpi1,
    kpi2
}
