const express = require('express'),
app = express()

const PORT = 3000;
const db = require('./config/db')
childrenRoutes = require('./controllers/childController')

//middleware
app.use('/api/children', childrenRoutes)


db.query("SELECT * from `child`")
.then(([rows, fields]) => 
   { console.log("database data: " + JSON.stringify(rows)) //fields contain metadata - not needed for now
    app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
})
.catch(err => console.log('db connection failed. details: ' + err))

