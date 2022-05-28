import express from "express";
import bodyParser from "body-parser";
// bodyparser giúp lay request người dùng gửi lên ví dụ /user?id=7
import viewEngine from "./config/viewEngine";
import initWebRoute from "./route/web";
import connectDB from "./config/connectDB";
require('dotenv').config();


let app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }))

viewEngine(app);
initWebRoute(app);

connectDB();

let port = process.env.PORT || 6969;
//port === undefine => port 6969

app.listen(port, () => {
    // call back
    console.log("Back end NODE JS is runing on the port:" + port)
})