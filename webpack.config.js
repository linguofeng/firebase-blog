const path = require('path');

module.exports = {
  entry: './src/index.js',
  output: {
    path: path.join(__dirname, 'docs', 'dist'),
    filename: 'bundle.js',
  },
  resolve: {
    extensions: ['.js', '.elm']
  },
  module: {
    rules: [{
      test: /\.elm$/,
      exclude: [/elm-stuff/, /node_modules/],
      use: [
        'elm-hot-loader',
        'elm-webpack-loader',
      ],
    }],
  },
  devServer: {
    historyApiFallback: true,
    contentBase: path.join(__dirname, 'docs'),
    publicPath: '/dist/'
  },
};
