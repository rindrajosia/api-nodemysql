const express = require("express");
const candidateRoute = require("./routes/candidateRoute");
const scoreRoute = require("./routes/scoreRoute");
const app = express();

app.use(express.json());

app.use('/api/candidates', candidateRoute);
app.use('/api/score', scoreRoute);

app.listen(process.env.Port || 5000, () => {
  console.log(`Server running mode on port ${process.env.Port}`);
});
