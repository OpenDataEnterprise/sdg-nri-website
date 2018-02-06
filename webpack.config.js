var path = require('path');

module.exports = (env) => {
  return {
    entry: {
      'resource-list': path.resolve(__dirname, './_app/app.js'),
      'news-app': path.resolve(__dirname, './_app/news.js'),
      'topic-app': path.resolve(__dirname, './_app/topic.js')
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
        config: path.join(__dirname, '_app/config', env.NODE_ENV),
        'vue$': 'vue/dist/vue.esm.js'
      }
    },
    watch: true
  }
};
