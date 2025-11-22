var express = require("express");
var router = express.Router();

var planilhaController = require("../controllers/planilhaController");

router.post("/cadastrarPlanilha", function (req, res) {
    planilhaController.cadastrarPlanilha(req, res);
})

module.exports = router;