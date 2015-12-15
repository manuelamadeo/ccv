/** initialize html document with includes etc. **/

/**
* Get values from jAlbum constants
*/

// jAlbumURL equals current path
var curr = document.getElementById('jAlbum').src;
window.jAlbumURL = curr.substring(0, curr.lastIndexOf("/") + 1);

window.stylePath = 'res/styles.css';
window.resPath = 'res';
window.album = {"path":"etapa27","counters":{"total":5,"images":5,"files":5},"objects":[{"path":"2015-05-20%2021.20.15.png","image":{"path":"2015-05-20%2021.20.15.png","width":540,"height":960},"thumb":{"path":"thumbs\/2015-05-20%2021.20.15.png","width":144,"height":256},"fileSize":403974,"name":"2015-05-20 21.20.15.png","fileDate":"2015-05-20T21:20:14.0Z","category":"image","camera":{"originalDate":"2015-05-20T21:20:14.0Z"}},{"path":"2015-05-21%2014.22.19.png","image":{"path":"2015-05-21%2014.22.19.png","width":540,"height":960},"thumb":{"path":"thumbs\/2015-05-21%2014.22.19.png","width":144,"height":256},"fileSize":47312,"name":"2015-05-21 14.22.19.png","fileDate":"2015-11-26T21:54:40.516Z","category":"image","camera":{"originalDate":"2015-11-26T21:54:40.516Z"}},{"path":"2015-06-05%2012.36.20.jpg","image":{"path":"2015-06-05%2012.36.20.jpg","width":1280,"height":960},"thumb":{"path":"thumbs\/2015-06-05%2012.36.20.jpg","width":256,"height":192},"fileSize":231007,"name":"2015-06-05 12.36.20.jpg","fileDate":"2015-06-05T10:36:20.0Z","category":"image"},{"path":"etapa.jpg","image":{"path":"etapa.jpg","width":922,"height":799},"thumb":{"path":"thumbs\/etapa.jpg","width":256,"height":222},"fileSize":97534,"name":"etapa.jpg","fileDate":"2015-12-13T19:48:05.827Z","category":"image"},{"path":"tortola.png","image":{"path":"tortola.png","width":700,"height":300},"thumb":{"path":"thumbs\/tortola.png","width":256,"height":110},"fileSize":35626,"name":"tortola.png","fileDate":"2015-12-13T23:11:41.300Z","category":"image","camera":{"originalDate":"2015-12-13T23:11:41.300Z"}}],"name":"etapa27","fileDate":"2015-12-15T20:21:04.686Z"};
window.hover = true;
window.credits = '';
window.albumTitle = 'etapa27';
window.mediarssPath = '';
window.contentPath = '';
window.indexPage = 'index.html';
window.maxImgInRow = 10;
window.imgBorderSize = 3;
window.imgBoxSize = 175;
window.imgHoverScaleFactor = 'scale(1.1)';
window.showFolderName = false;
window.textSize = 11;

/**
* Print header and body into html
*/
var head = document.getElementsByTagName('head').item(0);

/** css **/
head.innerHTML += '<link href="' + jAlbumURL + 'res/css/normalize.min.css" rel="stylesheet">';
head.innerHTML += '<link href="' + jAlbumURL + 'res/css/custom.min.css" rel="stylesheet">';
head.innerHTML += '<link href="' + jAlbumURL + 'res/styles.css" rel="stylesheet">';

/** viewport mobile devices **/
head.innerHTML += '<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">';

/** HTML **/
document.write('<div id="Embeddable" class="jAlbum">');
document.write('<div id="fullscreen"></div>');
document.write('<div id="jAlbum-header"></div>');
document.write('<div id="jAlbum-content"></div>');
document.write('<div style="clear: both"></div>');

document.write('<div id="jAlbum-footer">');
document.write('<div class="left leaveFolder"><p><a href="javascript:void(0);" onclick="back();"> &#10096;</a></p></div><div class="center"><p><a href="http://jalbum.net/"></a> - <a href="http://jalbum.net/skins/skin/Responsive">Responsive</a></p></div>');
document.write('</div>');

document.write('</div>');

/** javascript imports **/
document.write('<script src="' + jAlbumURL + 'res/libs/jquery-2.1.4.min.js"></script>');
document.write('<script type="text/javascript">$(document).bind("mobileinit", function(){$.extend(  $.mobile , {autoInitializePage: false})});</script>');
document.write('<script src="' + jAlbumURL + 'res/libs/jquery.mobile-1.4.5.min.js"></script>');
document.write('<script src="' + jAlbumURL + 'res/libs/jquery.touchSwipe.min.js"></script>');
document.write('<script src="' + jAlbumURL + 'res/js/main.min.js" type="text/javascript"></script>');
