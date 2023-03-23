const PDFtoText = require('pdf-extraction');
const { toSystemPath } = require('../../../lib/core/path');

exports.getValue = function (options) {
    let path = toSystemPath(this.parseRequired(this.parse(options.path), 'string', 'fs.exists: path is required.'))
    return PDFtoText(path);
};