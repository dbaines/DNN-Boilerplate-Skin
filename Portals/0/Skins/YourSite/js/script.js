/* ==================================================================================

	JQUERY SCRIPTS
	CDAA

================================================================================== */

/* jQuery Ready */
$(function() {
	
/* ===============================================================================

	Fixing console.log in IE
	
=============================================================================== */
	
	// usage: log('inside coolFunc', this, arguments);
	// paulirish.com/2009/log-a-lightweight-wrapper-for-consolelog/
	window.log = function f(){ log.history = log.history || []; log.history.push(arguments); if(this.console) { var args = arguments, newarr; try { args.callee = f.caller } catch(e) {}; newarr = [].slice.call(args); if (typeof console.log === 'object') log.apply.call(console.log, console, newarr); else console.log.apply(console, newarr);}};

	// make it safe to use console.log always
	(function(a){function b(){}for(var c="assert,count,debug,dir,dirxml,error,exception,group,groupCollapsed,groupEnd,info,log,markTimeline,profile,profileEnd,time,timeEnd,trace,warn".split(","),d;!!(d=c.pop());){a[d]=a[d]||b;}})
	(function(){try{console.log();return window.console;}catch(a){return (window.console={});}}());

/* ==================================================================================

	MENU DROPDOWN ANIMATION
	On hover, slideToggle to create a slidedown animation
	On hover out, hide the submenu

================================================================================== */

	// Target each top-level list element
	$("#dnn_MENU1 > ul > li").each(function () {
		
		// Hide the menu by default
		$(this).children("ul").hide();
		
		// Hover, animate down
		$(this).hover(function() {
			$(this).children("ul").slideToggle('fast');

		// Hover out, animate up
		}, function() {
			$(this).children("ul").hide();
		});
		
	});

/* ==================================================================================

	COLORBOXING

================================================================================== */
	
	$(".colorbox").colorbox({
		width: "90%",
		height: "85%",
		iframe: true
	});

/* ==================================================================================

	UNIFORMING

================================================================================== */

	$(".cdaaform select, .cdaaform input[type=radio]").uniform();

/* ==================================================================================

	ACCORDION MODULE
	On click, slide down child content
	On click again, slide up child content

================================================================================== */

	// Hide body elements
	$(".accordionBody").hide();

	// Show body elements on click of title
	$(".accordionHead").click(accordion);
	function accordion () {
		$(this).toggleClass("active").parent(".accordionContainer").children(".accordionBody").slideToggle('fast');
	}

/* ==================================================================================

	OLDSCHOOL SEARCH PLACEHOLDER

================================================================================== */

	// Search Placeholder, it's DNN so no html5 placeholder tag
	$("#dnn_dnnSearch_ClassicSearch input.NormalTextBox").attr({ value: 'Search...'}).focus(function(){
		if($(this).val()=="Search..."){
			$(this).val("");
			$(this).css({"color":"#696e6f"});
		}
	}).blur(function(){
		if($(this).val()==""){
			$(this).val("Search...");
			$(this).css({"color":"#818889"});
		}
	});

/* ==================================================================================

	RSS FEED FOR NEWS & STORIES HOMEPAGE MODULE
	http://hovinne.com/articles/jfeed-jquery-rss-atom-feed-parser-plugin

================================================================================== */

	// Set up some variables
	var feed = "/AboutUs/News/tabid/107/rssid/1/Default.aspx";
	var targetDiv = "#dnn_homepageContentMiddle";
	var targetContent = targetDiv + " .moduleContent";
	var maxItems = 5;

	// Check if News Pane is available for insertion, otherwise don't do anything
	if( $(targetDiv).length>0 ) {
		
		// By default there won't be any content and DNN will add the EmptyPane class to it, which will hide the module
		// We want to get rid of that so that the module is displayed
		$(targetDiv).removeClass("DNNEmptyPane");

		// Parse the RSS Feed
		$.getFeed({

			// The feed URL defined earlier
			url: feed,

			// Ok, the feed has been found, what are we doing with it?
			success: function(feed) {

				// Create a UL element to store our feed elements in
				$(targetContent).html("<ul class='arrowList'></ul>")
					
				// Run through each item in the feed
				for(var i = 0; i < feed.items.length && i < maxItems; i++) {

					// Define items
					var item = feed.items[i];

					// Add each feed title and feed link
					$(targetContent).find("ul").prepend("<li><a href='"+item.link+"'>"+item.title+"</a></li>");

				}
			},

			// Something went wrong. Maybe the feed was down for some reason. 
			// We should show a friendly message indicating that there's nothing found
			error: function() {
				$(targetContent).html("Sorry, news is currently unavailable. Please check back later.");
			}
		})

	}

/* ==================================================================================

	GOOGLE MAPS SCRIPT

================================================================================== */

	// Reusuable Function
	function googleMap(myMapDiv, myLat, myLong) {

		// Position and Map Options
	    var myPos = new google.maps.LatLng(myLat, myLong);
	    var myOptions = {
	        zoom: 17,
	        center: myPos,
	        disableDefaultUI: true,
	        mapTypeId: google.maps.MapTypeId.ROADMAP
	    };

	    // Initialise Map
	    var map = new google.maps.Map(
	        document.getElementById(myMapDiv),
	        myOptions
	    );

	    // Map Marker
	    var myMarker = new google.maps.Marker({
	        position: (myPos),
	        map: map
	    });
	  
	}

    // Check for existence of Contact-specific div
    if($(".contactPage").length>0) {

    	// Create some divs for the maps
    	$(".leftColumn").append("<div id='carltonMap' class='gmap'></div>");
    	$(".middleColumn").append("<div id='docklandsMap' class='gmap'></div>");

    	// Call GoogleMap on each of the required places
        googleMap("carltonMap", -37.789933, 144.97414);
        googleMap("docklandsMap", -37.821114, 144.943782);
    }


/* ==================================================================================

	CDAA FIELD LABEL
	Hides labels and inserts the label as a JS placeholder text
	Hides matching placeholder on focus
	If empty, replaces content with placeholder on blur

================================================================================== */

	// Contact form labels	
	function cdaaFieldLabel() {
		
		// Grab the previous label and hide it
		var myLabel = $(this).prev("label").text();
		$(this).prev("label").hide();
		
		// Insert the label in to the field
		$(this).attr("value",myLabel);
		
		// When clicked, hide the content
		$(this).focus(function() {
			if($(this).val()===myLabel) {
				$(this).val("");
			}
		}).blur(function() {
			if($(this).val()==="") {
				$(this).val(myLabel);
			}
		});
	};
	$(".cdaaform input[type=text]").each(cdaaFieldLabel);
	$(".cdaaform textarea").each(cdaaFieldLabel);


/* ==================================================================================

	FIXING DOTNETNUKE MODULE CONTAINERS THAT ARE FLOATING IN ADMINISTRATION MODE

================================================================================== */

	// Fixing module containers
	$("#dnn_ContentPane .module").not(".moduleDownloadsHalfWide").parent().before("<div class='clear'></div>");

	// Floating them properly
	$(".moduleDownloadsHalfWide").each(function() {
		$(this).parent().next(".DnnModule").children(".moduleDownloadsHalfWide").css({
			"float": "right",
			"margin-right": 0
		});
	});

/* End of jQuery ready */
});