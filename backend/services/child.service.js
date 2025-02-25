const db = require('../config/db')

module.exports.getAllChildren = async ()=>{
    const [rows] = await db.query("SELECT * FROM `child`")
      .catch(err => console.log("Error while fetching child data: " + err))
      return rows;
}

module.exports.getChildById = async (id)=>{
    const [rows] = await db.query("SELECT * FROM `child` WHERE id = "+  id)
      .catch(err => console.log("Error while fetching child data: " + err))
      return rows;
}

module.exports.deleteChild = async (id)=>{
    const [rows] = await db.query("DELETE FROM `child` WHERE id = ?", [id])
      .catch(err => console.log("Error while fetching child data: " + err))
      return rows;
}

module.exports.addOrEditChild = async (obj, id = 5)=>{
  const [rows] = await db.query("CALL adding_children(?,?,?,?,?,?)", [obj.name, obj.gender, obj.birthdate, obj.kita, obj.supervisor, id])
    return rows;
}