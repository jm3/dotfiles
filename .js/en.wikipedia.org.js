// by: [jm3](http://jm3.github.io) ([@jm3](http://twitter.com/jm3) on Twitter)

// [View a screenshot](http://git.io/mj8ZIg) to see what this code does.

// [Fork the code](https://github.com/jm3/dotfiles/blob/master/.js/en.wikipedia.org.js)

// [View the docs](http://jm3.github.io/wikipedia-watchlist/)

// # Setup

// Let's apply these customizations only to the Watchlist page.
if( location.href.indexOf( "Special:Watchlist" ) < 0 )
  return;

// # Refine Global Navigation

// First we reclaim some top nav space, in order to make more room for
// the content, by hiding irrelevant stuff.
$("#left-navigation, #mw-head-base, #mw-page-base, geonotice, #pt-mycontris").hide();

// Now let's make the page header less jarring,
$("h1#firstHeading").css({
  "border-bottom": 0,
  "font-size": "1.2em"
  // …and replace the content-free title ("watchlist") with
  // a more informative one ("You are watching NN pages.")
}).text(
  $("ul#watchlist-message").next().text()
  .replace( /You have/, "You are watching" )
  .replace( / on your watch.*\./, "." )
);

// We'll de-emphasize the top "personal" nav links that Wikipedians
// advanced enough to use the watchlist probably don't really need.
$("#contentSub, #contentSub *, #p-personal a").css({
  "color"          : "gray",
  "font-size"      : "11px",
  "text-transform" : "lowercase"
});
$("li#pt-userpage").css( "background", "transparent");

// Let's align nav and search box along the grid, for OCD sake.
$("#searchform").css( "margin-right", "1.4em" );
$("#contentSub").css( "margin", 0 );

// The settings form atop the page gets in the way and distracts
// from the content of the page. We'll de-emphasize it by first removing
// the extra chart-junk that provides no information.
$("div#content").css( "line-height", "0" );
$("#mw-watchlist-options legend, #mw-watchlist-options hr,"
+ "#mw-watchlist-form-namespaceselector").hide();
$("#mw-watchlist-options").css({
  "border"  : "0",
  "padding" : "0",
  "margin"  : "2.0em 0 0 2.0em",
  "color"   : "gray"
}).children().css({
  "color"   : "gray"
});

// Then we'll move the whole form below the content, to the bottom of the page
$("#mw-watchlist-options").detach().appendTo( "#bodyContent" );

// Having now cleaned up the top nav, this remaining div clobbers
// the top nav after we cleaned it up, so we shorten it.
$("#mw-head").css( "width", "440px" );

// # Remove chart-junk from content

// First we need to reach DEEP up into the DOM to kill all the (annoyingly
// un-classed and therefore un-style-able) text nodes in the
// main changelog content block. Grab your ankles!
var removed = 0;
$( "a:contains('hist')" )
.parent().parent().find('*')
.contents().filter(
  // Once we arrive here, we've skipped all normally traverseable
  // DOM nodes, and are only working with pure text nodes - things
  // with NO classes or IDs. Here there be dragons :(
  function () { return this.nodeType == 3; }
).each( function() {

  var t = $(this).text();

  // Don't obscure my watchlist information with the IP addresses
  // of anonymous posters. Also, remove horrible-looking fake
  // &amp;hellip; nodes " .  .  . " (dot space dot space what-the-fuck-guys?).
  if( t.match( /^([;: \.\(\)]|[0-9])+$/ )) {
    $(this).remove();
    ++ removed;

  // Timestamps everywhere obscure the changes to the pages I'm trying to watch; remove them.
  } else if( t.match( /[0-9]:[0-9]/ )) {
    $(this).remove();
    ++ removed;

  // Remove chartjunk that makes the lines harder to read…
  } else if( t.match( /\s\|\s/ )) {
    $(this).remove();
    ++ removed;

  // …including weird trailing colons in Section links.
  } else if( t.match( /: $/ )) {
    $(this).replaceWith( t.replace( /: $/, "" ));
  } 

});

// When debugging the above positional node code,
// it can be helpful to trace how many nodes we've scrubbed.
/* console.log( "removed " + removed + " extraneous whitespace nodes" ); */

// # Restyle Metadata

// Now onto the fun stuff! After removing extraneous whitespace,
// pad out the watchlist to give the text room to breathe.
$("ul.special a").css( "padding", "0 0.2em" );

// Prettify the notations about number of lines added/deleted in each change.
$(".mw-plusminus-pos,.mw-plusminus-neg").css( {
  "padding"               : "0.2em 0.5em",
  "font-weight"           : "bold",
  "font-size"             : "90%",
  "-webkit-border-radius" : "0.3em",
  "-moz-border-radius"    : "0.3em",
  "-border-radius"        : "0.3em"
});
$(".mw-plusminus-pos").css( "background-color", "#ddffdd" );
$(".mw-plusminus-neg").css( "background-color", "#ffdddd" );

// Wikipedia prefers to give EVERY POSSIBLE OPTION at every turn.
// Instead, we'll streamline things to allow faster and more accurage
// scanning of the page. Hide auto-edits from bots, page history links,
// and links to talk pages.
$("abbr.botedit, a:contains('hist')").hide();
$("abbr.botedit").parent().hide();
$("a:contains('talk')").parent().hide();

// Hiding minor edits not only cuts down the noise, but it also
// makes the number of text node "columns" more consistent more
// consistent across watchlist rows, so that we can programmatically
// select article names to style them, without caring whether it's a
// minor edit or a bot edit.
$("abbr.minoredit").hide();

// Replace chart-junk with a clean "delta" icon — i don't need to
// see the word "diff" 80 times in a row.
$("a:contains('diff')").text( "Δ" );

// De-emphasize WHO made the change in favor of what they changed.
$(".mw-userlink").css("color", "gray")

// Category links add little value, so don't let them crowd things out.
$("a:contains('Category:')").css({
  "color"         : "black",
  "padding"       : "0",
  "border-bottom" : "1px dotted gray"
});
$(".mw-redirect").css({
  "color"         : "black",
  "padding"       : "0",
  "border-bottom" : "1px dotted gray"
});

// De-emphasize discussion ABOUT articles (and minor edits) in favor
// of the articles themselves.
$("a:contains('Talk:')").parent().children().css( "color", "gray" );
$("abbr.minoredit").parent().children().css( "color", "gray" );

// # Improve section headers

// Convert absolute dates in euro format to more readable relative dates ("2 days ago").
$("h4").each( function() {
  var d = Date.parse( $(this).text() );
  var day_in_ms = 1000 * 60 * 60 * 24;
  d = "Changes made to watched Wikipedia pages "
      + Math.abs( Math.ceil((d - Date.now())/(day_in_ms)))
      + " days ago:";

  // Inflect new semantic headers for proper agreement. I hate reading things like "1 days ago".
  d = d.replace( /0 days ago/, "today" )
       .replace( /1 days ago/, "yesterday" );
  $(this).text( d );

  // Style the new relative date headers to be clear but not strident.
  $(this).css({
    "width"                 : "746px",
    "font-weight"           : "normal",
    "font-size"             : "1.0em",
    "padding"               : "0",
    "margin"                : "1.5em 0 0.8em 0.0em",
    "-webkit-border-radius" : "0.3em",
    "-moz-border-radius"    : "0.3em",
    "-border-radius"        : "0.3em"
  });
});
$("h4:first").css({
  "margin-top": "1.0em"
});

// # Style content rows

// Cache a handle to these nodes cause we'll need them again (h/t @[Shahor](https://twitter.com/#!/Shahor/status/156617950395236352)!)
var li = $("ul.special li");

// Let's give some additional weight to the article names, the most
// important piece of information in the watchlist.
li.each( function() {
  var links = $(this).children();
  $(links[2]).css({
    "font-weight" : "bold",
    "font-size"   : "1.1em"
  });
});

// Finally, we style the major watchlist blocks, which are LI
// elements. Apply a super-subtle gradient to distinguish them without
// being overly busy.
li.css({
  "list-style"            : "none",
  "line-height"           : "1.7em",
  "width"                 : "760px",
  "padding"               : "0.4em",
  "font-size"             : "0.9em",
  "border"                : "1px solid #d3d3d3",
  "margin-bottom"         : "0.6em",
  "-webkit-border-radius" : "0.3em",
  "-moz-border-radius"    : "0.3em",
  "-border-radius"        : "0.3em",
  "-webkit-box-shadow"    : "1px 1px 1px 0px #ddd",
  "-moz-box-shadow"       : "1px 1px 1px 0px #ddd",
  "box-shadow"            : "1px 1px 1px 0px #ddd",
  "background"            : "#fbfbfb",                                            /* Old browsers */
  "background"            : "-moz-linear-gradient(top, #ffffff 0%, #f3f3f3 99%)", /* FF3.6+       */
  "background"            : "-o-linear-gradient(  top, #ffffff 0%, #f3f3f3 99%)", /* Opera 11.10+ */
  "background"            : "-ms-linear-gradient( top, #ffffff 0%, #f3f3f3 99%)", /* IE10+        */
  "background"            : "linear-gradient(     top, #ffffff 0%, #f3f3f3 99%)", /* W3C          */

  /* N.b. the two webkit gradient properties must come after the other browsers' for Chrome to display the gradient #wtfchrome */
  "background"            : "-webkit-linear-gradient(top, #ffffff 0%,#f3f3f3 99%)", /* Chrome10+,Safari5.1+ */
  "background"            : "-webkit-gradient(linear, left top, left bottom, color-stop(0%,#ffffff), color-stop(99%,#f3f3f3))" /* Chrome,Safari4+ */
});

// Chrome users get sexy subtle gradient hovers. Fuck other browsers.
li.hover(
  /* hover ON */
  function() { $(this).css( "background", 
    "-webkit-gradient(linear, left top, left bottom, color-stop(0%,#ffffff), color-stop(99%,#e3e7e8))"); },
  /* hover OFF */
  function() { $(this).css( "background", 
    "-webkit-gradient(linear, left top, left bottom, color-stop(0%,#ffffff), color-stop(99%,#f3f3f3))"); }
);

