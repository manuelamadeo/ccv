 /******************************************************
    *ImageFlow Script
******************************************************/	



$(document).ready(function() {
  $('select').material_select();       		
$('.up').velocity({translateY: [0,6,-5,4,-2,1,0]}, {loop: 4, delay:200,  duration:300  });


$('.card-image img').velocity({borderRadius: 6});
$('.card-image i.fa-search').velocity({opacity: 0});
$('.card-image').mouseenter(function () {
       $(this).addClass('hover'); 
      $('.hover img').velocity({scale:1.1});
     }).mouseleave(function () {   
      $('.hover img, .hover i.fa-search').velocity("finish").velocity('reverse'); 
      $(this).removeClass('hover');
    });
	//$('.reset, .resetFilter').mouseenter(function () {
      //$('i.fa-refresh').addClass('fa-spin'); 
     //}).mouseleave(function () {   
      //$('i.fa-refresh').removeClass('fa-spin');
    //});

//Materialize.toast("Pinto Demo",3000, 'rounded');	
(function() {	
      function getWindowWidth() {
        return Math.max(document.documentElement.clientWidth, window.innerWidth || 0)
      }

      // Instantiate wookmark after all images have been loaded
      var wookmark;
      imagesLoaded('.gallery', function() {
        wookmark = new Wookmark('.gallery', {
		autoResize:true,
			align: 'center',
			verticalOffset: 15,
			offset:15,
			resizeDelay: 50,
			 direction: "left", //"left" or "right"
          itemWidth: 210, // Optional min width of a grid item
          outerOffset: 10, // Optional the distance from grid to parent
          flexibleWidth: function () {
            // Return a maximum width depending on the viewport
            return getWindowWidth() < 1024 ? '100%' : '50%';
          }
        });
      });	  

      // Setup filter buttons when jQuery is available
      var $filters = $('#filters li a');
	   var $filters2 = $('.keywords .label.badge');
      /**
       * When a filter is clicked, toggle it's active state and refresh.
       */
      var onClickFilter = function(event) {
        var $item = $(event.currentTarget),
            itemActive = $item.hasClass('active, red');
			
        if (!itemActive) {
          $filters.removeClass('active');
		   $filters2.removeClass('red');
          itemActive = true;
        } else {
		
          itemActive = false;
        }
		$item.closest('.label.badge').toggleClass('red');
        $item.toggleClass('active');
        // Filter by the currently selected filter
        wookmark.filter(itemActive ? [$item.data('filter')] : []);
      }
      // Capture filter click events.
      $('#filters').on('click.wookmark-filter', 'li a', onClickFilter);
	  $('#filters').on('click.wookmark-filter', 'li a', function (){
		  $('.slider').velocity('fadeOut');	  
		  });
	  
	  $('.keywords').on('click.wookmark-filter', '.label.badge', onClickFilter);
	   $('.keywords').on('click.wookmark-filter', '.label.badge', function (){
		  $('.slider').velocity('fadeOut');
		  }); 
	   $('.label.badge').on('click touchstart', function(){
		$('.resetFilter').velocity("fadeIn");
	});
	$('.resetFilter').on('click touchstart', function(){
		$('.item').velocity({ opacity: 1 });
		$('.slider').velocity('fadeIn');
		$(this).velocity('fadeOut',{delay:1000});
	$('.item').removeClass('wookmark-inactive');
	$('.label.badge').removeClass('red');
	 $('.gallery').wookmark({verticalOffset: 15,
			offset:15}); 
	});
	
    })();


//Photoswipe

(function( $ ) {
    $.fn.photoswipe = function(options){
        var galleries = [],
            _options = options;

        var init = function($this){
            galleries = [];
            $this.each(function(i, gallery){
                galleries.push({
                    id: i,
                    items: []
                });

                $(gallery).find('a.ps').each(function(k, link) {
                    var $link = $(link),
                        size = $link.data('size').split('x');
                    if (size.length != 2){
                        throw SyntaxError("Missing data-size attribute.");
                    }
                    $link.data('gallery-id',i+1);
                    $link.data('photo-id', k);

                    var item = {
                        src: link.href,
                        msrc: link.children[0].getAttribute('src'),
                        w: parseInt(size[0],10),
                        h: parseInt(size[1],10),
                        title: $link.data('title'),
                        el: link
                    }

                    galleries[i].items.push(item);

                });

                $(gallery).on('click', 'a.ps', function(e){
                    e.preventDefault();
                    var gid = $(this).data('gallery-id'),
                        pid = $(this).data('photo-id');
                    openGallery(gid,pid);
                });
            });
        }

        var parseHash = function() {
            var hash = window.location.hash.substring(1),
            params = {};

            if(hash.length < 5) {
                return params;
            }

            var vars = hash.split('&');
            for (var i = 0; i < vars.length; i++) {
                if(!vars[i]) {
                    continue;
                }
                var pair = vars[i].split('=');
                if(pair.length < 2) {
                    continue;
                }
                params[pair[0]] = pair[1];
            }

            if(params.gid) {
                params.gid = parseInt(params.gid, 10);
            }

            if(!params.hasOwnProperty('pid')) {
                return params;
            }
            params.pid = parseInt(params.pid, 10);
            return params;
        };

        var openGallery = function(gid,pid){
            var pswpElement = document.querySelectorAll('.pswp')[0],
                items = galleries[gid-1].items,
                options = {
                    index: pid,
                    galleryUID: gid,
                    getThumbBoundsFn: function(index) {
                        var thumbnail = items[index].el.children[0],
                            pageYScroll = window.pageYOffset || document.documentElement.scrollTop,
                            rect = thumbnail.getBoundingClientRect();

                        return {x:rect.left, y:rect.top + pageYScroll, w:rect.width};
                    }
                };
            $.extend(options,_options);
            var gallery = new PhotoSwipe( pswpElement, PhotoSwipeUI_Default, items, options);
            gallery.init();
        }

        // initialize
        init(this);

        // Parse URL and open gallery if it contains #&pid=3&gid=1
        var hashData = parseHash();
        if(hashData.pid > 0 && hashData.gid > 0) {
            openGallery(hashData.gid,hashData.pid);
        }

        return this;
    };
}( jQuery ));

 $('.gallery').photoswipe({
        loop: true,
         bgOpacity: 0.7,
          showHideOpacity: true,
		  closeEl:true,
captionEl: true,
fullscreenEl: true,
zoomEl: true,
shareEl: true,
counterEl: true,
arrowEl: true,
preloaderEl: true,
		  shareButtons: [
    {id:'facebook', label:'Share on Facebook', url:'https://www.facebook.com/sharer/sharer.php?u={{url}}'}, 
    {id:'twitter', label:'Tweet', url:'https://twitter.com/intent/tweet?text={{text}}&url={{url}}'}, 
	{id:'googleplus', label:'GooglePlus', url:'https://plus.google.com/share?text={{text}}&url={{url}}'}, 
    {id:'pinterest', label:'Pin it', url:'http://www.pinterest.com/pin/create/button/?url={{url}}&media={{image_url}}&description={{text}}'}, 
    {id:'download', label:'Download image', url:'{{raw_image_url}}', download:true}, 
	{id:'email', label:'Email Link', url:'mailto:?subject={{text}}&body={{image_url}}'} 
],
		addCaptionHTMLFn: function(item, captionEl, isFake) {
    if(!item.title) {
        captionEl.children[0].innerHTML = '';
        return false;
    }
    captionEl.children[0].innerHTML = item.title;
    return true;
}

    });





	//$('.gallery').imagesLoaded( function() {
	//$('.gallery').pinto({
	//	itemSelector: '> div.item',		// block identificator;
	//	itemWidth: 210,				// width of one grid block in pixels;
	//	marginX: 15,				// width spacing between blocks in pixels;
    //    marginY: 15, 				// height spacing between blocks in pixels;
	//	align: 'center',			    // blocks alignment - 'left', 'right' or 'center';
	//	fitWidth: true,			    // adjusts block width to create optimal layout based on container size;
	//	animate: true,				// CSS animation when updating layout; 
	//	autoResize: true,			// updates layout after browser is resized;
	//	resizeDelay: 50				// time in milliseconds between browser resize and layout update;
	//});
//});

$(".card-reveal2").mCustomScrollbar({
					scrollButtons:{enable:true,scrollType:"stepped"},
					keyboard:{scrollType:"stepped"},
					mouseWheel:{scrollAmount:100},
					theme:"rounded-dark",
					autoExpandScrollbar:true,
					snapAmount:100,
					snapOffset:45
				});	

$(".card-reveal").mCustomScrollbar({
				scrollButtons:{enable:true},
					theme:"minimal-dark",
					autoExpandScrollbar:true,
					autoHideScrollbar: false
				});
$(".container.main").mCustomScrollbar({
					scrollButtons:{enable:true,scrollType:"auto"},
					keyboard:{scrollType:"auto"},
					mouseWheel:{scrollAmount:200},
					theme:"minimal-dark",
					autoExpandScrollbar:true,
					snapAmount:200,
					snapOffset:65,
					setHeight: '100%'
				});
$('.slider').slider({full_width: true, indicators: false, transition: 500,height: 250,interval:5000}).velocity("fadeIn", { duration: 400 });
$('.slides').velocity("fadeIn", { duration: 300 });
//$('.item').velocity("fadeIn",{ stagger: 40 });
$('#nav').velocity("slideDown",{delay:400});
$('footer').velocity("fadeIn",{delay:400});
$('.mini-Img').velocity("fadeIn",{delay:400});
$('.scrollTop, .label.badge').bind("click", function() {
        // prevent default action and bubbling
        //var target = $('.scrollTop').attr("href");
        // scroll to each target
        $('#top').velocity("scroll", {
            duration: 800,
            offset: -80,
            easing: "ease-in-out"
        });
	
});
$('.modal-trigger').leanModal({
      dismissible: true, // Modal can be dismissed by clicking outside of the modal
      opacity: .5, // Opacity of modal background
      in_duration: 300, // Transition in duration
      out_duration: 200, // Transition out duration
      beloworigin: true
    }
  );	

$('.button-collapse').sideNav();
 $(document).on('click.item', '.item', function (e) {
      if ($(this).find('.card-reveal').length) {
        if ($(e.target).is($('.card-reveal .card-title')) || $(e.target).is($('.card-reveal .card-title i'))) {
          // Make Reveal animate down and display none
          $(this).find('.card-reveal').velocity(
            {translateY: 0}, {
              duration: 225,
              queue: false,
              easing: 'easeInOutQuad',
              complete: function() { $(this).css({ display: 'none'}); }
            }
          );
        }
        else if ($(e.target).is($('.item.current .activator')) ||
                 $(e.target).is($('.item.current .activator i')) ) {
          $(this).find('.card-reveal').css({ display: 'block'}).velocity("stop", false).velocity({translateY: '-100%'}, {duration: 300, queue: false, easing: 'easeInOutQuad'});
        }
      }


    });

// Google Fonts
(function( $ ) {
  $.fn.google_fonts = function(options) {
  	var defaults = {
        fontname: "arial"
    };
    var options = jQuery.extend(defaults, options);
    var fontname = options.fontname;
    fontname = fontname.replace(/ /gi, "+");
    $("head").append('<link href="http://fonts.googleapis.com/css?family='+fontname+'" rel="stylesheet" type="text/css">');
    jQuery(this).css("font-family",options.fontname);
    return this;
  };
})( jQuery );

$("body, .container").google_fonts({fontname: "Roboto"});

  $('a.show-hint').on('click',function() {
  var $target = $(this),
    currentUrl = encodeURIComponent(window.location.hash),	  
    title = $target.attr('title') || $target.attr('data-v-title'),
	 text = encodeURIComponent(title),
    winOptions = 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600';
    switch (title) {
      case 'Facebook':
        window.open('https://www.facebook.com/sharer/sharer.php?u='+currentUrl+'&t='+text, '', winOptions);
      break;
      case 'Twitter':
        window.open('https://twitter.com/share?text='+text+' '+currentUrl, '', winOptions);
      break;
      case 'Google+':
        window.open('https://plus.google.com/share?url='+currentUrl, '', winOptions);
      break;
      case 'Linkedin':
        window.open('http://www.linkedin.com/shareArticle?mini=true&url='+currentUrl+'&title='+text, '',  winOptions);
      break;
      case 'Email':
      window.location.href='mailto:email@example.com';
      break;
    }
});	
var menu = document.getElementById('socialbutton'); 
var menu2 = document.getElementById('aboutbutton');  
      menu.style.display = 'none';
	   menu2.style.display = 'none';
      setTimeout(function() {
        menu.style.display = 'block';
		menu2.style.display = 'block';
        menu.className = 'mfb-slidein-spring mfb-component--tr';
      },1);	
  
 // Toggle search
 $('select').material_select();
var handler = $('.gallery').wookmark();
$("#search").quicksearch(".item", {
          'loader': 'span.loading',
         'bind': 'keyup keydown',
    'minValLength': 2,
    'show': function () {   
        $(this).removeClass('wookmark-inactive');	
    },
    'hide': function () {
        $(this).addClass('wookmark-inactive');  
    },
	'onAfter': function () {
      $('.gallery').wookmark();   
    }
      });
	  
	$('a#toggle-search, .clearInput').click(function()
	{
		var search = $('div#searcher');
		search.is(":visible") ? search.velocity("slideUp") : search.velocity("slideDown",function()
		{
			search.find('input').focus();
		});
		return false;
	});

	$('.clearInput').on('click touchstart', function(){
	$('#search').val('').trigger('keyup');
	$('.item').velocity({ opacity: 1 });
	 $('.slider').velocity('fadeIn');
	$('.item').removeClass('wookmark-inactive');
	 $('.gallery').wookmark({verticalOffset: 15,
			offset:15});  
	});	

$('.pswp__logo').append('Un-Registered <br> <a href="http://www.jalbumskins.com/#pinto"><i class="fa fa-th"></i> Pinto Skin</a>');
});


