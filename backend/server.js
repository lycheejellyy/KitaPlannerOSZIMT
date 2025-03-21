const express = require('express');
const cors = require('cors');
app = express()
bodyparser = require('body-parser');

const PORT = 3000;
const db = require('./config/db');
const bodyParser = require('body-parser');
childrenRoutes = require('./controllers/childController')

//middleware
app.use(bodyparser.json())
app.use(cors()); 
app.use('/api/children', childrenRoutes)


db.query("SELECT * from `child`")
.then(([rows, fields]) => 
   { console.log("database data: " + JSON.stringify(rows)) //fields contain metadata - not needed for now
    app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
})
.catch(err => console.log('db connection failed. details: ' + err))

