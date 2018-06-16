exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      joinTo: "js/app.js"
    },
    stylesheets: {
      joinTo: "css/app.css",
      order: {
        after: ["web/static/css/app.css"] // concat app.css last
      }
    },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
    assets: /^(web\/static\/assets)/
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: [
      "web/static",
      "test/static"
    ],

    // Where to compile files to
    public: "priv/static"
  },
  
  plugins: {
    babel: {
      ignore: [/web\/static\/vendor/]
    },
    copycat: {
      "fonts": ["node_modules/bootstrap-sass/assets/fonts/bootstrap"] // copy node_modules/bootstrap-sass/assets/fonts/bootstrap/* to priv/static/fonts/
    },
    sass: {
	options: {
	        includePaths: ["node_modules/bootstrap/scss"], // Tell sass-brunch where to look for files to @import
	        precision: 8 // Minimum precision required by bootstrap-sass
	      }
    }
  },
  
  modules: {
    autoRequire: {
      "js/app.js": ["web/static/js/app"]
    }
  },
  
  npm: {
	enabled: true,
	globals: {
	$: 'jquery',
	jQuery: 'jquery',
	Popper: 'popper.js',
	Tether: 'tether',
	bootstrap: 'bootstrap'
}
  }
}
