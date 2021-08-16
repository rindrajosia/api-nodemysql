const express = require("express");
const score = require("../db/score");
const router = express.Router();

router.get('/high', async (request, response, next) => {
  try {
    let results = await score.high();
    response.json(results);
  } catch(e){
    console.log(e);
    response.sendStatus(500);
  }
});

router.get('/average', async (request, response, next) => {
  try {
    let results = await score.average();
    response.json(results);
  } catch(e){
    console.log(e);
    response.sendStatus(500);
  }
});

router.post('/', async (request, response, next) => {
  if (!request.body.candidate || !request.body.round ||  !request.body.note ) {
    response.status(400).send({
      message: "Candidate, Round and Note should not be empty!"
    });
  }

  if (!request.body.round > 3 ||  !request.body.note < 0 ) {
    response.status(400).send({
      message: "Round should not be between 1 and 3!"
    });
  }

  if (!request.body.note > 10 ||  !request.body.note < 0 ) {
    response.status(400).send({
      message: "Note should not be between 0 and 10!"
    });
  }

  try {
    let results = await score.insert(request.body);
    response.json(results);
  } catch(e){
    console.log(e);
    response.sendStatus(400);
  }
});


module.exports = router;
