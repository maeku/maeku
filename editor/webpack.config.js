const path = require('path');
const webpack = require('webpack');

module.exports = {
  entry: './javascript/main.jsx',
  devServer: {
    hotOnly: true,
    port: 3200,
    publicPath: 'http://localhost:3000/editor/',
    writeToDisk: true,
  },
  mode: 'development',
  plugins: [
    new webpack.HotModuleReplacementPlugin(),
  ],
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        options: { presets: ['@babel/env'] }
      },
    ]
  },
  output: {
    path: path.resolve(__dirname, 'vendor/assets/javascripts/maeku/editor/'),
    filename: 'editor.js'
  },
  resolve: { extensions: ['*', '.js', '.jsx'] },
};
