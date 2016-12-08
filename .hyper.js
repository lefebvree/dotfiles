module.exports = {
  config: {

	fontSize: 15,

    fontFamily: '"Fira Code", "Operator Mono", monospace',

    cursorColor: 'rgba(255,255,255,0.5)',

    cursorShape: 'BEAM',

    css: '',

    termCSS: `
		x-screen x-row { font-variant-ligatures: contextual; }
	`,

    padding: '0',

    shell: '',

  },

  plugins: [
	'hyperlinks',
	'hyperterm-base16-flat'
  ],

  localPlugins: []
};

