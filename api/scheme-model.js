// scheme-model
const db = require("../data/db-config");

//helper functions

function find(){
    return db("schemes");
}
function findById(id){
return db("schemes").where({id}).first()
}
 function add(scheme){
   return db("schemes")
   .insert(scheme)
   .then(ids => {
       return findById(ids[0]);
   })
}
function update(changes, id){
    return db("schemes")
    .where({id})
    .update(changes)
    
}
function remove(id){
    return db("schemes")
    .where('id', id)
    .del()
}
function findSteps(id){
    return db("steps as s")
    .leftJoin("schemes as sch", "s.scheme_id", "sch.id")
    .select("s.id","sch.scheme_name","s.step_number","s.instructions")
    .where("scheme_id",id)
    .orderBy("s.step_number")
}
function getStepsByID(id) {
    return db("steps").where("id", id).first()
}
async function addStep(step, scheme_id){
   const [id] = await db("steps").insert(step)
    return getStepsByID(id)
   
}
module.exports = {
    find,
    findById,
    add,
    update,
    remove,
    findSteps,
    addStep
}