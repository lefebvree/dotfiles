module.exports = {
  config: {
    fontSize: 17,
    fontFamily: '"Fira Code", "Operator Mono", monospace',
    cursorShape: 'BLOCK',
    css: '',
    termCSS: `
      x-screen x-row { font-variant-ligatures: contextual; }
    `,
    padding: '0',
    shell: ''
  },

  plugins: [
    'hyperterm-paste',
    'hyperterm-atom-dark',
    'hyper-tab-icons',
    'hypercwd',
    'hyperlinks',
    'hyper-statusline'
  ]
}
