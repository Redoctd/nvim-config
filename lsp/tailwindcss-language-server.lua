return {
  cmd = { 'tailwindcss-language-server', '--stdio' },
  root_markers = {
    'tailwind.config.js',
    'tailwind.config.cjs',
    'tailwind.config.mjs',
    'tailwind.config.ts',
    'postcss.config.js',
    'postcss.config.cjs',
    'postcss.config.mjs',
    'postcss.config.ts'
  },

  filetypes = {
    'aspnetcorerazor',
    'astro',
    'astro-markdown',
    'clojure',
    'gohtml',
    'gohtmltmpl',
    'html',
    'htmlangular',
    'markdown',
    'razor',
    -- css
    'css',
    'less',
    'postcss',
    'sass',
    'scss',
    -- js
    'javascript',
    'javascriptreact',
    'rescript',
    'typescript',
    'typescriptreact',
    -- mixed
    'vue',
    'svelte',
    'templ',
  },
}
