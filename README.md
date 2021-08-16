# Excellence Technologies

This project is about using expressjs with mysql. I have design database tables based on requirements.

## Databse:

1] First you need to create DB called excellence:

* CREATE DATABASE excellence;

2] Import excellence.sql into your MySQL or, you can just copy and past the content of this file inside your sql terminal.

4] In this project, we have 3 tables:
* a] 'candidate table' that contains information about candidate.
* b] 'note table that' join candidate table and round tables. It stores also the score of candidate.
* c] 'round table that contains list of round.


## API documentation:
| URL                                                                     | Method | Description                                          |
|-------------------------------------------------------------------------|--------|------------------------------------------------------|
| http://localhost:5000/api/candidates                                    | GET    | Get all candidates                                   |
| http://localhost:5000/api/candidates/id                                 | GET    | Get one candidate                                    |
| http://localhost:5000/api/candidates                                    | POST   | Create a new candidate                               |
| http://localhost:5000/api/score/high                                    | GET    | Get highest scoring candidate                        |
| http://localhost:5000/api/score/average                                 | GET    | GET average scores per round for all candidates      |
| http://localhost:5000/api/score                                         | POST   | Insert new score                                     |

## POST method:
1] For candidate, your data should be in a json format and look like:

{
"name": "Feno",
"email": "feno@gmail.com"
}
* name and email are required. email should be unique.

2] For score, your data should be in a json format and look like:
{
"candidate": 1,
"round": 1,
"note": 4
}
* candidate and round are required. There should be a corresponding data inside candidate and round tables.



## Built With

- Nodejs.
- Express.


## Getting Started

* You can get a local copy of the repository please run the following commands on your terminal:s

$ cd < folder >

$ git clone https://github.com/rindrajosia/api-nodemysql.git

$ git checkout feature

* You need to install the required packages:

$ npm install

### File free to update information inside srever/config/index.js based on your environment

* And run the server:

$ npm run start


## Author

👤 **Rindra josia**

* Github: **[@rindrajosia](https://github.com/rindrajosia)**
* Twitter: **[@rindrajosia](https://twitter.com/josia_rindra)**
* Linkedin: **[linkedin](https://www.linkedin.com/in/rindrajosia/)**

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/rindrajosia/api-nodemysql/issues).

## Show your support

Give a ⭐️ if you like this project!
