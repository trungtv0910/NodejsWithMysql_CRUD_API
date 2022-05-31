import { all } from 'express/lib/application';
import { render } from 'express/lib/response';
import db from '../models/index';
import CRUDService from '../services/CRUDService';
let getHomePage = async (req, res) => {
    try {
        let data = await db.User.findAll();
        // console.log('DATA=', data);
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
let getEditCRUD = async (req, res) => {

    let userId = req.params.id;


    let userData = await CRUDService.getUserInfoById(userId);
    if (userData) {
        return res.render('editCRUD.ejs', { userData: userData })
    } else {
        return res.send("User's not found!");
    }



}
let putCRUD = async (req, res) => {
    let data = req.body;

    let allUsers = await CRUDService.updateUserData(data);
    return res.render("displayCRUD.ejs", { data: allUsers });
}
let deleteCRUD = async (req, res) => {
    let userId = req.query.id;
    if (userId) {
        let allUsers = await CRUDService.deleteUserById(userId)
        // return res.render("displayCRUD.ejs", { data: allUsers });
        return res.redirect('/get-crud');
    } else {
        return res.send('User not found');
    }



}
module.exports = {
    getHomePage: getHomePage,
    getCRUD: getCRUD,
    createCrud: createCrud,
    displayGetCRUD: displayGetCRUD,
    getEditCRUD: getEditCRUD,
    putCRUD: putCRUD,
    deleteCRUD: deleteCRUD
}