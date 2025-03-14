import js from '@eslint/js'
import pluginVue from 'eslint-plugin-vue'
import eslintConfigPrettier from 'eslint-config-prettier'

export default [
  {
    name: 'app/files-to-lint',
    files: ['**/*.{js,vue}'],
  },

  {
    name: 'app/files-to-ignore',
    ignores: ['**/dist/**', '**/dist-ssr/**', '**/coverage/**'],
  },

  {
    name: 'global/browser-and-node-globals',
    files: ['**/*.{js,vue}'],
    languageOptions: {
      globals: {
        // defining these here means eslint won't report them as undefined
        confirm: 'readonly',
        console: 'readonly',
        document: 'readonly',
        fetch: 'readonly',
        localStorage: 'readonly',
        setTimeout: 'readonly',
        structuredClone: 'readonly',
        window: 'readonly',
        URL: 'readonly',

        // Add other browser globals as needed
      },
    },
  },

  js.configs.recommended,
  ...pluginVue.configs['flat/essential'],
  ...pluginVue.configs['flat/strongly-recommended'],
  ...pluginVue.configs['flat/recommended'],

  eslintConfigPrettier, // Turn off formatting rules handled by Prettier

  {
    rules: {
      'no-debugger': 'warn',
      semi: ['error', 'never'],
      quotes: ['error', 'single'],
    },
  },

  {
    name: 'app/files-to-ignore',
    ignores: ['**/cache/**', '**/stories/examples/**'],
  },
]
