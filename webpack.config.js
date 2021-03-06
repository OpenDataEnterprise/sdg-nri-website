const path = require('path');
const ExtractTextPlugin = require('extract-text-webpack-plugin');
const UglifyJsPlugin = require('uglifyjs-webpack-plugin');

module.exports = (env) => {
  return {
    entry: {
      'analytics-only': ['core-js/fn/promise', path.resolve(__dirname, './_app/scripts/analytics-only.js')],
      'resources': ['core-js/fn/promise', path.resolve(__dirname, './_app/scripts/resources.js')],
      'news': ['core-js/fn/promise', path.resolve(__dirname, './_app/scripts/news.js')],
      'topic': ['core-js/fn/promise', path.resolve(__dirname, './_app/scripts/topic.js')],
    },
    output: {
      path: path.resolve(__dirname, './assets/js'),
      filename: '[name].js'
    },
    module: {
      rules: [
        {
          test: /\.(png|woff|woff2|eot|ttf|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
          use: {
            loader: 'url-loader',
          },
        },
        {
          test: /\.js$/,
          use: {
            loader: 'babel-loader',
            query: {
              presets: ['env'],
            },
          },
        },
        {
          test: /\.vue$/,
          use: {
            loader: 'vue-loader',
          },
        },
      ],
    },
    plugins: [
      new UglifyJsPlugin({ test: /\.js$/ }),
    ],
    resolve: {
      modules: [
        path.resolve('./_app'),
        path.resolve('./node_modules')
      ],
      alias: {
        config: path.join(__dirname, '_app/config', env.NODE_ENV),
        'vue$': 'vue/dist/vue.esm.js'
      }
    },
  }
};
