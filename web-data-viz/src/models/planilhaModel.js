var database = require("../database/config")

function cadastrarPlanilha(agrupamento, semana){ 
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar_Planilha():", agrupamento, semana);
 
    var instrucaoSql = `
        INSERT INTO planilha_treino (agrupamento, semana) VALUES ('${agrupamento}', '${semana}');`;
        
    
    
        console.log("Execuntando a instrução SQL: \n" + instrucaoSql);

        return database.executar(instrucaoSql);
    }
module.exports = {
    cadastrarPlanilha
};