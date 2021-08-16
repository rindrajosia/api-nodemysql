const pool = require('../config');

let candidate = {};


candidate.all = () => {
  return new Promise((resolve, reject) => {
    pool.query(`SELECT * FROM candidate`, (err, results) => {
      if(err){
        return reject(err);
      }
      return resolve(results);
    });
  });
}

candidate.one = (id) => {
  return new Promise((resolve, reject) => {
    pool.query(`SELECT * FROM candidate WHERE id = ?`, [id], (err, results) => {
      if(err){
        return reject(err);
      }
      return resolve(results[0]);
    });
  });
}

candidate.insert = (newCandidate) => {
  return new Promise((resolve, reject) => {
    pool.query(`INSERT INTO candidate set ?`, [newCandidate], (err, results) => {
      if(err){
        return reject(err);
      }
      console.log("created candidate: ", { id: results.insertId, ...newCandidate });
      return resolve(results);
    });
  });
}

module.exports = candidate;
