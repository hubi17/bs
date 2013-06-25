// Common JavaScript functions used for my website.
// (C) 2003-2005 by Wayne Pollock, Tampa Florida USA.
// All Rights Reserved.

/* This function is invoked by "buttons" (CSS .btn")
 * to show/hide a <div> with id="item":
 */

function toggleVis ( item )
{
   if ( ! document.getElementById )
      return true;
   var itemStyle = document.getElementById( item ).style;
   if ( itemStyle.display == "block" )
      itemStyle.display = "none";
   else
      itemStyle.display = "block";
   return false;
}

/* This can be used to open a source code window via a link:
 *   <a href="javascript:viewthesource()">View source</a>
 *
 * You can do the same with a button:
 *    <form action="">
 *      <input type="button" value="View Source"
 *        onClick="window.open('view-source:' + window.location,
 *        window.location + ' (source)')">
 *    </form>
 */

function viewSource ()
{
   window.open( "view-source:"+window.location, window.location + " (source)" );
}

/* These two function generates a mailto link to me.  By
 * not having my actual email address in the HTML files
 * (nor here in any obvious way) spammers using simple
 * email address harvesters will fail!  (The best approach
 * would be to generate an image, say using SVG, that has
 * an internal click handler.  But not enough browsers
 * support SVG yet.)  Note the subject gets URLEncoded.
 */

function genEmailLink ( subject )
{
    document.write( '<a href="mai'
    + 'lto:' );
    genEmailAddr();
    if ( subject )
     document.write( "?subject=" + escape(subject) );
    document.write( '">' );
    genEmailAddr();
    document.write( '<\/a>' );
}

function genEmailAddr ( )
{
    var words = new Array (
	       "pollock",
	       "@",
	       "acm",
	       ".org"
    );
    for (var i=0; i < words.length; ++i)
     document.write( words[i] );
}

/* findImage assumes we tried "images/name" and got here because that
 * didn't work.  so now try "../images/name" instead, up to the top.
 */
var imgLevels = 0; // Used to prevent infinite recursion
function findImage( theImage )
{
   // Split the URL into two parts:
   var part = theImage.src.split( "images/" );

   // Count the number of ".." levels we've tried already:
   ++imgLevels;

   if (part.length != 2 || imgLevels > 8 )
   {  //theImage.onError = null;  // If nothing works stop the recursion!
      imgLevels = 0;  // reset for next image
      return false;
   }

   try {
      // Using ".." is legal but it might be better to use parseUri
      // to grab the path, split that on "images/", and if part[0]
      // isn't empty then lop off last dir and concatenate.  If
      // part[0] is empty then give up.  ("imgLevels" not needed then.)
      theImage.src =  part[0] + "../images/" + part[1];
      imgLevels = 0;
      return true;  // the image was found.
   } catch (ex) {  return findImage( theImage );  // recurse
   }
}

/* addFooter adds a standard footer to every page.  The arguments
 * passed in are the subject for the mailto link, and a boolean of
 * whether or not to display the P3P privacy policy link.
 *
 * The "accessKey" value shown needs to be pressed with one or more
 * modifier keys, which vary between systems, browsers, and even
 * browser versions.  To show the correct value on a tool-tip is
 * a to-do item; for now just the access key itself (no modifiers)
 * is shown.
 *
 * See <http://en.wikipedia.org/wiki/Access_key#Access_in_different_Browsers>
 * for a chart of modifiers.
 */

function addFooter ( subject, showPolicy )
{
    document.writeln( '<p>&nbsp;<\/p> <hr> ');

    document.writeln( '<table width="100%" border="0" cellspacing="0" cellpadding="0" '
        + 'summary="Page Footer with contact info '
        + 'and approval icons">' );

    document.writeln( '<caption><\/caption>' );

    document.writeln( '<tbody>' );
    document.writeln( '<tr class="top"><td>' );
    document.writeln( 'Send comments and questions to' );
    genEmailLink( subject );
    document.writeln( '<br />' );

    document.writeln( '<em> Last updated by Wayne Pollock on '
	+ document.lastModified + '.<\/em>' );

    document.writeln( '<\/td>' );
    if ( showPolicy )
    {
        document.writeln( '<td valign="middle"><a href="privacy\/" '
           + 'accesskey="p" '
           + 'title="view this site&#039;s P3P PRIVACY POLICY '
           + '(AccessKey: P)"><strong>P3P PRIVACY<br />POLICY</strong></a> '
           + '&nbsp; &nbsp; <\/td>' );
    }
    document.writeln( '<td align="right">' );

    document.writeln( '<a href="http://validator.w3.org/check/referer?verbose=1" '
	+ 'accesskey="h" '
	+ 'title="Check the validity of this site&#8217;s HTML '
	+ '(AccessKey: H)">' );
    document.writeln( '<img src="images/valid-html401.gif" id="htmlLogo" '
        + 'name="htmlLogo" alt="Valid HTML 4.01!" onError="findImage(this)" '
        + '/><\/a> &nbsp;' );

    document.writeln( '<a href="http://jigsaw.w3.org/'
        + 'css-validator/check/referer?profile=css3&amp;usermedium=all&amp;warning=1&amp;lang=en" '
	+ 'accesskey="c" '
	+ 'title="Check the validity of this site&#8217;s CSS '
	+ '(AccessKey: C)">' );
    document.writeln( '<img src="images/vcss.gif" id="cssLogo" name="cssLogo" '
        + 'alt="Valid CSS!" onError="findImage(this)" /><\/a> &nbsp;' );

    document.writeln( '<a href="http://www.CynthiaSays.com/mynewtester/cynthia.exe'
	+ '?Url1='
	+ location.href
	+ '&amp;rptmode=2" '
	+ 'accesskey="a" tabindex="0" '
	+ 'title="WAI Content Accessibility Guidelines 1 '
	+ 'tested with CynthiaSays.com (AccessKey: A)">' );
    document.writeln( '<img src="images/wcag1AAA.gif" id="aaaLogo" '
        + 'alt="Website accessibility rating WCAG 1.0 AAA Approved by Cynthia Says" '
        + 'onError="findImage(this)"  /><\/a> &nbsp;' );

    document.writeln( '<a href="http://www.CynthiaSays.com/mynewtester/cynthia.exe'
	+ '?Url1='
	+ location.href
	+ '&amp;rptmode=-1" '
	+ 'accesskey="5" tabindex="0" '
	+ 'title="U.S. Section 508 accessibility Guidelines '
	+ 'tested with CynthiaSays.com (AccessKey: 5)">' );
    document.writeln( '<img src="images/508-button.jpg" id="sec508Logo" '
        + 'alt="Website accessibility rating Section 508 approved by Cynthia Says" '
        + 'onError="findImage(this)" /><\/a> &nbsp;' );

/*
    document.writeln( '<a href="http://www.section508.info/check_this.cfm'
	+ '?URLtest='
	+ location.href
	+ '&amp;s508=1&amp;CheckURL=0" '
	+ 'accesskey="5" tabindex="0"'
	+ 'title="Check site accessibility against to U.S. Section 508 '
	+ '(AccessKey: 5)">' );
    document.writeln( '<img src="images/508-button.jpg" id="sec508Logo" '
        + 'title="Section 508 tested with section508.info"'
        + 'alt="Website accessibility rating Section 508 approved by section508.info" '
        + 'onError="findImage(this)" /><\/a> &nbsp;' );
*/

    document.writeln( '<\/td><\/tr><\/tbody><\/table>' );
}

/*******************************************************************/

// numberLines.js version 1.0
// Written 1/4/2008 by Wayne Pollock, Tampa Florida USA
//
// Number the lines of PRE elements with the CSS class "numbered".
// This only makes sense for PRE or other elements where white
// space is preserved.  (CSS3 "content" module draft has
// ::line-marker for this, but that's not available yet.)
//
// To use just add this to the body tag: onload="numberLines();"
// and add: class="numbered" attribute to the desired PRE elements.

function numberLines () {
   // Traverse document, building an array of "numbered" PRE elements:
   var numberedPreNodes = [];
   var preNodeList = document.getElementsByTagName( "pre" );
   var isNumberedRE = new RegExp('(^|\\s)numbered(\\s|$)');

   for ( var i = 0, len = preNodeList.length; i < len; ++i ) {  
      var node = preNodeList[i];
      var classes = node.className;
      if ( classes == null )  classes = "";  // for portability
      if ( isNumberedRE.test( classes ) )  numberedPreNodes.push( node );
   }

   for ( var i = 0, len = numberedPreNodes.length; i < len; ++i ) {
      var textNodes = [];
      findTextNodes( numberedPreNodes[i], textNodes );
      var width = String( countLines(textNodes) ).length;
      var lineNum = 1;  // Reset the line num for each PRE element
      for ( var j = 0; j < textNodes.length; ++j )
         lineNum = addLineNumbers( textNodes[j], lineNum, width );
   }
   return true;  // successfully numbered text lines in PREs
}

// Recursively find all TEXT nodes below a (PRE) node):
function findTextNodes ( node, textNodes ) {
   if ( node.nodeType == 3 /* Node.TEXT_NODE */ )
      textNodes.push( node );
   else if ( node.nodeType == 1 /*Node.ELEMENT_NODE */ )
      for ( var n = node.firstChild; n != null; n = n.nextSibling )
         findTextNodes( n, textNodes );
}

function countLines ( textNodes ) {
   var numLines = 0;
   for ( var i = 0; i < textNodes.length; ++i ) {
      var text = textNodes[i].data;
      // This replace is only run for the side-effect:
      text.replace( /\r\n?|\n/g, function (nl){ return ++numLines; });
   }
   return numLines;
}

function addLineNumbers ( textNode, lineNum, width ) {
   var text = textNode.data;
   if ( text == null || text.length == 0 )
      return lineNum;

   var result = "";

   // Add numbers after each newline; but need to number the first
   // line too, so check for that:
   if ( lineNum == 1 ) {
      result = padLineNumber( lineNum, width );
      ++lineNum;
   }

   result = result + text.replace( /\r\n?|\n/g, function ( matchedText ) {
      return matchedText + padLineNumber(lineNum++, width);
   } );

   textNode.data = result;
   return lineNum;
}

// Pad number with spaces on the left:
function padLineNumber ( num, width ) {
   var prefix = String("          " + num).slice( -width );
   return prefix + ": ";
}

/****************************************************************************
	parseUri 1.2.1
	(c) 2007 Steven Levithan <stevenlevithan.com>
	MIT License
 [ Downloaded from http://blog.stevenlevithan.com/archives/parseuri ]
*/

function parseUri (str) {
	var	o   = parseUri.options,
		m   = o.parser[o.strictMode ? "strict" : "loose"].exec(str),
		uri = {},
		i   = 14;

	while (i--) uri[o.key[i]] = m[i] || "";

	uri[o.q.name] = {};
	uri[o.key[12]].replace(o.q.parser, function ($0, $1, $2) {
		if ($1) uri[o.q.name][$1] = $2;
	});

	return uri;
};

parseUri.options = {
//	strictMode: false,
	strictMode: true,
	key: ["source","protocol","authority","userInfo","user","password","host","port","relative","path","directory","file","query","anchor"],
	q:   {
		name:   "queryKey",
		parser: /(?:^|&)([^&=]*)=?([^&]*)/g
	},
	parser: {
		strict: /^(?:([^:\/?#]+):)?(?:\/\/((?:(([^:@]*):?([^:@]*))?@)?([^:\/?#]*)(?::(\d*))?))?((((?:[^?#\/]*\/)*)([^?#]*))(?:\?([^#]*))?(?:#(.*))?)/,
		loose:  /^(?:(?![^:@]+:[^:@\/]*@)([^:\/?#.]+):)?(?:\/\/)?((?:(([^:@]*):?([^:@]*))?@)?([^:\/?#]*)(?::(\d*))?)(((\/(?:[^?#](?![^?#\/]*\.[^?#\/.]+(?:[?#]|$)))*\/?)?([^?#\/]*))(?:\?([^#]*))?(?:#(.*))?)/
	}
};
