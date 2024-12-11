const express = require('express'),
router = express.Router()
const db = require('../config/db')

//http:localhost:3000/api/children
router.get('/', async(req,res) => {
  const [rows] = await db.query("SELECT * FROM `child`")
  .catch(err => console.log("Error while fetching child data: " + err))
  res.json(rows)
}) 


module.exports = router;