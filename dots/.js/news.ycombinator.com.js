/*
 *
 * // better domain names (thanks @there)
 *var HTTP_SCHEME = /^https?:\/\//;
 *
 *$("span.comhead").each(function() {
 *  var $span = $(this);
 *  var href  = $span.prev().attr("href");
 *
 *  if (href && href.match(HTTP_SCHEME)) {
 *    var h = href.replace(HTTP_SCHEME, "")
 *                .replace(/\/.*/, "")
 *                .replace(/^www\d*\./, "");
 *    $span.html(" (" + h + ")");
 *  }
 *});
 *
 *// single item page
 *if (window.location.pathname === "/item") {
 *  var $wrapper      = $("center table:first");
 *  var $header       = $wrapper.find("tr:eq(0) td");
 *  var $submission   = $wrapper.find("tr:eq(3) table:eq(0)").find("tr:eq(3) td:last");
 *  var $commentTable = $wrapper.find("tr:eq(3) table:eq(1)");
 *  var $comments     = $commentTable.find("> tbody > tr");
 *
 *  // linkify submission text links
 *  $submission.html($submission.html().replace(/(https?:\/\/.*?)[\s|<]/g, function() {
 *    var terminator = arguments[0].charAt(arguments[0].length - 1);
 *    var url        = arguments[1];
 *
 *    // I can't get the regex above to match a "." at the end of a url, but not inside the url
 *    // so here is a cheap hack to work around my incompetency
 *    if (url.match(/\.$/)) {
 *      url        = url.replace(/\.$/, "");
 *      terminator = "." + terminator;
 *    }
 *    return "<a href='" +url + "' target='_blank'>" + url + "</a>" + terminator;
 *  }));
 *
 *  // comment thread folding
 *  $comments.filter(":has(td img[width=0])").addClass("root");
 *  $comments.addClass("comment").each(function() {
 *    $(this).find(".comhead").append(" <a href='javascript:void(0);' class='fold'>[-]</a>");
 *  });
 *
 *  $("a.fold").toggle(function() {
 *    $(this)
 *      .closest("tr.comment")
 *        .nextUntil("tr.root")
 *        .hide()
 *      .end()
 *    .end().html("[+]");
 *  }, function() {
 *    $(this)
 *      .closest("tr.comment")
 *        .nextUntil(".root")
 *        .show()
 *      .end()
 *    .end().html("[-]");
 *  });
 *}
 *
 */

$("body").css("width", "800px");
$("body").css("margin", "0 auto");

$("table").attr("bgcolor", "#ffffff") // srsly?
$("td.default").css("background-color", "#fffffc");
$("td.default").css("padding-bottom", "20px");
$("td.default").css("border", "1px solid #fffffa");

$("span.comment").css("font-family", "Georgia");
$("span.comment").css("font-size", "12px");
$("span.comment font").css("color", "#555"); // rly, fucktard?
$("span.comment").css("line-height", "1.4em");
$("td.default").css("width", "800px");

$(".subtext").css("font-size", "10pt");
$(".subtext").css("color", "silver");
$(".subtext").css("padding-bottom", "10px");

$(".title").css("font-size", "12pt");

