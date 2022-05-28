
import { reject } from 'bcrypt/promises';
import bcrypt from 'bcryptjs';
import { flatten } from 'express/lib/utils';
import db from '../models/index';
const salt = bcrypt.genSaltSync(10);


let createNewUser = async (data) => {
    return new Promise(async (resolve, reject) => {
        try {
            let hassPasswordFromBcrypt = await hashUserPassword(data.password);
            await db.User.create({
                email: data.email,
                firstName: data.firstName,
                lastName: data.lastName,
                password: hassPasswordFromBcrypt,
                address: data.address,
                gender: data.gender === '1' ? true : false,
                image: data.image,
                roleId: data.roleId,
                phoneNumber: data.phone,

            })
            resolve('Ok! create a new user success')
        } catch (error) {
            reject(error)
        }
    });

}


let hashUserPassword = (password) => {
    return new Promise(async (resolve, reject) => {

        try {
            let hashPassword = await bcrypt.hashSync(password, salt);
            resolve(hashPassword)
        } catch (error) {
            reject(error)
        }

    })
}

let getAllUser = () => {
    return new Promise(async (resolve, reject) => {
        try {
            let users = await db.User.findAll({
                raw: true
            });
            resolve(users);
        } catch (error) {
            reject(error)
        }

    })
}
let getUserInfoById = (id) => {
    return new Promise(async (resolve, reject) => {
        try {
            let user = await db.User.findOne({ where: { id: id }, raw: true });
            if (user) {
                resolve(user)
            } else {
                resolve(null)
            }

        } catch (error) {
            reject(error)
        }
    });
}
let updateUserData = (data) => {
    return new Promise(async (resolve, reject) => {

        try {
            let user = await db.User.findOne({ where: { id: data.id } });
            if (user) {
                user.firstName = data.firstName;
                user.lastName = data.lastName;
                user.address = data.address;
                user.phoneNumber = data.phoneNumber;
                await user.save();
                let allUsers = await db.User.findAll();
                resolve(allUsers);
            } else {
                resolve(null);
            }


        } catch (error) {
            reject(error)
        }
    })
}
let deleteUserById = (userId) => {
    return new Promise(async (resolve, reject) => {
        try {
            let user = await db.User.findOne({ where: { id: userId } });
            if (user) {
                user.destroy();
                let allUsers = await db.User.findAll();
                resolve(allUsers);

            } else {
                resolve(null);
            }
        } catch (error) {
            reject(error)
        }
    })
}

module.exports = {
    createNewUser: createNewUser,
    hashUserPassword: hashUserPassword,
    getAllUser: getAllUser,
    getUserInfoById: getUserInfoById,
    updateUserData: updateUserData,
    deleteUserById: deleteUserById
}