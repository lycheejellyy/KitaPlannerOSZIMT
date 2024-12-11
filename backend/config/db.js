const mysql = require('mysql2/promise')

const mysqlPool = mysql.createPool({
    host:'localhost',
    user: 'beller',
    password: 'kuno',
    database:'development'
})

module.exports = mysqlPool