var path = require('path');

module.exports = (env) => {
  return {
    entry: {
      'resource-list': path.resolve(__dirname, './_app/app.js'),
    },
    output: {
      path: path.resolve(__dirname, './assets/js'),
      filename: '[name].js'
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
      alias: {
        config: path.join(__dirname, '_config', env.NODE_ENV),
        'vue$': 'vue/dist/vue.esm.js'
      }
    },
    watch: true
  }
};
