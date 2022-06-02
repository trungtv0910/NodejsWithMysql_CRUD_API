import express from "express";
import homeController from '../controllers/homeController';
import userController from '../controllers/userController';



let route = express.Router();

let initWebRoute = (app) => {

    route.get('/', homeController.getHomePage)
    route.get('/home', homeController.getHomePage);
    route.get('/crud', homeController.getCRUD);
    route.post('/createCrud', homeController.createCrud);

    route.get('/edit-crud/:id', homeController.getEditCRUD);
    route.get('/get-crud', homeController.displayGetCRUD);
    route.post('/put-crud', homeController.putCRUD);

    route.get('/delete-crud', homeController.deleteCRUD);

    // xử lý về API với react JS
    route.post('/api/login', userController.handleLogin);
    route.get('/api/get-all/users', userController.handleGetAllUsers);
    route.post('/api/create-new-user', userController.handleCreateNewUser);
    // với react thì ta được dùng phương thức put và delete
    route.put('/api/edit-user', userController.handleEditUser);
    route.delete('/api/delete-user', userController.handleDeleteUser); //rest API

    return app.use("/", route);
}
module.exports = initWebRoute