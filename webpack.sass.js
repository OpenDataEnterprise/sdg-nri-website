const path = require('path');
const ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = (env) => {
  return {
    entry: {
      'main': path.resolve(__dirname, './_app/sass/sdg.scss'),
    },
    output: {
      path: path.resolve(__dirname, './assets/css/'),
      filename: '[name].css',
    },
    module: {
      rules: [
        {
          test: /\.(s*)css$/,
          use: ExtractTextPlugin.extract([
            'css-loader',
            'postcss-loader',
            'sass-loader',
          ]),
        },
        {
          test: /\.(png|woff|woff2|eot|ttf|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
          use: {
            loader: 'url-loader',
          },
        }
      ],
    },
    plugins: [
      new ExtractTextPlugin({ filename: '[name].css'}),
    ],
    resolve: {
      modules: [
        path.resolve('./_app'),
      ],
    },
  }
};
