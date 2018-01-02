var path = require('path');

module.exports = {
  entry: path.resolve(__dirname, './_app/app.js'),
  output: {
    path: path.resolve(__dirname, './assets/js'),
    filename: 'resource-list.js'
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        use: {
          loader: 'babel-loader'
        }
      },
      {
        test: /\.vue$/,
        use: {
          loader: 'vue-loader'
        }
      }
    ]
  },
  resolve: {
    modules: [
      path.resolve('./_app'),
      path.resolve('./node_modules')
    ],
    alias: { 'vue$': 'vue/dist/vue.esm.js' }
  }
};
