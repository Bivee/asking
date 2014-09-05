/*
 
 01. Twitter - Remplace username by yours
 02. Roles of Header
 03. Smooth Scroll ( ScrollTo )
 04. Navigation - Selected and sticky Navigation
 05. Fancybox
 06. Flex Slider
 
 */


//             - FLEX SLIDER - 

$(window).load(function() {
    $('.flexslider').flexslider({
        animation: "fade",
        controlNav: false,
        directionNav: false,
        slideshowSpeed: 3000,
    });
});

/* -- 01.  TWITTER MAKE IT WORK - Just Replace wrapbootstrap username -- */


jQuery(function($) {
    $("#ticker").tweet({
        username: 'wrapbootstrap',
        page: 1,
        avatar_size: 0,
        count: 10,
        template: "{text}{time}",
        filter: function(t) {
            return !/^@\w+/.test(t.tweet_raw_text);
        },
        loading_text: "loading tweets..."
    }).bind("loaded", function() {
        var ul = $(this).find(".tweet_list");
        var ticker = function() {
            setTimeout(function() {
                ul.find('li:first').animate({marginTop: '-30px'}, 500, function() {
                    $(this).detach().appendTo(ul).removeAttr('style');
                });
                ticker();
            }, 5000);
        };
        ticker();
    });
});


/* -- 03. SCROLL TO  -- */


$('ul.nav a, #down_button a').click(function(e) {
    $('html,body').scrollTo(this.hash, this.hash);
    e.preventDefault();
});

/* -- 04. NAVBAR STICKY + SELECTED  -- */


$(function() {

    // Do our DOM lookups beforehand
    var nav_container = $(".navbar-wrapper");
    var nav = $(".navbar");

    var top_spacing = 0;
    var waypoint_offset = -60;

    nav_container.waypoint({
        handler: function(event, direction) {

            if (direction == 'down') {

                nav_container.css({'height': nav.outerHeight()});
                nav.stop().addClass("navbar-fixed-top").css("top", -nav.outerHeight()).animate({"top": top_spacing});

            } else {

                nav_container.css({'height': 'auto'});
                nav.stop().removeClass("navbar-fixed-top").css("top", nav.outerHeight() + waypoint_offset).animate({"top": ""});

            }

        },
        offset: function() {
            return -nav.outerHeight() - waypoint_offset;
        }
    });

    var sections = $("section");
    var navigation_links = $("ul.nav a");

    sections.waypoint({
        handler: function(event, direction) {

            var active_section;
            active_section = $(this);
            if (direction === "up")
                active_section = active_section.prev();

            var active_link = $('ul.nav a[href="#' + active_section.attr("id") + '"]');
            navigation_links.removeClass("selected");
            active_link.addClass("selected");

        },
        offset: '25%'
    })


});

/* -- 05. FANCYBOX -- */
$(document).ready(function() {
    $(".fancybox-media").fancybox({
        arrows: true,
        padding: 0,
        closeBtn: true,
        openEffect: 'fade',
        closeEffect: 'fade',
        prevEffect: 'fade',
        nextEffect: 'fade',
        helpers: {
            media: {},
            overlay: {
                locked: false
            },
            buttons: false,
            title: {
                type: 'inside'
            }
        },
        beforeLoad: function() {
            var el, id = $(this.element).data('title-id');
            if (id) {
                el = $('#' + id);
                if (el.length) {
                    this.title = el.html();
                }
            }
        }
    });
});
