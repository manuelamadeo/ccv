/** initialize html document with includes etc. **/

/**
* Get values from jAlbum constants
*/

// jAlbumURL equals current path
var curr = document.getElementById('jAlbum').src;
window.jAlbumURL = curr.substring(0, curr.lastIndexOf("/") + 1);

window.stylePath = '${stylePath}';
window.resPath = '${resPath}';
window.album = ${dataTree};
window.hover = ${showHoverEffect};
window.credits = '${creditText}';
window.albumTitle = '${albumTitle}';
window.mediarssPath = '${mediarssPath}';
window.contentPath = '${contentPath}';
window.indexPage = '${indexPage}';
window.maxImgInRow = ${maxImgInRow};
window.imgBorderSize = ${imgBorderSize};
window.imgBoxSize = ${imgBoxSize};
window.imgHoverScaleFactor = '${imgHoverScaleFactor}';
window.showFolderName = ${showFolderName};
window.textSize = ${textSize};

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
document.write('<div class="left leaveFolder"><p><a href="javascript:void(0);" onclick="back();"> &#10096;</a></p></div><div class="center"><p><a href="http://jalbum.net/">${creditText}</a> - <a href="http://jalbum.net/skins/skin/Responsive">Responsive</a></p></div>');
document.write('</div>');

document.write('</div>');

/** javascript imports **/
document.write('<script src="' + jAlbumURL + 'res/libs/jquery-2.1.4.min.js"></script>');
document.write('<script type="text/javascript">$(document).bind("mobileinit", function(){$.extend(  $.mobile , {autoInitializePage: false})});</script>');
document.write('<script src="' + jAlbumURL + 'res/libs/jquery.mobile-1.4.5.min.js"></script>');
document.write('<script src="' + jAlbumURL + 'res/libs/jquery.touchSwipe.min.js"></script>');
document.write('<script src="' + jAlbumURL + 'res/js/main.min.js" type="text/javascript"></script>');