const express = require("express");
const candidate = require("../db/candidate");
const router = express.Router();

router.get('/', async (request, response, next) => {
  try {
    let results = await candidate.all();
    response.json(results);
  } catch(e){
    console.log(e);
    response.sendStatus(500);
  }
});

router.get('/:id', async (request, response, next) => {
  try {
    let results = await candidate.one(request.params.id);
    response.json(results);
  } catch(e){
    console.log(e);
    response.sendStatus(500);
  }
});

router.post('/', async (request, response, next) => {
  if (!request.body.name || !request.body.email) {
    response.status(400).send({
      message: "Content can not be empty!"
    });
  }

  try {
    let results = await candidate.insert(request.body);
    response.json(results);
  } catch(e){
    console.log(e);
    response.sendStatus(400);
  }
});


module.exports = router;
