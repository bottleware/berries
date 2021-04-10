module.exports = {
  purge: [
    '../lib/berries_web/templates/**/*.eex',
    '../lib/berries_web/views/**/*.ex',
    './js/**/*.js'
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      fontFamily: {
        'tego': '"New Tegomin"'
      },
    }
  },
  variants: {
    extend: {
      translate: ['active'],
    }
  },

  plugins: []
}
