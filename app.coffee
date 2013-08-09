fs = require('fs')
xml2js = require('xml2js')
util = require('util')
child = require('child_process')


program = require('commander');

program
  .version('0.0.1')
  .option('-x, --xml', 'xml path')
  .option('-i, --image', 'image path')
  .option('-p, --path', 'save to ')
  .parse(process.argv);


parser = new xml2js.Parser()
fs.readFile program.xml, (err, data)->
  parser.parseString data, (err, result)->
    for sprite in result.TextureAtlas.sprite
      target = program.path + sprite.$.n
      x = sprite.$.x
      y = sprite.$.y
      w = sprite.$.w
      h = sprite.$.h
      child.exec 'convert ' + program.image +'-crop ' + w + 'x' + h + '+' + x + '+' + y + ' ' + target

