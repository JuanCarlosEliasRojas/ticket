const Joi = require('joi');

module.exports = {
    loginModel : Joi.object().keys({
        user: Joi.string().alphanum().min(4).max(30).required(),
        password: Joi.string().min(4).max(50).required()
    }).with('user','password')
}