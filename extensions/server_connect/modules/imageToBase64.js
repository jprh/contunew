// JavaScript Document

const imageToBase64 = require('image-to-base64');
const { toSystemPath } = require('../../../lib/core/path');

exports.getValue = function (options) {
    let path = toSystemPath(this.parseRequired(this.parse(options.path), 'string', 'fs.exists: path is required.'))
    return imageToBase64(path);
};