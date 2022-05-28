import { all } from 'express/lib/application';
import db from '../models/index';
import CRUDService from '../services/CRUDService';
let getHomePage = async (req, res) => {
    try {
        let data = await db.User.findAll();
        console.log('DATA=', data);
        return res.render('homepage.ejs', { data: data });
    } catch (e) {
        console.log(e);
    }

    return res.send("hello home controller");

}

let getCRUD = async (req, res) => {


    return res.render('crud.ejs');


}
let createCrud = async (req, res) => {
    let message = await CRUDService.createNewUser(req.body);
    console.log(message);
    return res.send("đang ở trang post");
}

let displayGetCRUD = async (req, res) => {

    let data = await CRUDService.getAllUser();
    return res.render("displayCRUD.ejs", { data: data });


}

module.exports = {
    getHomePage: getHomePage,
    getCRUD: getCRUD,
    createCrud: createCrud,
    displayGetCRUD: displayGetCRUD
}