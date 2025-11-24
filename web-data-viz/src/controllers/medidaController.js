var medidaModel = require("../models/medidaModel");

function mostrargrafico1(req, res) {
    var fkUsuario = req.body.idServer;
    
    medidaModel.mostrargrafico1(fkUsuario).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar dados da planilha.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function mostrargrafico2(req, res) {
    var visitante = req.body.VisitanteServer;
    
    medidaModel.mostrargrafico2(visitante).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar dados da planilha.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function kpi1(req, res) {
    var visitante = req.body.agrupamento;
    
    medidaModel.kpi1(visitante).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar dados da planilha.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function kpi2(req, res) {
    var visitante = req.body.semana;
    
    medidaModel.kpi2(visitante).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar dados da planilha.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}
module.exports = {
    mostrargrafico1,
    mostrargrafico2,
    kpi1,
    kpi2
}