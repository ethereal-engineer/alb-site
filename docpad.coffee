# Import
moment = require('moment')

# The DocPad Configuration File
# It is simply a CoffeeScript Object which is parsed by CSON
docpadConfig = {

	watchOptions: preferredMethods: ['watchFile','watch']

	# =================================
	# Template Data
	# These are variables that will be accessible via our templates
	# To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ

	templateData:

		# Specify some site properties
		site:
			# The production url of our website
			url: "http://applifebalance.com"

			# Here are some old site urls that you would like to redirect from
			oldUrls: [
				'www.applifebalance.com'
			]

			# The default title of our website
			title: "App Life Balance"

			# The website description (for SEO)
			description: """
				Personal site of a dedicated iOS professional, meditator, tea enthusiast and PWNc.
				"""

			# The website keywords (for SEO) separated by commas
			keywords: """
				ios, iphone, ipad, apple, narcolepsy, pwn, pwnc, meditation, software, design, engineering, cocoa
				"""

			# The website author's name
			author: "Adam Iredale"

			# The website author's email
			email: "your@email.com"

			# Styles
			styles: [
				"/styles/twitter-bootstrap.css"
				"/styles/style.css"
			]

			# Scripts
			scripts: [
				"//cdnjs.cloudflare.com/ajax/libs/jquery/1.10.2/jquery.min.js"
				"//cdnjs.cloudflare.com/ajax/libs/modernizr/2.6.2/modernizr.min.js"
				"/vendor/twitter-bootstrap/dist/js/bootstrap.min.js"
				"/scripts/script.js"
			]

			# Services
			services:
				twitterFollowButton: 'iosengineer'
				twitterTweetButton: 'iosengineer'
				githubFollowButton: 'ironstorm'
				googleAnalytics: 'UA-43945171-1'
				

		# -----------------------------
		# Helper Functions

		# Get the prepared site/document title
		# Often we would like to specify particular formatting to our page's title
		# we can apply that formatting here
		getPreparedTitle: ->
			# if we have a document title, then we should use that and suffix the site's title onto it
			if @document.title
				"#{@document.title} | #{@site.title}"
			# if our document does not have it's own title, then we should just use the site's title
			else
				@site.title

		# Get the prepared site/document description
		getPreparedDescription: ->
			# if we have a document description, then we should use that, otherwise use the site's description
			@document.description or @site.description

		# Get the prepared site/document keywords
		getPreparedKeywords: ->
			# Merge the document keywords with the site keywords
			@site.keywords.concat(@document.keywords or []).join(', ')

		# Relative time
		relativeTime: (time_value) ->
		  parsed_date = Date.parse(time_value)
		  relative_to = if arguments.length > 1 then arguments[1] else new Date()
		  delta = parseInt((relative_to.getTime() - parsed_date) / 1000)
		  if delta < 60
		    return "less than a minute ago"
		  else if delta < 120
		    return "about a minute ago"
		  else if delta < 2700
		    return (parseInt(delta / 60)).toString() + " minutes ago"
		  else if delta < 5400
		    return "about an hour ago"
		  else if delta < 86400
		    return "about " + (parseInt(delta / 3600)).toString() + " hours ago"
		  else if delta < 172800
		    return "one day ago"
		  else
		    return (parseInt(delta / 86400)).toString() + " days ago"

		# Post meta
		postTimestamp: (date, format="MMMM Do YYYY, h:mm:ss a") -> return moment(date).format(format)
		postDate: (date, format="MMMM DD, YYYY") -> return moment(date).format(format)

	# =================================
	# Collections
	# These are special collections that our website makes available to us

	collections:
		pages: (database) ->
			database.findAllLive({pageOrder: $exists: true}, [pageOrder:1,title:1])

		clientprojects: (database) ->
			database.findAllLive({tags:$has:'clientproject'}, [date:-1])

		posts: (database) ->
			database.findAllLive({tags:$has:'post'}, [date:-1])

		apps: (database) ->
			database.findAllLive({tags:$has:'app'}, [date:-1])
			
		tools: (database) ->
			database.findAllLive({tags:$has:'tool'}, [date:-1])

	# =================================
	# Plugins

	plugins:
		downloader:
			downloads: [
				{
					name: 'Twitter Bootstrap'
					path: 'src/files/vendor/twitter-bootstrap'
					url: 'https://codeload.github.com/twbs/bootstrap/tar.gz/master'
					tarExtractClean: true
				}
			]


	# =================================
	# DocPad Events

	# Here we can define handlers for events that DocPad fires
	# You can find a full listing of events on the DocPad Wiki
	events:

		# Server Extend
		# Used to add our own custom routes to the server before the docpad routes are added
		serverExtend: (opts) ->
			# Extract the server from the options
			{server} = opts
			docpad = @docpad

			# As we are now running in an event,
			# ensure we are using the latest copy of the docpad configuraiton
			# and fetch our urls from it
			latestConfig = docpad.getConfig()
			oldUrls = latestConfig.templateData.site.oldUrls or []
			newUrl = latestConfig.templateData.site.url

			# Redirect any requests accessing one of our sites oldUrls to the new site url
			server.use (req,res,next) ->
				if req.headers.host in oldUrls
					res.redirect(newUrl+req.url, 301)
				else
					next()
					
	# Environment options
	# environments:
#     	development:
#         	templateData:
#             	site:
#                 	services:
#                     	googleAnalytics: false
}


# Export our DocPad Configuration
module.exports = docpadConfig
