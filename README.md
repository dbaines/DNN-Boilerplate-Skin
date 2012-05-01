DotNetNuke 6 Boilerplate Skin
=====

Based on HTML5 Boilerplate. Includes:

* Common and generic containers
* Preconfigured RadEditor tools and configs
* script.js file containing common and generic JS snippets, delete any that you don't use
* plugins.js file contianer Colorbox, Uniform and JFeed minified, non-minified sources available in /src/ folder
* Modernizr
* RadEditor.css file for custom "Apply Class" drop-down
* Favicons both in website root and portal skin root (for back-end favicon specifying)
* Global headers and footers using server-side includes
* humans.txt
* uc.hm - a "down for maintenance" page
* ARIA roles in the skin files

Stripped down files to remove font sizings, colours and other obnoxious things:

* /admin/skins/search.aspx (Removed space between input and button)
* /DesktopModules/Blog/module.css
* /DesktopModules/DNNCorp/SearchCrawler/Results/module.css
* /Portals/_default/default.css

## General Notes:

* Modernizr and other things are placed in the skin file rather than Default.aspx to prevent issues upgrading. 
* If you modify Default.aspx be sure to take notes on what you modified so that you are prepared to do it again after upgrades. 

## Notes for new DotNetNuke installs:

* Go in to /Portals/0/Images/ and remove all default DNN images
* Create /Portals/0/Documents/ using File Manager to store documents

## Notes before going live:

* Test uc.htm
* Create a custom login page and style form appropriately
* Go in to site settings and set the Favicon for Internet Explorer, you may need to recursively synchronise files to show the Skins folder
* Test that "manage" buttons aren't being cut off or hidden unless unavoidable
* Create 404 page and link it in web.config
* Check the config files for Image Manager and Document Manager to ensure upload limits are a reasonable size