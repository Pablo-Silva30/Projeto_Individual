var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");


router.post("/mostrargrafico1", function (req, res) {
    medidaController.mostrargrafico1(req, res);
})

router.post("/mostrargrafico2", function (req, res) {
    medidaController.mostrargrafico2(req, res);
})

router.post("/kpi1", function (req, res) {
    medidaController.kpi1(req, res);
})

router.post("/kpi2", function (req, res) {
    medidaController.kpi2(req, res);
})
module.exports = router;