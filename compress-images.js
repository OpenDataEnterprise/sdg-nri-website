const compress_images = require('compress-images');

const input_path = '_images/**/*.{jpg,JPG,jpeg,JPEG,png,svg,gif}';
const output_path = 'assets/img/';

compress_images(input_path, output_path, {compress_force: true, statistic: true, autoupdate: true}, false,
  {jpg: {engine: 'mozjpeg', command: ['-quality', '90']}},
  {png: {engine: 'pngquant', command: ['--quality=20-50']}},
  {svg: {engine: 'svgo', command: '--multipass'}},
  {gif: {engine: 'gifsicle', command: ['--colors', '64', '--use-col=web']}}, function(){
});
