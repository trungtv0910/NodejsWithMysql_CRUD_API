import db from '../models/index';
import bcrypt from 'bcryptjs';
import { reject } from 'bcrypt/promises';

const salt = bcrypt.genSaltSync(10);

let handleUserLogin = (email, password) => {
    return new Promise(async (resolve, reject) => {
        try {
            let userData = {};
            let isExist = await checkUserEmail(email);
            if (isExist) {

                let user = await db.User.findOne({
                    attributes: ['email', 'roleId', 'password'],
                    where: { email: email },
                    raw: true
                    // attributes: {
                    // include: ['email', 'roleId'], // define columns that you want to show
                    // exclude: ['password'] // define columns, that you don't want 
                    // }
                });
                if (user) {
                    //compare password
                    let check = await bcrypt.compareSync(password, user.password);

                    if (check) {
                        userData.errCode = 0;
                        userData.errMessage = `Login Success `;
                        // Xoá đi password của người dùng, tránh lộ thông tin bảo mật
                        delete user.password;
                        userData.user = user
                    } else {
                        userData.errCode = 3;
                        userData.errMessage = `Wrong password `;

                    }
                } else {
                    userData.errCode = 2;
                    userData.errMessage = `User's not found`;

                }


            } else {
                userData.errCode = 1;
                userData.errMessage = `Your's Email isn't exist in your system. Plz try other email!`;


            }
            resolve(userData);
        } catch (error) {
            reject(error);
        }
    });
}


let checkUserEmail = (userEmail) => {
    return new Promise(async (resolve, reject) => {
        try {
            let user = await db.User.findOne({
                where: { email: userEmail }, raw: true
            });

            if (user) {
                resolve(true);
            } else {
                resolve(false);
            }

        } catch (error) {
            reject(error);
        }
    });
}

let getAllUsers = (userId) => {
    return new Promise(async (resolve, reject) => {
        try {
            let users = '';
            if (userId === 'ALL') {
                users = await db.User.findAll({
                    attributes: {
                        exclude: ['password'] // define columns, that you don't want 
                    }
                })
            }
            if (userId && userId !== 'ALL') {
                users = await db.User.findOne({
                    where: { 'id': userId },
                    attributes: {
                        exclude: ['password'] // define columns, that you don't want 
                    }
                })
            }
            resolve(users);
        } catch (error) {
            reject(error);
        }
    });
}
let createNewUser = async (data) => {
    return new Promise(async (resolve, reject) => {
        try {
            //check email is exist ?
            let check = await checkUserEmail(data.email);
            if (check === true) {
                resolve({
                    errCode: 1,
                    message: 'Your Email is Areadly in used, Plz try another email!'
                })
            } else {
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
                resolve({
                    errCode: 0,
                    message: 'OK'
                })
            }


        } catch (error) {
            reject(error);
        }
    })
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
let deleteUser = (userId) => {
    return new Promise(async (resolve, reject) => {

        try {
            //check email is exist ?
            let foundUser = await db.User.findOne({
                where: { id: userId }
            })
            if (!foundUser) {
                resolve({
                    errCode: 2,
                    message: "The user isn't exist"
                })
            } else {
                let deleteUser = await db.User.destroy({ where: { id: userId } })
                if (deleteUser) {
                    resolve({
                        errCode: 0,
                        message: "OK"
                    })
                } else {
                    resolve({
                        errCode: 1,
                        message: "Cannot Delete User"
                    })
                }

            }

        } catch (error) {
            reject(error)
        }

    })
}
let updateUserData = (data) => {
    return new Promise(async (resolve, reject) => {
        try {
            if (!data.id) {
                resolve({
                    errCode: 2,
                    message: 'Missing required parameter!'
                });
            } else {
                let user = await db.User.findOne({ where: { id: data.id } });
                if (user) {
                    await db.User.update({
                        firstName: data.firstName,
                        lastName: data.lastName,
                        address: data.address,
                        phoneNumber: data.phoneNumber
                    }, { where: { id: data.id } });

                    resolve({
                        errCode: 0,
                        message: 'Update the user succeeds!'
                    });
                } else {
                    resolve({
                        errCode: 1,
                        message: `User's Not Found!`
                    });
                }
            }

        } catch (error) {
            reject(error)
        }
    })
}

module.exports = {
    handleUserLogin: handleUserLogin,
    getAllUsers: getAllUsers,
    createNewUser: createNewUser,
    deleteUser: deleteUser,
    updateUserData: updateUserData

}