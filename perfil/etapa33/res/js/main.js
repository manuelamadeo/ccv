/**
* description: main javascript file with is responsible for 
* all the calculations of the whole skin
* autor: Thilo Ilg
*/

// check if mobile device, turns hover off according to this etc
window.mobile = isMobile();

// temporary variable for an image path
var currentPath = "";

// prevent conflicts in case of embedding
var $jAlbum = jQuery.noConflict(true);

// padding of image boxes according to device
var currentImgBoxPadding = window.mobile ? 15 : 25;
var currentContentPadding = window.mobile ? 15 : 35;
var currentBoxSize = window.mobile ? window.imgBoxSize - 25 : window.imgBoxSize;

// set max letters for folder header according to imgBoxSize and textSize
window.maxLetters = 0;

(function(window){
	var temp = (window.imgBoxSize / 25) * 2 + (16 - window.textSize) + 2;
	window.maxLetters = temp;
})(this);

// arrays that hold temporary data of thumbnails, slides and folder information
var thumbs = new Array();
var slides = new Array();
var folders = new Array();

// hide leave folder in root folder of album (also in clear up content)
if(currentPath == ""){
	$jAlbum(".leaveFolder").hide();
}

// hide special jquery mobile loader
$jAlbum(document).ready( function() {
    $jAlbum(".ui-loader").hide();
});

// hide credits if wanted by the user
if(!window.credits){
	$jAlbum('#jAlbum-footer .center').hide();
}

// make background clickable for going one step back
$jAlbum("#Embeddable, .jAlbum #jAlbum-footer, .jAlbum #jAlbum-footer .center, .jAlbum #jAlbum-footer .left, .jAlbum #jAlbum-footer p, .jAlbum #jAlbum-content, .jAlbum #print").click(function(event) {
	if(event.target == event.currentTarget){
		back();
	}
});

/**
* get get width of website or embed contaienr
*/
function getWidth(){
	return $jAlbum("#Embeddable").width();
}

/**
* get height of browser
*/
function getHeight(){
	return $jAlbum(window).height();
}

/**
* description: checks if the device is mobile
*/
function isMobile(){
	return (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|ipad|iris|kindle|Android|Silk|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(navigator.userAgent) 
    || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(navigator.userAgent.substr(0,4)));
}

/**
* description
* gets a path, goes one directory back
*/
function previousDir(path){

	var filename = path.split("/").pop();
  	
	path = path.substring(0, path.lastIndexOf("/"));
	path = path.substring(0, path.lastIndexOf("/") + 1);

	return path + filename;

}


/**
* description: gets a path and an folder, goes one directory next to this folder
*/
function nextDir(path, folder){
	var filename = path.split("/").pop();
	path = path.substring(0, path.lastIndexOf("/") + 1);
	return path + folder + "/" + filename;
}


/**
* description: returns html image container
*/
function getImageHTML(id, path, square){
    var img = $jAlbum("<img>", {id: id});
    img.attr("src", path);
    img.css("position", "absolute");
    return img;
}

/**
* description: get number images horizontal in a row
* if smaller than 1 show only one image
* if larger than maxImInRow show maximal number of images in row
* else number of images fitting in the width of the window
*/
function getNumImgsInRow(innerWidth){
    var number = Math.round((innerWidth)/ currentBoxSize);
    return (number < 1) ? 1 : (number > window.maxImgInRow) ? window.maxImgInRow : number;
}

/**
* description: set image box size
*/
function setImageBoxSize(size){
    $jAlbum(".main-box").css("width", size + "px");
    $jAlbum(".main-box").css("height", size + "px");
    $jAlbum(".wrapper-box").css("width", size + "px");
    $jAlbum(".wrapper-box").css("height", size + "px");
}

/**
* description: shorten a text to given number of letters
*/
function truncate(text, limit){
	return (text.length > limit) ? text.substring(0 , limit) + '...' : text;
};

/**
* description: initializes all the container
*/
function initContent(jsonTemp) {

	var folderIndex = 0;

    $jAlbum.each(jsonTemp.objects, function (index, object) {
    	switch (object.category) {

		    case 'folder':
		    	// ignore empy folders
		    	if(!object.objects) break;

		    	folders[folderIndex] = {
					index: folderIndex,
					name: object.name,
					path: object.thumb.path,
					width: object.thumb.width,
					height: object.thumb.height,
					count: object.deepCounters.images
				};

				initFolder(folderIndex, object);

		    	folderIndex++;
		        break;
	    }

    });

    var imageIndex = 0;

    $jAlbum.each(jsonTemp.objects, function (index, object) {
    	switch (object.category) {

		    case 'image':
		    
    		    thumbs[imageIndex] = {
					index: imageIndex,
					path: object.thumb.path,
					width: object.thumb.width,
					height: object.thumb.height
				};

				slides[imageIndex] = {
					index: imageIndex,
					category: object.category,
					path: object.image.path,
					width: object.image.width,
					height: object.image.height
				};

				initImage(imageIndex, object);
        		imageIndex++;
		        break;
	    }

    });

    // second call because if scoll bar appears it needs to calculate again
	arrange();
}

/**
* description: change size of image container and images by resize
*/
window.onresize = function(){

	arrange();
	arrangeFullscreen();
};

/**
* description: arranging container in content div
*/
function arrange() {

	var embedWidth, embedHeight, topBottomPadding, minHeight, innerWidth, imgBoxSize, imgSize, num;

	for(var i = 0; i < 2; i++){
		embedWidth = getWidth();
		embedHeight = getHeight();

		topBottomPadding = embedWidth * 0.025;
		minHeight = embedHeight - (topBottomPadding * 2); 

		$jAlbum("#jAlbum-content").css("padding", '' + topBottomPadding + 'px 2.5%');

		// real calculation
		innerWidth = embedWidth - embedWidth * 0.05 -0.5;

		num = getNumImgsInRow(innerWidth);

		imgBoxSize = innerWidth/num;
		imgSize = imgBoxSize - currentImgBoxPadding;

		setImageBoxSize(imgBoxSize);
	}	

	arrangeFolders(imgBoxSize, imgSize);
	arrangeImages(imgBoxSize, imgSize);

}

/**
* description: set current paths on directory back
*/
function back(){

	if(currentPath !== ""){

		currentPath = previousDir(currentPath);

		var newObject = getJsonObject(window.album, currentPath);

		clearUpContent();
		initContent(newObject);
		arrange();
	}
}

/**
* description: trigger function to trigger delete event
*/
function triggerClearUp(state) {

    var evt = $jAlbum.Event('clearUpContent');
    evt.state = state;

    $jAlbum(window).trigger(evt);
}

/**
* description: clears up content and empties arrays, etc
*/
function clearUpContent(){

	triggerClearUp();

	folders = new Array();
	slides = new Array();
	thumbs = new Array();

	// hide leave folder in root folder of album
	if(currentPath == ""){
		$jAlbum(".leaveFolder").hide();
	} else {
		$jAlbum(".leaveFolder").show();
	}
}

/**
* description: recursively getting the current json object
*/
function getJsonObject(jsonObject, tempPath){

	var lastDirectory = tempPath.substring(0, tempPath.indexOf("/"));
	var newTempPath = tempPath.substring(tempPath.indexOf("/") + 1, tempPath.length);
	
	if(lastDirectory == ""){

		return jsonObject;

	} else {

		objectToReturn = undefined;

		$jAlbum.each(jsonObject.objects, function (index, object) {
    		switch (object.category) {

		    	case 'folder':

		    		if(object.path == lastDirectory){
		    			objectToReturn = object;
		   			}
		        break;
	    	}
    	});

    	return getJsonObject(objectToReturn, newTempPath);
	}
}

/**
* description: handles the folder container in the content
* author: Thilo Ilg
*/

/**
* description: initializes all the folder container
*/
function initFolder(index, json){

	// main includes img and text contaienr
	var coverBox = $jAlbum("<div>", {class: "main-box"});
	var mainBox = $jAlbum("<div>", {class: "wrapper-box"});
	var textBox = $jAlbum("<div>", {class: "text-box"});

	// temporary variable to count number of thumbnails of a folder
	var numOfImg = 0;

	// function gets called by entering folder
	function goForward(){
		currentPath = nextDir(currentPath, json.path);
		clearUpContent();
		initContent(json);
    }

    // add main index special id for size calculation
    mainBox.attr("id", "test-box-" + index);

    // hover settings for main box
    mainBox.css({
    	"-webkit-transition": "0.2s ease-out",
    	"-moz-transition": "0.2s ease-out",
    	"-o-transition": "0.2s ease-out",
    	"transition": "0.2s ease-out",
    });

    // click handler on main box
	mainBox.click( function(event) {
		event.stopPropagation();
		(event.target == event.currentTarget ? back : goForward)();
	});

	// interate through images in folder directory and collect maximal three as thumbnails
	$jAlbum.each(json.objects, function (i, object) {

		if(numOfImg < 3){
			switch (object.category) {

				// check if image
				case 'image':

					// path to current image
					var imgPath = currentPath + json.path + "/" + object.thumb.path;

					// get div container with special given image folder id 
					var img = getImageHTML("img-folder-" + numOfImg + "-" + index, jAlbumURL + imgPath, true);

					// add classes to folder thumbnail images to inject with certain behavior
					img.addClass("shadow");
					img.addClass("imgRadius");

				    // clear up trigger event
					$jAlbum(window).on('clearUpContent', function (event) {
						img.remove();
					});

					// regulate hover event on folders with given scale factor
					if(!window.mobile && window.hover){
					    img.hover(function(){
					    	mainBox.css({
					    		"-webkit-transform": window.imgHoverScaleFactor,
						    	"-moz-transform": window.imgHoverScaleFactor,
						    	"-o-transform": window.imgHoverScaleFactor,
						    	"transform": window.imgHoverScaleFactor
					    	});
						}, function(){
							mainBox.css({
								"-webkit-transform": "scale(1)",
						    	"-moz-transform": "scale(1)",
						    	"-o-transform": "scale(1)",
						    	"transform": "scale(1)"
							});
						});
					}

					// append image to main container
				    mainBox.append(img);
				    numOfImg++;

		       		break;
			}
		}
    });

	// add empty folder thumbnail if no images found
	if(numOfImg == 0){

		// empty folder thumbnail path
		var imgPath = "res/img/folder.png";

		// get image div container
		var img = getImageHTML("img-folder-" + 1 + "-" + index, jAlbumURL + imgPath, true);

		// add style
		img.css("width", "100%");

		// add classes to folder thumbnail images to inject with certain behavior
		img.addClass("emptyFolderThumbnail");

	    // clear up trigger event
		$jAlbum(window).on('clearUpContent', function (event) {
			img.remove();
		});

		// regulate hover event on folders with given scale factor
		if(!window.mobile && window.hover){
		    img.hover(function(){
		    	mainBox.css({
		    		"-webkit-transform": window.imgHoverScaleFactor,
			    	"-moz-transform": window.imgHoverScaleFactor,
			    	"-o-transform": window.imgHoverScaleFactor,
			    	"transform": window.imgHoverScaleFactor
		    	});
			}, function(){
				mainBox.css({
					"-webkit-transform": "scale(1)",
			    	"-moz-transform": "scale(1)",
			    	"-o-transform": "scale(1)",
			    	"transform": "scale(1)"
				});
			});
		}

		// append image to main container
		mainBox.append(img);
	}

	// add fodler name in main box
	if(window.showFolderName){
		textBox.addClass("folderTitle");

		var numOfImages = folders[index].count ? folders[index].count : 0; // initialize and check if undefined set to zero

	    textBox.append("<p>" + truncate(folders[index].name, window.maxLetters) + " (" + numOfImages + ")</p>");

	    textBox.click( function(event) {
			event.stopPropagation();
			if(event.target == event.currentTarget){
				goForward();
			}
		});
		coverBox.append(textBox);
	}

	coverBox.append(mainBox);

	// add image folder box to page content
    $jAlbum("#jAlbum-content").append(coverBox);

    // clear up trigger event
	$jAlbum(window).on('clearUpContent', function (event) {
		event.stopPropagation();
	    coverBox.remove();
	});
}

/**
* description: arranges images depending on inner window size
*/
function arrangeFolders(mainBoxSize, imgSize){

	imgSize = window.showFolderName ? imgSize * 0.7 : imgSize * 0.8;

	$jAlbum.each(folders, function(index, folder) {

		if(folder.width != undefined){

			// temporary parameters
			var width = folder.width;
			var height = folder.height;

			for(var i = 0; i < 3; i++){

				var img = $jAlbum("#img-folder-" + i + "-" + folder.index);
				var x = (i - 1) * - 10;
				var y = (i - 1) * - 10;
				var scaledWidth = 0;
				var scaledHeight = 0;

				img.css("transform", "translate(" + x + "px," + y + "px)");
				img.css("zIndex",  20 - i);

				// scales image to certain size
				if(width >= height){
					scaledWidth = imgSize;
					scaledHeight = height / (width/imgSize);
				} else {
					scaledWidth = width / (height/imgSize);
					scaledHeight = imgSize;
				}

				img.css("width", scaledWidth + "px");				
				img.css("height", scaledHeight + "px");

				// special padding treatment for image folder names
				if(window.showFolderName){
					// image margin (center image)
					img.css("margin-top", (mainBoxSize - scaledHeight)/1.35 - window.imgBorderSize);
					img.css("margin-bottom", "0px");
					img.css("margin-left", ((mainBoxSize - scaledWidth)/2 - window.imgBorderSize) + "px");
					img.css("margin-right", ((mainBoxSize - scaledWidth)/2 - window.imgBorderSize) + "px");
				}else{
					img.css("margin", ((mainBoxSize - scaledHeight)/2 - window.imgBorderSize) + "px " + ((mainBoxSize - scaledWidth)/2 - window.imgBorderSize) + "px");
				}
			}
		}
	}); 
}

/**
* description: handles the image container in the content
* author: Thilo Ilg
*/

/**
* description: initializes all the image container
*/
function initImage(index, object){

	// get main div container
    var box = $jAlbum("<div>", {class: "main-box"});

    var img = getImageHTML("img-thumb-" + index, jAlbumURL + currentPath + object.thumb.path, false);

    img.css({
    	"-webkit-transition": "0.2s ease-out",
    	"-moz-transition": "0.2s ease-out",
    	"-o-transition": "0.2s ease-out",
    	"transition": "0.2s ease-out"
    });

	img.css("zIndex", 5);

	img.addClass("shadow");
	img.addClass("imgRadius");
	img.addClass("img-box");

	// hover treatment
	if(!window.mobile &&window.hover){
	    img.hover(function(){
	    	img.css("zIndex", 10);
			img.css({
				'-webkit-transform': window.imgHoverScaleFactor,
				'-moz-transform': window.imgHoverScaleFactor,
				'-o-transform': window.imgHoverScaleFactor,
				'transform': window.imgHoverScaleFactor
			});
		}, function(){

			img.css("zIndex", 5);
			img.css({
				'-webkit-transform': 'scale(1)',
				'-moz-transform': 'scale(1)',
				'-o-transform': 'scale(1)',
				'transform': 'scale(1)'
			});
		});
	}

	box.click( function(event) {
		// prevent page scroll
		event.stopPropagation();

    	if(event.target == event.currentTarget){
			back();
		} else {
			fullscreen(index);
		}	
	});

    box.append(img);

    $jAlbum("#jAlbum-content").append(box);

    // clear up trigger event
	$jAlbum(window).on('clearUpContent', function (event) {
	    box.remove();
	});

}

/**
* description: arranges images depending on inner window size plus scroll bar position
*/
function arrangeImages(imgBoxSize, imgSize) {

	$jAlbum.each(thumbs, function(index, thumb) {

		// temporary parameters
		var width = thumb.width;
		var height = thumb.height;
		
    	var scaledWidth = 0;
    	var scaledHeight = 0;

    	var img = $jAlbum("#img-thumb-" + thumb.index);

    	// scales image to certain size
    	if(width >= height){
			scaledWidth = imgSize;
			scaledHeight = imgSize * height / width;
		} else {
			scaledWidth = imgSize * width / height;
			scaledHeight = imgSize;
		}

		img.css("width", scaledWidth + "px");
		img.css("height", scaledHeight + "px");

		// image margin (center image)
		img.css("margin", ((imgBoxSize - scaledHeight)/2 - window.imgBorderSize) + "px " + ((imgBoxSize - scaledWidth)/2 - window.imgBorderSize) + "px");

	}); 
}

/**
* description: Responsible for the fullscreen view of the images
* author: Thilo Ilg
*/

var tempSlideIndex = null;

/**
* description: shows image in fullsreen mode
*/
function fullscreen(index){

	var width = slides[index].width;
	var height = slides[index].height;
	var path = currentPath + slides[index].path;

    var innerWidth = $jAlbum(window).width();
	var innerHeight = $jAlbum(window).height();

	var img;

    var fs_box = $jAlbum("<div/>");
    var cancel = $jAlbum("<div/>");

    // handle navigation
	var fs = $jAlbum("#fullscreen");

	tempSlideIndex = index;

	$jAlbum("#Embeddable").css("overflowY", "hidden");
	$jAlbum("#Embeddable").css("height", "100%");
    $jAlbum("#fullscreen").css("display", "block");

	fs_box.addClass("fs_box");
	cancel.addClass("cancel");

	switch (slides[index].category) {
		case 'image':
			img = getImageHTML("img-fullscreen-" + index, jAlbumURL + path, false);
			break;
	}

	fs.click( function(event) {

		// prevent page scroll up
		event.stopPropagation();
		
    	if(event.target == event.currentTarget){
			goBack();
		}
	});

	cancel.click( function(event) {

		// prevent page scroll up
		event.stopPropagation();
		
    	if(event.target == event.currentTarget){
			goBack();
		}
	});

	fs.swipe({
		swipe:function(event, target) {
			// disable scrolling on mobile device
        }
    });

    fs_box.swipe({
		tap:function(event, target) {

			if(event.target == event.currentTarget){
				goLeft();
			} 
        },
        longTap:function(event, target) {
        	if(event.target == event.currentTarget){
          		goBack();
          	}
        },
	    swipe:function(event, direction, distance, duration, fingerCount, fingerData) {

	    	switch(direction) {
			    case 'left':
		        	if(event.target == event.currentTarget){
		          		goLeft();
		          	}
			        break;
			    case 'right':
			        if(event.target == event.currentTarget){
		          		goRight();
		          	}
			        break;
			    case 'up':
			       	if(event.target == event.currentTarget){
		          		goBack();
		          	}
			    case 'down':
		        	if(event.target == event.currentTarget){
		          		goBack();
		          	}
			        break;
			    default:
			        break;
			}
	    }
	});

	$jAlbum(document).off().keyup(function (event){

		if(event.keyCode == 37){
			goLeft();
		}else if(event.keyCode == 39 || event.keyCode == 32){
			goRight();
		}else if(event.keyCode == 27 || event.keyCode == 8){
			goBack();
		}
	});

	function goLeft(){
	    var numOfObj = slides.length;
		var newIndex = index + 1;

		if(newIndex < 0){
			newIndex = newIndex + numOfObj;
		} else if(newIndex >= numOfObj){
			newIndex = newIndex - numOfObj;
		}	

		fs_box.remove();
	    img.remove();

	    $jAlbum("#fullscreen").css("display", "none");
	    $jAlbum("#Embeddable").css("overflowY", "visible");
	    $jAlbum("#Embeddable").css("height", "auto");
	    
	    tempSlideIndex = null;

		fullscreen(newIndex);
	}

	function goRight(){
		var numOfObj = slides.length;
		var newIndex = index - 1;	

		if(newIndex < 0){
			newIndex = newIndex + numOfObj;
		} else if(newIndex >= numOfObj){
			newIndex = newIndex - numOfObj;
		}

		fs_box.remove();
	    img.remove();

		$jAlbum("#fullscreen").css("display", "none");
	    $jAlbum("#Embeddable").css("overflowY", "visible");
	    $jAlbum("#Embeddable").css("height", "auto");

	    tempSlideIndex = null;
		fullscreen(newIndex);
	}

	function goBack(){
		$jAlbum("#fullscreen").css("display", "none");
	    $jAlbum("#Embeddable").css("overflowY", "visible");
	    $jAlbum("#Embeddable").css("height", "auto");

	    fs_box.remove();
	    img.remove();
	    tempSlideIndex = null;

		arrange(); 
	}

	fs_box.append(cancel);
	$jAlbum("#fullscreen").append(fs_box);
    $jAlbum("#fullscreen").append(img);

    arrangeFullscreen();

}


/**
* description: fullscreen resize rearrange
*/
function arrangeFullscreen(){

	if(tempSlideIndex !== null){

		var width = slides[tempSlideIndex].width;
		var height = slides[tempSlideIndex].height;

		var innerWidth = $jAlbum(window).width();
		var innerHeight = $jAlbum(window).height();

		var scaledWidth = 0;
		var scaledHeight = 0;
		
		// handle image
		var img = $jAlbum("#fullscreen img");
		var fs_box = $jAlbum(".fs_box");

	    // scales image to certain size
		if(innerWidth/innerHeight >= width/height){
			scaledWidth = width / (height/(innerHeight));
			scaledHeight = innerHeight;
			img.css("margin", 0 + "px " + ((innerWidth) - scaledWidth)/2 + "px");
			fs_box.css("margin", 0 + "px " + ((innerWidth) - scaledWidth)/2 + "px");
		} else {
			scaledWidth = innerWidth;
			scaledHeight = height / (width/(innerWidth));
			img.css("margin", ((innerHeight) - scaledHeight)/2 + "px " + 0 + "px");
			fs_box.css("margin", ((innerHeight) - scaledHeight)/2 + "px " + 0 + "px");
		}

		img.css("height", scaledHeight);
		img.css("width", scaledWidth);

		fs_box.css("height", scaledHeight);
		fs_box.css("width", scaledWidth);
	}
}

// call main
initContent(window.album);