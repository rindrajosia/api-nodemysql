const pool = require('../config');

let score = {};

score.high = () => {
  return new Promise((resolve, reject) => {
    pool.query(`SELECT candidate, name, SUM(note) as Score_Total FROM note, candidate WHERE candidate.id = note.candidate GROUP BY candidate ORDER BY Score_Total DESC
LIMIT 1`, (err, results) => {
      if(err){
        return reject(err);
      }
      return resolve(results);
    });
  });
}

score.average = () => {
  return new Promise((resolve, reject) => {
    pool.query(`SELECT candidate, name, ROUND(AVG(note),2) as AVG_Score FROM note, candidate WHERE candidate.id = note.candidate GROUP BY candidate ORDER BY AVG_Score DESC`, (err, results) => {
      if(err){
        return reject(err);
      }
      return resolve(results);
    });
  });
}

score.insert = (newScore) => {
  return new Promise((resolve, reject) => {
    pool.query(`INSERT INTO note set ?`, [newScore], (err, results) => {
      if(err){
        return reject(err);
      }
      console.log("created score: ", { id: results.insertId, ...newScore });
      return resolve(results);
    });
  });
}

module.exports = score;
