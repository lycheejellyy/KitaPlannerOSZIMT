const express = require('express'),
router = express.Router()


const service = require('../services/child.service')

//http:localhost:3000/api/children
router.get('/', async(req,res) => {
  const children = await service.getAllChildren()
  res.json(children)
}) 

router.get('/:id', async(req,res) => {
  const child = await service.getChildById(req.params.id)
  res.json(child)
}) 

router.delete('/:id', async(req,res) => {
  const child = await service.deleteChild(req.params.id)
  res.json(child)
}) 

router.post('/', async(req,res) => {
  await service.addOrEditChild(req.body)
  res.status(201).send('created successfully')
}) 


module.exports = router;