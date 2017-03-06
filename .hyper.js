module.exports = {
  config: {
    fontSize: 14,
    fontFamily: '"Fira Code", "Operator Mono", monospace',
    cursorShape: 'BEAM',
    css: '',
    termCSS: `
    x-screen x-row { font-variant-ligatures: contextual; }
    `,
    padding: '10',
    shell: ''
  },

  plugins: [
    'hyperterm-paste',
    'hyperterm-atom-dark',
    'hyper-tab-icons'
  ]
}
