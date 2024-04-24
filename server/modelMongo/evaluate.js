const mongoose = require('mongoose');

const url = "mongodb+srv://dbmsAplus:t5me7jtjBalwVC4q@cluster0.i9cysua.mongodb.net/shoppe_dbms?retryWrites=true&w=majority&appName=Cluster0";

mongoose.connect(url, {useNewUrlParser: true, useUnifiedTopology: true})
.then(() => {
    console.log("Kết nối thành công");
}).catch((err) => {
    throw err;
})
// create table
const Schema = mongoose.Schema;
const ObjectId = mongoose.ObjectId;

const evaluated = new Schema({
    product_id : {type: Number},
    commented: {type: String},
    voted: {type: Number, default: 0},
    createdAt: {type: Date, default: new Date},
    updatedAt: {type: Date, default: new Date},
});
module.exports = mongoose.model("evaluate", evaluated)