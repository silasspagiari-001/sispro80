unit mkm_carrousels; 


interface

uses
    System.SysUtils, System.Classes ,       System.TypInfo, JSON, DBXJSON, DBXJSONReflect, 
    System.DateUtils, math, System.Rtti, System.StrUtils, Vcl.Graphics,
    UniGuiClasses, uconsts, uconsts_cfg, uniHTMLFrame,  Data.DB;

function rc_Carousel( pHtmlFrame : TUniHTMLFrame;
                      pModel:integer ; // 1, 2, 3, ...
                      pAction : string = 'c'; // (C)reate, (I)nsert Slide, (F)inish
                      pImage : string = '';
                      pTitle : string = '';
                      pSubTitle : string = '';
                      pText  : string = ''
//                      pSlide : array of string
                      ) : string;


implementation

uses str_func, mkm_func_web;

function rc_Carousel( pHtmlFrame : TUniHTMLFrame;
                      pModel:integer;
                      pAction : string;
                      pImage : string;
                      pTitle : string;
                      pSubTitle : string ;
                      pText  : string
//                      pSlide : array of string
                      ) : string;
var
  i : integer;
  cHtml : string;
begin
    cHtml :=  '';

    if pModel = 1 then
    begin
       if lowercase(pAction) = 'c' then
       begin
          pHtmlFrame.HTML.Clear; // 
          cHtml := cHtml +
              '<style>' +
              '.slider' + pHtmlFrame.name + ' {' +
              '  width:100%;' +
              '  height:auto;' +
              '  margin-bottom: 30px;' +
              '  position: relative;' +
              '}' +
              '.slider' + pHtmlFrame.name + ' .owl-item.active.center .slider' + pHtmlFrame.name + '-card {' +
              '  transform: scale(1.15);' +
              '  opacity: 1;' +
              '  background: #ff9966; /* fallback for old browsers */' +
              '  background: -webkit-linear-gradient(to bottom, #ff5e62, #ff9966); /* Chrome 10-25, Safari 5.1-6 */' +
              '  background: linear-gradient(to bottom, #ff5e62, #ff9966); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */' +
              '  color: #fff;' +
              '}' +
              '.slider' + pHtmlFrame.name + '-card {' +
              '  background: #fff;' +
              '  padding: 0px 0px;' +
              '  margin: 50px 15px 90px 15px;' +
              '  border-radius: 5px;' +
              '  box-shadow: 0 15px 45px -20px rgb(0 0 0 / 73%);' +
              '  transform: scale(0.9);' +
              '  opacity: 0.5;' +
              '  transition: all 0.3s;' +
              '}' +
              '.slider' + pHtmlFrame.name + '-card img {' +
              '  border-radius: 5px 5px 0px 0px;' +
              '}' +
              '.owl-nav .owl-prev {' +
              '  position: absolute;' +
              '  top: calc(50% - 25px);' +
              '  left: 0;' +
              '  opacity: 1;' +
              '  font-size: 30px !important;' +
              '  z-index: 1;' +
              '}' +
              '.owl-nav .owl-next {' +
              '  position: absolute;' +
              '  top: calc(50% - 25px);' +
              '  right: 0;' +
              '  opacity: 1;' +
              '  font-size: 30px !important;' +
              '  z-index: 1;' +
              '}' +
              '.owl-dots {' +
              '  text-align: center;' +
              '}' +
              '.owl-dots .owl-dot {' +
              '  height: 10px;' +
              '  width: 10px;' +
              '  border-radius: 10px;' +
              '  background: #ccc !important;' +
              '  margin-left: 3px;' +
              '  margin-right: 3px;' +
              '  outline: none;' +
              '}' +
              '.owl-dots .owl-dot.active {' +
              '  background: #f44336 !important;' +
              '}' +
              '</style>' +
              '  <div class="container">' +
              '	  <div class="slider' + pHtmlFrame.name + '">' +
              '				<div class="owl-carousel">' ;
          pHtmlFrame.Html.Text := pHtmlFrame.Html.Text + ( cHtml );
       end
       else
       if lowercase(pAction) = 'i' then
       begin
          cHtml := cHtml +
             '					<div class="slider' + pHtmlFrame.name + '-card">' +
             '						<div class="d-flex justify-content-center align-items-center mb-4">' +
             '							<img src="' + pImage + '" alt="" >' +
             '						</div>' +
             '						<h5 class="mb-0 text-center"><b>' + pSubTitle + '</b></h5>' +
             '						<p class="text-center p-4">' + pText + '</p>' +
             '					</div>' ;
          pHtmlFrame.Html.Text := pHtmlFrame.Html.Text + ( cHtml );
       end
       else
       if lowercase(pAction) = 'f' then
       begin
          cHtml := cHtml +
             '				</div>' +
             '			</div>' +
             '  </div>' +
             '<script>' +
             '$(document).ready(function(){' +
             '  $(".owl-carousel").owlCarousel({' +
             '  	loop:true,' +
             '    margin:10,' +
             '    nav:true,' +
             '	autoplay:true,' +
             '    autoplayTimeout:3000,' +
             '    autoplayHoverPause:true,' +
             '    center: true,' +
             '    navText: [' +
             '	    "<i class=''fa fa-angle-left''></i>",' +
             '	    "<i class=''fa fa-angle-right''></i>"' +
             '	],' +
             '    responsive:{' +
             '        0:{' +
             '            items:1' +
             '        },' +
             '        600:{' +
             '            items:1' +
             '        },' +
             '        1000:{' +
             '            items:3' +
             '        },' +
             '        1400:{' +
             '            items:4' +
             '        }' +
             '    }' +
             '  });' +
             '});' +
             '</script>          ' ;
          pHtmlFrame.Html.Text := pHtmlFrame.Html.Text + ( cHtml );
       end;
    end

    else

    if pModel = 2 then
    begin
       if lowercase(pAction) = 'c' then
       begin
          pHtmlFrame.HTML.Clear; // 
          cHtml := cHtml +
            '' +
            '<style>' +
//            '* {' +
//            '  box-sizing: border-box;' +
//            '}' +
            '' +
            '::-webkit-scrollbar {' +
            '  /* Webkit */' +
            '  width: 0;' +
            '  height: 0;' +
            '}' +
            '' +
            '.hs {' +
            '  display: flex;' +
            '  overflow-x: scroll;' +
            '  justify-content: space-between;' +
            '  scrollbar-width: none;' +
            '  /* Firefox */' +
            '  -ms-overflow-style: none;' +
            '  /* IE 10+ */' +
            '  -webkit-overflow-scrolling: touch;' +
            '  margin: 0 -20px;' +
            '}' +
            '.hs__header {' +
            '  display: flex;' +
            '  align-items: center;' +
            '  width: 100%;' +
            '}' +
            '.hs__headline {' +
            '  flex: 1;' +
            '}' +
            '.hs__arrows {' +
            '  align-self: center;' +
            '}' +
            '.hs__arrows .arrow:before {' +
            '  content: "";' +
            '  display: inline-block;' +
            '  vertical-align: middle;' +
            '  content: "";' +
            '  background: url("data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAw' +
            'MC9zdmciIHdpZHRoPSIxNSIgaGVpZ2h0PSI5IiB2aWV3Qm94PSIwIDAgMTUgOSI+Cgk8cGF0aCBmaWxsPSIjMzMzMzMzIiBkPSJNNy44NjcgOC41NzRsLTcuMjItNy4yMi43MDctLjcwOEw3Ljg2NyA3LjE2IDE0LjA1Ljk4bC43MDYuNzA3Ii8+Cjwvc3ZnPgo=");' +
   //         '  background: url("files/images/slides/1.jpg");' +
            '  background-size: contain;' +
//            '  filter: brightness(5);' + // when dark background
            '  width: 18px;' +
            '  height: 12px;' +
            '  cursor: pointer;' +
            '}' +
            '.hs__arrows .arrow.disabled:before {' +
            '  filter: brightness(2);' +
            '}' +
            '.hs__arrows .arrow.arrow-prev:before {' +
            '  transform: rotate(90deg);' +
            '  margin-right: 10px;' +
            '}' +
            '.hs__arrows .arrow.arrow-next:before {' +
            '  transform: rotate(-90deg);' +
            '}' +
            '.hs__item {' +
            '  flex-grow: 1;' +
            '  flex-shrink: 0;' +
            '  flex-basis: calc(100% / 4 - (10px * 2) - (20px / 4));' +
            '  margin: 10px;' +
            '  display: flex;' +
            '  justify-content: center;' +
            '  align-items: center;' +
            '  flex-direction: column;' +
            '  position: relative;' +
            '  -webkit-user-select: none;' +
            '     -moz-user-select: none;' +
            '      -ms-user-select: none;' +
            '          user-select: none;' +
            '}' +
            '@media only screen and (max-width: 990px) {' +
//            '@media only screen  {' +
            '  .hs__item {' +
            '    flex-basis: calc(100% / 3 - (10px * 2) - (20px / 3));' +
            '  }' +
            '}' +
            '.hs__item:last-child:after {' +
            '  content: "";' +
            '  display: block;' +
            '  position: absolute;' +
            '  width: 10px;' +
            '  height: 1px;' +
            '  right: calc(10px * 2 * -1);' +
            '}' +
            '.hs__item:first-child {' +
            '  margin-left: calc(10px * 2);' +
            '}' +
            '.hs__item__description {' +
            '  z-index: 1;' +
            '  align-self: flex-start;' +
            '  margin: 10px 0;' +
            '}' +
            '.hs__item__subtitle {' +
            '  color: #aaa;' +
            '  display: block;' +
            '}' +
            '.hs__item__image__wrapper {' +
            '  position: relative;' +
            '  width: 100%;' +
            '  height: 0;' +
            '  padding-bottom: 100%;' +
            '}' +
            '.hs__item__image {' +
            '  pointer-events: none;' +
            '  position: absolute;' +
            '  width: 100%;' +
            '  height: 100%;' +
            //'  max-height: 300px;' + // me
            '  -o-object-fit: cover;' +
            '     object-fit: cover;' +
            '}' +
            '@media only screen and (min-width: 990px) {' +
            '  .hs__wrapper {' +
            '    overflow: hidden;' +
            '  }' +
            '}' +
            '@media (hover: none) and (pointer: coarse) {' +
            '  .hs__wrapper .hs__arrows {' +
            '    display: none;' +
            '  }' +
            '  .hs__wrapper .hs__item {' +
            '    flex: 1 0 calc(23% - 10px * 2);' +
            '  }' +
            '}' +
            '@media only screen and (hover: none) and (pointer: coarse) and (max-width: 990px) {' +
            //'@media only screen and (hover: none) and (pointer: coarse)  {' +
            '  .hs__wrapper .hs__item {' +
            '    flex: 1 0 calc(45% - 10px * 2);' +
            '  }' +
            '}' +
            '' +
            '/* Base Styling */' +
//            'body {' +
//            '  margin: 0;' +
//            '  padding: 0;' +
//            '  overflow-x: hidden;' +
//            '  font-family: "Muli", sans-serif;' +
//            '  color: white;' +
//            '  background: white;' +
//            '  line-height: 1.5;' +
//            '  letter-spacing: 0.15px;' +
//            '}' +
            '' +
//            '.container {' +
            '.container-model2 {' +
            '  max-width: 990px;' +
            '  padding: calc(10px * 2);' +
            '  margin: 0 auto;' +
            //'  background: #121212;' +   // when dark background
            '  background: #fff;' +
            '  mix-blend-mode: invert;' +
            '  position: relative;' +
            '}' +
//            '.container:after {' +
            '.container-model2:after {' +
            '  content: "";' +
            '  width: 100vw;' +
            '  height: 100%;' +
//            '  background: #212121;' +   // when dark background
            '  background: #fff;' +
            '  position: absolute;' +
            '  left: 50%;' +
            '  top: 0;' +
            '  transform: translateX(-50%);' +
            '  z-index: -1;' +
            '}' +
            '@media only screen and (min-width: 990px) {' +
            '  .container-model2 {' +
//            '  .container {' +
            '    padding: calc(10px * 4) calc(10px * 8);' +
//            '    max-height:300px' + //me
            '  }' +
            '}' +
            '' +
            '.description {' +
            '  max-width: 990px;' +
            '  color: #212121;' +
            '  margin: 0 auto;' +
            '  padding: calc(10px * 4);' +
            '}' +
            '' +
            '.container-model2 ul {' +
            '  padding: 0;' +
            '  margin: 0;' +
            '}' +
            '</style>' +
            '' +
            '' +
            //'<div class="container">' +
            '<div class="container-model2">' +
            '    <div class="hs__wrapper">' +
            '      <div class="hs__header">' +
            '        <h2 class="hs__headline">' + pTitle + '</h2>' +
            '        <div class="hs__arrows"><a class="arrow disabled arrow-prev"></a><a class="arrow arrow-next"></a></div>' +
            '      </div>' +
            '      <ul class="container-model2 hs">' ;
          pHtmlFrame.Html.Text := pHtmlFrame.Html.Text + ( cHtml );
       end
       else
       if lowercase(pAction) = 'i' then
       begin
          cHtml := cHtml +
            '        <li class="hs__item"> ' +
            '          <div class="hs__item__image__wrapper">' +
            '            <img class="hs__item__image" src="' + pImage + '" alt=""/>' + //https://picsum.photos/id/112/300/300
            '          </div>' +
            '          <div class="hs__item__description"><span class="hs__item__title">' + pSubTitle + '</span><span class="hs__item__subtitle">' + pText + '</span></div>' +
            '        </li>' ;

          pHtmlFrame.Html.Text := pHtmlFrame.Html.Text + ( cHtml );
       end
       else
       if lowercase(pAction) = 'f' then
       begin
          cHtml := cHtml +
            '      </ul>' +
            '    </div>' +
            '</div>' +
            '<script>' +
   //         '// work in progress - needs some refactoring and will drop JQuery i promise :)' +
            'var instance = $(".hs__wrapper");' +
            '$.each( instance, function(key, value) {' +
            '    ' +
            '  var arrows = $(instance[key]).find(".arrow"),' +
            '      prevArrow = arrows.filter(''.arrow-prev''),' +
            '      nextArrow = arrows.filter(''.arrow-next''),' +
            '      box = $(instance[key]).find(".hs"), ' +
            '      x = 0,' +
            '      mx = 0,' +
            '      maxScrollWidth = box[0].scrollWidth - (box[0].clientWidth / 2) - (box.width() / 2);' +
            '' +
            '  $(arrows).on(''click'', function() {' +
            '      ' +
            '    if ($(this).hasClass("arrow-next")) {' +
            '      x = ((box.width() / 2)) + box.scrollLeft() - 10;' +
            '      box.animate({' +
            '        scrollLeft: x,' +
            '      })' +
            '    } else {' +
            '      x = ((box.width() / 2)) - box.scrollLeft() -10;' +
            '      box.animate({' +
            '        scrollLeft: -x,' +
            '      })' +
            '    }' +
            '      ' +
            '  });' +
            '    ' +
            '  $(box).on({' +
            '    mousemove: function(e) {' +
            '      var mx2 = e.pageX - this.offsetLeft;' +
            '      if(mx) this.scrollLeft = this.sx + mx - mx2;' +
            '    },' +
            '    mousedown: function(e) {' +
            '      this.sx = this.scrollLeft;' +
            '      mx = e.pageX - this.offsetLeft;' +
            '    },' +
            '    scroll: function() {' +
            '      toggleArrows();' +
            '    }' +
            '  });' +
            '' +
            '  $(document).on("mouseup", function(){' +
            '    mx = 0;' +
            '  });' +
            '  ' +
            '  function toggleArrows() {' +
            '    if(box.scrollLeft() > maxScrollWidth - 10) {' +
   //         '        // disable next button when right end has reached ' +
            '        nextArrow.addClass(''disabled'');' +
            '      } else if(box.scrollLeft() < 10) {' +
   //         '        // disable prev button when left end has reached ' +
            '        prevArrow.addClass(''disabled'')' +
            '      } else{' +
   //         '        // both are enabled' +
            '        nextArrow.removeClass(''disabled'');' +
            '        prevArrow.removeClass(''disabled'');' +
            '      }' +
            '  }' +
            '  ' +
            '});' +
            '</script>';

          pHtmlFrame.Html.Text := pHtmlFrame.Html.Text + ( cHtml );
       end;
    end;
    //pHtmlFrame.HTML.Text := RemoveInvalidChar( pHtmlFrame.HTML.Text );
end;
end.
