/**
* Responsive
* 
* author: Thilo Ilg
* version: 1.1.5
* 
**/

/** 
* --- jAlbumGlobals ---
* jAlbumGlobals is responsible for constant parameter of the skin.
* In the process of creating an album the jAlbum parser will overwrite 
* the variables according to the skin with the selected ones in the
* program. jAlbumGlobals also includes global variables which describe
* the state of the skin like if it is embedded, viewed on a mobile device,
* online or in filesystem etc.
*/
var jAlbumGlobals = (function () {

	var styles = ["dark.css", "light.css", "transparent.css"]; // styles

	var mobile = isMobile(); // is the skin viewed on a mobile device
	var online = isOnline(); // is the skin viewed online or in the filesystem
	var jAlbumURL = getURL(); // what's the current url?

	var stylePath = ""; //path points to the styles folder
	var resPath = ""; // path points to the res folder

	var credits = ""; // should skin show credits in footer
	var albumTitle = "Fotos Etapa 1"; // what's the album title?
	var contentPath = ""; // path points to the skin folder
	var imgHoverScaleFactor = "scale(1.1)"; // scale factor of hovering an element

	var folderTitleUp = true; // positioning of folder title, under or above folder
	var folderImgCount = false; // says if folder deep count should be shown
	var maxImgInRow = 15; // restricts the number of elements in a row
	var imgBorderSize = 1; // define border size of element
	var imgBoxSize = 175; // defines size of container of element
	var showFolderName = false; // says if folder name should be displayed
	var textSize = 11; // defines text size of whole page
	var showComments = true; // defines if comments should be shown in slideshow
	var slideBorderSize = 0;
	var slideBorderColor = "#ff000000";
	var style = "light.css";

	var dataTree = {"path":"Fotos%20Etapa%201","counters":{"total":28,"images":28,"files":28},"thumb":{"path":"thumbs\/IMG-20180204-WA0031.jpg","width":192,"height":256},"objects":[{"path":"IMG-20180204-WA0031.jpg","image":{"path":"slides\/IMG-20180204-WA0031.jpg","width":1152,"height":1536},"thumb":{"path":"thumbs\/IMG-20180204-WA0031.jpg","width":192,"height":256},"fileSize":222013,"name":"IMG-20180204-WA0031.jpg","fileDate":"2018-02-04T11:02:44.0Z","category":"image"},{"path":"IMG-20180204-WA0032.jpg","image":{"path":"slides\/IMG-20180204-WA0032.jpg","width":1536,"height":1152},"thumb":{"path":"thumbs\/IMG-20180204-WA0032.jpg","width":256,"height":192},"fileSize":237395,"name":"IMG-20180204-WA0032.jpg","fileDate":"2018-02-04T11:02:46.0Z","category":"image"},{"path":"IMG-20180204-WA0033.jpg","image":{"path":"slides\/IMG-20180204-WA0033.jpg","width":1536,"height":1152},"thumb":{"path":"thumbs\/IMG-20180204-WA0033.jpg","width":256,"height":192},"fileSize":217739,"name":"IMG-20180204-WA0033.jpg","fileDate":"2018-02-04T11:03:00.0Z","category":"image"},{"path":"IMG-20180204-WA0034.jpg","image":{"path":"slides\/IMG-20180204-WA0034.jpg","width":1152,"height":1536},"thumb":{"path":"thumbs\/IMG-20180204-WA0034.jpg","width":192,"height":256},"fileSize":223265,"name":"IMG-20180204-WA0034.jpg","fileDate":"2018-02-04T11:03:02.0Z","category":"image"},{"path":"IMG-20180204-WA0035.jpg","image":{"path":"slides\/IMG-20180204-WA0035.jpg","width":1536,"height":1152},"thumb":{"path":"thumbs\/IMG-20180204-WA0035.jpg","width":256,"height":192},"fileSize":218608,"name":"IMG-20180204-WA0035.jpg","fileDate":"2018-02-04T11:03:10.0Z","category":"image"},{"path":"IMG-20180204-WA0036.jpg","image":{"path":"slides\/IMG-20180204-WA0036.jpg","width":1152,"height":1536},"thumb":{"path":"thumbs\/IMG-20180204-WA0036.jpg","width":192,"height":256},"fileSize":197380,"name":"IMG-20180204-WA0036.jpg","fileDate":"2018-02-04T11:03:14.0Z","category":"image"},{"path":"IMG-20180204-WA0037.jpg","image":{"path":"slides\/IMG-20180204-WA0037.jpg","width":1152,"height":1536},"thumb":{"path":"thumbs\/IMG-20180204-WA0037.jpg","width":192,"height":256},"fileSize":185305,"name":"IMG-20180204-WA0037.jpg","fileDate":"2018-02-04T11:03:18.0Z","category":"image"},{"path":"IMG-20180204-WA0038.jpg","image":{"path":"slides\/IMG-20180204-WA0038.jpg","width":1152,"height":1536},"thumb":{"path":"thumbs\/IMG-20180204-WA0038.jpg","width":192,"height":256},"fileSize":201952,"name":"IMG-20180204-WA0038.jpg","fileDate":"2018-02-04T11:03:22.0Z","category":"image"},{"path":"IMG-20180204-WA0039.jpg","image":{"path":"slides\/IMG-20180204-WA0039.jpg","width":1152,"height":1536},"thumb":{"path":"thumbs\/IMG-20180204-WA0039.jpg","width":192,"height":256},"fileSize":226076,"name":"IMG-20180204-WA0039.jpg","fileDate":"2018-02-04T11:03:26.0Z","category":"image"},{"path":"IMG-20180204-WA0040.jpg","image":{"path":"slides\/IMG-20180204-WA0040.jpg","width":1536,"height":1152},"thumb":{"path":"thumbs\/IMG-20180204-WA0040.jpg","width":256,"height":192},"fileSize":218273,"name":"IMG-20180204-WA0040.jpg","fileDate":"2018-02-04T11:03:26.0Z","category":"image"},{"path":"IMG-20180204-WA0041.jpg","image":{"path":"slides\/IMG-20180204-WA0041.jpg","width":1536,"height":1152},"thumb":{"path":"thumbs\/IMG-20180204-WA0041.jpg","width":256,"height":192},"fileSize":362519,"name":"IMG-20180204-WA0041.jpg","fileDate":"2018-02-04T11:15:52.0Z","category":"image"},{"path":"IMG-20180204-WA0042.jpg","image":{"path":"slides\/IMG-20180204-WA0042.jpg","width":1152,"height":1536},"thumb":{"path":"thumbs\/IMG-20180204-WA0042.jpg","width":192,"height":256},"fileSize":385484,"name":"IMG-20180204-WA0042.jpg","fileDate":"2018-02-04T11:15:52.0Z","category":"image"},{"path":"IMG-20180204-WA0043.jpg","image":{"path":"slides\/IMG-20180204-WA0043.jpg","width":1536,"height":1152},"thumb":{"path":"thumbs\/IMG-20180204-WA0043.jpg","width":256,"height":192},"fileSize":323319,"name":"IMG-20180204-WA0043.jpg","fileDate":"2018-02-04T11:16:00.0Z","category":"image"},{"path":"IMG-20180204-WA0044.jpg","image":{"path":"slides\/IMG-20180204-WA0044.jpg","width":1536,"height":1152},"thumb":{"path":"thumbs\/IMG-20180204-WA0044.jpg","width":256,"height":192},"fileSize":335362,"name":"IMG-20180204-WA0044.jpg","fileDate":"2018-02-04T11:16:06.0Z","category":"image"},{"path":"IMG-20180204-WA0045.jpg","image":{"path":"slides\/IMG-20180204-WA0045.jpg","width":1536,"height":1152},"thumb":{"path":"thumbs\/IMG-20180204-WA0045.jpg","width":256,"height":192},"fileSize":306527,"name":"IMG-20180204-WA0045.jpg","fileDate":"2018-02-04T11:16:48.0Z","category":"image"},{"path":"IMG-20180204-WA0046.jpg","image":{"path":"slides\/IMG-20180204-WA0046.jpg","width":1536,"height":1153},"thumb":{"path":"thumbs\/IMG-20180204-WA0046.jpg","width":256,"height":192},"fileSize":158953,"name":"IMG-20180204-WA0046.jpg","fileDate":"2018-02-04T11:16:50.0Z","category":"image"},{"path":"IMG-20180204-WA0047.jpg","image":{"path":"slides\/IMG-20180204-WA0047.jpg","width":1536,"height":1152},"thumb":{"path":"thumbs\/IMG-20180204-WA0047.jpg","width":256,"height":192},"fileSize":335127,"name":"IMG-20180204-WA0047.jpg","fileDate":"2018-02-04T11:16:52.0Z","category":"image"},{"path":"IMG-20180204-WA0048.jpg","image":{"path":"slides\/IMG-20180204-WA0048.jpg","width":1536,"height":1152},"thumb":{"path":"thumbs\/IMG-20180204-WA0048.jpg","width":256,"height":192},"fileSize":342044,"name":"IMG-20180204-WA0048.jpg","fileDate":"2018-02-04T11:17:00.0Z","category":"image"},{"path":"IMG-20180204-WA0049.jpg","image":{"path":"slides\/IMG-20180204-WA0049.jpg","width":1536,"height":1153},"thumb":{"path":"thumbs\/IMG-20180204-WA0049.jpg","width":256,"height":192},"fileSize":162243,"name":"IMG-20180204-WA0049.jpg","fileDate":"2018-02-04T11:17:02.0Z","category":"image"},{"path":"IMG-20180204-WA0050.jpg","image":{"path":"slides\/IMG-20180204-WA0050.jpg","width":1536,"height":1152},"thumb":{"path":"thumbs\/IMG-20180204-WA0050.jpg","width":256,"height":192},"fileSize":288972,"name":"IMG-20180204-WA0050.jpg","fileDate":"2018-02-04T11:17:06.0Z","category":"image"},{"path":"IMG-20180204-WA0051.jpg","image":{"path":"slides\/IMG-20180204-WA0051.jpg","width":1152,"height":1536},"thumb":{"path":"thumbs\/IMG-20180204-WA0051.jpg","width":192,"height":256},"fileSize":283195,"name":"IMG-20180204-WA0051.jpg","fileDate":"2018-02-04T11:21:48.0Z","category":"image"},{"path":"IMG-20180204-WA0052.jpg","image":{"path":"slides\/IMG-20180204-WA0052.jpg","width":1152,"height":1536},"thumb":{"path":"thumbs\/IMG-20180204-WA0052.jpg","width":192,"height":256},"fileSize":394458,"name":"IMG-20180204-WA0052.jpg","fileDate":"2018-02-04T11:21:52.0Z","category":"image"},{"path":"IMG-20180204-WA0053.jpg","image":{"path":"slides\/IMG-20180204-WA0053.jpg","width":1536,"height":1152},"thumb":{"path":"thumbs\/IMG-20180204-WA0053.jpg","width":256,"height":192},"fileSize":295396,"name":"IMG-20180204-WA0053.jpg","fileDate":"2018-02-04T11:21:54.0Z","category":"image"},{"path":"IMG-20180204-WA0054.jpg","image":{"path":"slides\/IMG-20180204-WA0054.jpg","width":1536,"height":1152},"thumb":{"path":"thumbs\/IMG-20180204-WA0054.jpg","width":256,"height":192},"fileSize":368651,"name":"IMG-20180204-WA0054.jpg","fileDate":"2018-02-04T11:22:04.0Z","category":"image"},{"path":"IMG-20180204-WA0055.jpg","image":{"path":"slides\/IMG-20180204-WA0055.jpg","width":1536,"height":1153},"thumb":{"path":"thumbs\/IMG-20180204-WA0055.jpg","width":256,"height":192},"fileSize":291644,"name":"IMG-20180204-WA0055.jpg","fileDate":"2018-02-04T11:22:06.0Z","category":"image"},{"path":"IMG-20180204-WA0056.jpg","image":{"path":"slides\/IMG-20180204-WA0056.jpg","width":1536,"height":1152},"thumb":{"path":"thumbs\/IMG-20180204-WA0056.jpg","width":256,"height":192},"fileSize":411125,"name":"IMG-20180204-WA0056.jpg","fileDate":"2018-02-04T11:22:06.0Z","category":"image"},{"path":"IMG-20180204-WA0057.jpg","image":{"path":"slides\/IMG-20180204-WA0057.jpg","width":1536,"height":1152},"thumb":{"path":"thumbs\/IMG-20180204-WA0057.jpg","width":256,"height":192},"fileSize":325813,"name":"IMG-20180204-WA0057.jpg","fileDate":"2018-02-04T11:22:08.0Z","category":"image"},{"path":"IMG-20180204-WA0058.jpg","image":{"path":"slides\/IMG-20180204-WA0058.jpg","width":414,"height":201},"thumb":{"path":"thumbs\/IMG-20180204-WA0058.jpg","width":256,"height":124},"fileSize":41739,"name":"IMG-20180204-WA0058.jpg","fileDate":"2018-02-04T11:23:46.0Z","category":"image"}],"name":"Fotos Etapa 1","fileDate":"2018-02-07T22:50:05.136Z"}; // includes all the album data in a json tree
	var stylePath = ""; 

	var widgetColor = getWidgetColor(); // get suggested color for widget support

	/** check if page viewed on mobile device **/
	function isMobile(){
		return (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|ipad|iris|kindle|Android|Silk|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(navigator.userAgent) 
	    || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(navigator.userAgent.substr(0,4)));
	}

	/** check if page viewed online or from file system **/
	function isOnline(){
		switch(window.location.protocol) {
		   case 'http:':
		   		return true;
		   case 'https:':
		     	return true;
		   case 'file:':
		    	return false;
		}
	}

	/** get current url of page **/
	function getURL(){
		var curr = document.getElementById('jAlbum').src;
		return curr.substring(0, curr.lastIndexOf("/") + 1);
	}

	/** get fidget color according to current style **/
	function getWidgetColor(){
		if(style == styles[0]) return "black";
		else return "white";
	}

	/** returns all the public variables and functions **/
	return {
		mobile: mobile,
		online: online,
		jAlbumURL: jAlbumURL,
		stylePath: stylePath,
		resPath: resPath,
		credits: credits,
		albumTitle: albumTitle,
		contentPath: contentPath,
		imgHoverScaleFactor: imgHoverScaleFactor,
		folderTitleUp: folderTitleUp,
		folderImgCount: folderImgCount,
		maxImgInRow: maxImgInRow,
		imgBorderSize: imgBorderSize,
		imgBoxSize: imgBoxSize,
		showFolderName: showFolderName,
		textSize: textSize,
		showComments: showComments,
		dataTree: dataTree,
		stylePath: stylePath,
		slideBorderSize: slideBorderSize,
		slideBorderColor: slideBorderColor,
		widgetColor: widgetColor
	};

})();

/** --- jAlbumInject ---
* jAlbumInject is responsible for copying html code into
* the website. Stylesheet includes will be printed into
* the header, the body will be printed to the position
* of the embed code.
*/
var jAlbumInject = (function () {

	appendToHead(injLink('res/css/normalize.min.css', 'stylesheet')); // normalizes browser specific stylesheet defaults
	appendToHead(injLink('res/css/custom.min.css', 'stylesheet')); // customized desgin of the skin, will be partly overwritten by style.css
	appendToHead(injLink('res/styles.css', 'stylesheet')); // different styles to the skin which change the appearance

	appendToHead(injMeta("viewport", "width=device-width, initial-scale=1.0, maximum-scale=1.0")); // viewport handles mobile scaling size

	inj('<div id="Responsive" class="jAlbum">'); // Responsive id surrounds all code of the body of the skin
	inj('<div id="fullscreen"></div>'); // element where to add fullscreen
	inj('<div id="jAlbum-header"></div>'); // header container
	inj('<div id="jAlbum-content"></div>'); // content container
	inj('<div style="clear: both"></div>');

	inj('<div id="jAlbum-footer">'); // footer
	inj('<div class="left leaveFolder">');
	inj('<p><a onclick="jAlbumController.back();"> &#10096;</a></p>'); // go back button in footer
	inj('</div><div class="center"><p><a href="http://jalbum.net/"></a> - '); // credits in footer
	inj('<a href="http://jalbum.net/skins/skin/Responsive">Responsive</a></p>'); // skin advertisement in footer
	inj('</div></div></div>'); // close footer

	inj('<script src="' + jAlbumGlobals.jAlbumURL + 'res/libs/jquery-2.1.4.min.js"></script>'); // embets jQuery library
	inj('<script type="text/javascript">$(document).bind("mobileinit", function(){$.extend($.mobile , {autoInitializePage: false})});</script>'); // deactivates jQuery unnecessary mobile feature
	inj('<script src="' + jAlbumGlobals.jAlbumURL + 'res/libs/jquery.mobile-1.4.5.min.js"></script>'); // includes jQuery Mobile
	inj('<script src="' + jAlbumGlobals.jAlbumURL + 'res/libs/jquery.touchswipe.min.js"></script>'); // jQuery touchswipe plugin
	inj('<script src="' + jAlbumGlobals.jAlbumURL + 'res/js/main.js" type="text/javascript"></script>'); // includes skin controller
	
	/** injects html code at embedded position **/
	function inj(html){
		document.write(html);
	}

	/** injects html code in header **/
	function appendToHead(elem){
		document.getElementsByTagName('head').item(0).appendChild(elem);
	}

	/** injects header of embedded page with stylesheet includes **/
	function injLink(path, rel){
		var elem = document.createElement("link");
		elem.href = jAlbumGlobals.jAlbumURL + path;
		elem.rel = rel;

		return elem;
	}

	function injMeta(name, content){
		var elem = document.createElement("meta");
		elem.name = name;
		elem.content = content;

		return elem;
	}

})();


/** --- Widget Support---
* provides JavaScript code for jAlbum widget support
*/
window._jaWidgetBarColor = jAlbumGlobals.widgetColor;

if(!document.getElementById('non-embedded')){ // check if embedded
	window._jaUrl = jAlbumGlobals.jAlbumURL;
	_jaSkin = "Responsive";
_jaStyle = "light.css";
_jaVersion = "15.1.6";
_jaGeneratorType = "desktop";
_jaLanguage = "es";
_jaPageType = "index";
_jaRootPath = ".";
_jaUserId = "1043642";
var jalbumWidgetContainer = document.createElement('div');
jalbumWidgetContainer.setAttribute('id','jalbumwidgetcontainer');
var jalbumWidgetScript = document.createElement("script");
jalbumWidgetScript.type = "text/javascript";
jalbumWidgetScript.src = "http"+("https:"==document.location.protocol?"s":"")+"://jalbum.net/widgetapi/load.js";
jalbumWidgetScript.async = true;
jalbumWidgetContainer.appendChild(jalbumWidgetScript);
document.body.appendChild(jalbumWidgetContainer);
 // get JavaScript code for widget
}
