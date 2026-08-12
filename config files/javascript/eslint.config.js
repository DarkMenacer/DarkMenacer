const { defineConfig } = require('eslint-define-config');
const typescriptEslintParser = require('@typescript-eslint/parser');
const typescriptEslintPlugin = require('@typescript-eslint/eslint-plugin');
const prettierPlugin = require('eslint-plugin-prettier');
const prettierConfig = require('eslint-config-prettier');
const nodeConfig = require('eslint-plugin-node');
const jsxA11y = require('eslint-plugin-jsx-a11y');
const jsxA11yStrict =
  (jsxA11y.flatConfigs && jsxA11y.flatConfigs.strict) ||
  (jsxA11y.configs && jsxA11y.configs.strict);
const globals = {
  window: 'readonly',
  document: 'readonly',
  localStorage: 'readonly',
  FormData: 'readonly',
  FileReader: 'readonly',
  Blob: 'readonly',
  navigator: 'readonly',
  __dirname: 'readonly',
  __filename: 'readonly',
  process: 'readonly',
  require: 'readonly',
  module: 'readonly',
  exports: 'readonly',
};

const globalIgnores = {
  ignores: [
    'build/**',
    'test/**',
    '**/*.test.*',
    '**/__tests__/**',
    'node_modules/**',
  ],
};

const myOverrides = defineConfig({
  files: ['**/*.ts'],
  languageOptions: {
    parser: typescriptEslintParser,
    parserOptions: {
      project: './tsconfig.json',
      ecmaVersion: 2018,
      sourceType: 'module',
      ecmaFeatures: {
        jsx: true,
        modules: true,
        experimentalObjectRestSpread: true,
      },
    },
    globals,
  },
  plugins: {
    '@typescript-eslint': typescriptEslintPlugin,
    'prettier': prettierPlugin,
    'node': nodeConfig,
  },
  settings: {
    'import/resolver': {
      node: {
        paths: ['src'],
      },
    },
  },
  rules: {
    'no-console': 'error',
    'prettier/prettier': 'off',
    'no-param-reassign': 'error',
    'no-unused-vars': [
      'error',
      { argsIgnorePattern: '^_', varsIgnorePattern: '^_' },
    ],
    'prefer-const': 'error',
    '@typescript-eslint/no-explicit-any': 'error',
    '@typescript-eslint/explicit-module-boundary-types': 'error',
    '@typescript-eslint/prefer-promise-reject-errors': 'error',
    '@typescript-eslint/strict-boolean-expressions': 'error',
    '@typescript-eslint/consistent-type-imports': 'error',
    '@typescript-eslint/await-thenable': 'error',
    'no-implicit-coercion': 'error',
    'node/no-sync': 'error',
    'no-process-exit': 'error',
  },
});

module.exports = [globalIgnores, jsxA11yStrict, prettierConfig, myOverrides];
