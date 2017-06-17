module.exports = {
  'extends': 'airbnb',
  'plugins': ['react', 'jsx-a11y', 'import'],
  'rules': {
    'comma-dangle': ['error', 'never'],
    'import/no-unresolved': 'off',
    'import/no-extraneous-dependencies': 'off',
    'import/extensions': 'off',
    'semi': ['error', 'never'],
  },
  'env': {
    'browser': true,
    'node': true,
  },
};
