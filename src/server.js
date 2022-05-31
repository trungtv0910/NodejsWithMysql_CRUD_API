import express from "express";
import bodyParser from "body-parser";
// bodyparser giúp lay request người dùng gửi lên ví dụ /user?id=7
import viewEngine from "./config/viewEngine";
import initWebRoute from "./route/web";
import connectDB from "./config/connectDB";

import cors from 'cors';
require('dotenv').config();


let app = express();
// app.use(cors({ origin: true }));

//  sử dụng middleware để xây sửa lỗi Cors
// Add headers before the routes are defined
app.use(function (req, res, next) {

    // Website you wish to allow to connect
    res.setHeader('Access-Control-Allow-Origin', process.env.URL_REACT);

    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');

    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');

    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);

    // Pass to next layer of middleware
    next();
});


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