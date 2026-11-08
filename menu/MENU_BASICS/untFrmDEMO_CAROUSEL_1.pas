unit untFrmDEMO_CAROUSEL_1;// v. 4.3.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIForm, uniGUIBaseClasses, uniButton, uniBitBtn, uniLabel, uniEdit, uniPanel, uniPageControl, uniHTMLFrame,
  uniURLFrame, Vcl.Imaging.jpeg, uniImage, uniScrollBox, uniMemo,
  Vcl.Imaging.pngimage, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit, uniSweetAlert, uniFileUpload;

 type
  SlidesCarousel_1 = record
                       Image : string;
                       Title : string;
                       Text  : string;
                     end;

  TfrmDEMO_CAROUSEL_1 = class(TUniFrame)
    sboxGridBlock: TUniScrollBox;
    rcSweetAlert: TUniSweetAlert;
    rcBlock200: TUniContainerPanel;
    UniLabel2: TUniLabel;
    rcBlock490: TUniContainerPanel;
    htmlCarousel: TUniHTMLFrame;
    rcBlock500: TUniContainerPanel;
    htmlCarousel2: TUniHTMLFrame;
    rcBlock495: TUniContainerPanel;
    UniLabel1: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    iSlides, iSlideCount : integer;

    pObj : TUniControl;

  end;

implementation

{$R *.dfm}

uses Main, ServerModule, untFrmWEBCAM, MainModule, mkm_gridblock,
  mkm_layout, uconsts, uconsts_cfg, mkm_anim, untDM_RC, mkm_translate, mkm_validate, mkm_qrcode, mkm_func_web, untFrmQRCODE, str_func, mkm_carrousels;// v. 3.4.0.0    , untFrmBARCODE;

procedure TfrmDEMO_CAROUSEL_1.UniFrameCreate(Sender: TObject);
begin
     rc_Carousel( htmlCarousel, 1, 'c');
     rc_Carousel( htmlCarousel, 1, 'i', 'files/images/slides/1.jpg', 'HTML CSS3 Tutorials', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam temporibus quidem magni qui doloribus quasi natus inventore nisi velit minima.' );
     rc_Carousel( htmlCarousel, 1, 'i', 'files/images/slides/2.jpg', 'Wordpress Tutorials', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam temporibus quidem magni qui doloribus quasi natus inventore nisi velit minima.' );
     rc_Carousel( htmlCarousel, 1, 'i', 'files/images/slides/3.jpg', 'PHP MySQL Tutorials', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam temporibus quidem magni qui doloribus quasi natus inventore nisi velit minima.' );
     rc_Carousel( htmlCarousel, 1, 'i', 'files/images/slides/4.jpg', 'Javascript Tutorials', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam temporibus quidem magni qui doloribus quasi natus inventore nisi velit minima.' );
     rc_Carousel( htmlCarousel, 1, 'i', 'files/images/slides/5.jpg', 'Bootstrap Tutorials', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam temporibus quidem magni qui doloribus quasi natus inventore nisi velit minima.' );
     rc_Carousel( htmlCarousel, 1, 'f');

     rc_Carousel( htmlCarousel2, 2, 'c');
     rc_Carousel( htmlCarousel2, 2, 'i', 'files/images/slides/1.jpg', 'HTML CSS3 Tutorials', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam temporibus quidem magni qui doloribus quasi natus inventore nisi velit minima.' );
     rc_Carousel( htmlCarousel2, 2, 'i', 'files/images/slides/2.jpg', 'Wordpress Tutorials', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam temporibus quidem magni qui doloribus quasi natus inventore nisi velit minima.' );
     rc_Carousel( htmlCarousel2, 2, 'i', 'files/images/slides/3.jpg', 'PHP MySQL Tutorials', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam temporibus quidem magni qui doloribus quasi natus inventore nisi velit minima.' );
     rc_Carousel( htmlCarousel2, 2, 'i', 'files/images/slides/4.jpg', 'Javascript Tutorials', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam temporibus quidem magni qui doloribus quasi natus inventore nisi velit minima.' );
     rc_Carousel( htmlCarousel2, 2, 'i', 'files/images/slides/5.jpg', 'Bootstrap Tutorials', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam temporibus quidem magni qui doloribus quasi natus inventore nisi velit minima.' );
     rc_Carousel( htmlCarousel2, 2, 'i', 'files/images/slides/6.jpg', 'RadCORE Tutorials', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam temporibus quidem magni qui doloribus quasi natus inventore nisi velit minima.' );
     rc_Carousel( htmlCarousel2, 2, 'f');

//     htmlCarousel.Clear;
//     htmlCarousel.HTML.Text :=
//         '' +
//         '<style>' +
//         '* {' +
//         '  box-sizing: border-box;' +
//         '}' +
//         '' +
//         '::-webkit-scrollbar {' +
//         '  /* Webkit */' +
//         '  width: 0;' +
//         '  height: 0;' +
//         '}' +
//         '' +
//         '.hs {' +
//         '  display: flex;' +
//         '  overflow-x: scroll;' +
//         '  justify-content: space-between;' +
//         '  scrollbar-width: none;' +
//         '  /* Firefox */' +
//         '  -ms-overflow-style: none;' +
//         '  /* IE 10+ */' +
//         '  -webkit-overflow-scrolling: touch;' +
//         '  margin: 0 -20px;' +
//         '}' +
//         '.hs__header {' +
//         '  display: flex;' +
//         '  align-items: center;' +
//         '  width: 100%;' +
//         '}' +
//         '.hs__headline {' +
//         '  flex: 1;' +
//         '}' +
//         '.hs__arrows {' +
//         '  align-self: center;' +
//         '}' +
//         '.hs__arrows .arrow:before {' +
//         '  content: "";' +
//         '  display: inline-block;' +
//         '  vertical-align: middle;' +
//         '  content: "";' +
//         '  background: url("data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAw' +
//         'MC9zdmciIHdpZHRoPSIxNSIgaGVpZ2h0PSI5IiB2aWV3Qm94PSIwIDAgMTUgOSI+Cgk8cGF0aCBmaWxsPSIjMzMzMzMzIiBkPSJNNy44NjcgOC41NzRsLTcuMjItNy4yMi43MDctLjcwOEw3Ljg2NyA3LjE2IDE0LjA1Ljk4bC43MDYuNzA3Ii8+Cjwvc3ZnPgo=");' +
////         '  background: url("files/images/slides/1.jpg");' +
//         '  background-size: contain;' +
//         '  filter: brightness(5);' +
//         '  width: 18px;' +
//         '  height: 12px;' +
//         '  cursor: pointer;' +
//         '}' +
//         '.hs__arrows .arrow.disabled:before {' +
//         '  filter: brightness(2);' +
//         '}' +
//         '.hs__arrows .arrow.arrow-prev:before {' +
//         '  transform: rotate(90deg);' +
//         '  margin-right: 10px;' +
//         '}' +
//         '.hs__arrows .arrow.arrow-next:before {' +
//         '  transform: rotate(-90deg);' +
//         '}' +
//         '.hs__item {' +
//         '  flex-grow: 1;' +
//         '  flex-shrink: 0;' +
//         '  flex-basis: calc(100% / 4 - (10px * 2) - (20px / 4));' +
//         '  margin: 10px;' +
//         '  display: flex;' +
//         '  justify-content: center;' +
//         '  align-items: center;' +
//         '  flex-direction: column;' +
//         '  position: relative;' +
//         '  -webkit-user-select: none;' +
//         '     -moz-user-select: none;' +
//         '      -ms-user-select: none;' +
//         '          user-select: none;' +
//         '}' +
//         '@media only screen and (max-width: 990px) {' +
//         '  .hs__item {' +
//         '    flex-basis: calc(100% / 3 - (10px * 2) - (20px / 3));' +
//         '  }' +
//         '}' +
//         '.hs__item:last-child:after {' +
//         '  content: "";' +
//         '  display: block;' +
//         '  position: absolute;' +
//         '  width: 10px;' +
//         '  height: 1px;' +
//         '  right: calc(10px * 2 * -1);' +
//         '}' +
//         '.hs__item:first-child {' +
//         '  margin-left: calc(10px * 2);' +
//         '}' +
//         '.hs__item__description {' +
//         '  z-index: 1;' +
//         '  align-self: flex-start;' +
//         '  margin: 10px 0;' +
//         '}' +
//         '.hs__item__subtitle {' +
//         '  color: #aaa;' +
//         '  display: block;' +
//         '}' +
//         '.hs__item__image__wrapper {' +
//         '  position: relative;' +
//         '  width: 100%;' +
//         '  height: 0;' +
//         '  padding-bottom: 100%;' +
//         '}' +
//         '.hs__item__image {' +
//         '  pointer-events: none;' +
//         '  position: absolute;' +
//         '  width: 100%;' +
//         '  height: 100%;' +
//         '  -o-object-fit: cover;' +
//         '     object-fit: cover;' +
//         '}' +
//         '@media only screen and (min-width: 990px) {' +
//         '  .hs__wrapper {' +
//         '    overflow: hidden;' +
//         '  }' +
//         '}' +
//         '@media (hover: none) and (pointer: coarse) {' +
//         '  .hs__wrapper .hs__arrows {' +
//         '    display: none;' +
//         '  }' +
//         '  .hs__wrapper .hs__item {' +
//         '    flex: 1 0 calc(23% - 10px * 2);' +
//         '  }' +
//         '}' +
//         '@media only screen and (hover: none) and (pointer: coarse) and (max-width: 990px) {' +
//         '  .hs__wrapper .hs__item {' +
//         '    flex: 1 0 calc(45% - 10px * 2);' +
//         '  }' +
//         '}' +
//         '' +
//         '/* Base Styling */' +
//         'body {' +
//         '  margin: 0;' +
//         '  padding: 0;' +
//         '  overflow-x: hidden;' +
//         '  font-family: "Muli", sans-serif;' +
//         '  color: white;' +
//         '  background: white;' +
//         '  line-height: 1.5;' +
//         '  letter-spacing: 0.15px;' +
//         '}' +
//         '' +
//         '.container {' +
//         '  max-width: 990px;' +
//         '  padding: calc(10px * 2);' +
//         '  margin: 0 auto;' +
//         '  background: #121212;' +
//         '  mix-blend-mode: invert;' +
//         '  position: relative;' +
//         '}' +
//         '.container:after {' +
//         '  content: "";' +
//         '  width: 100vw;' +
//         '  height: 100%;' +
//         '  background: #212121;' +
//         '  position: absolute;' +
//         '  left: 50%;' +
//         '  top: 0;' +
//         '  transform: translateX(-50%);' +
//         '  z-index: -1;' +
//         '}' +
//         '@media only screen and (min-width: 990px) {' +
//         '  .container {' +
//         '    padding: calc(10px * 4) calc(10px * 8);' +
//         '  }' +
//         '}' +
//         '' +
//         '.description {' +
//         '  max-width: 990px;' +
//         '  color: #212121;' +
//         '  margin: 0 auto;' +
//         '  padding: calc(10px * 4);' +
//         '}' +
//         '' +
//         'ul {' +
//         '  padding: 0;' +
//         '  margin: 0;' +
//         '}' +
//         '</style>' +
//         '' +
//         '' +
//         '<div class="container">' +
//         '    <div class="hs__wrapper">' +
//         '      <div class="hs__header">' +
//         '        <h2 class="hs__headline">Headline 1' +
//         '        </h2>' +
//         '        <div class="hs__arrows"><a class="arrow disabled arrow-prev"></a><a class="arrow arrow-next"></a></div>' +
//         '      </div>' +
//         '      <ul class="hs">' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/112/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 1</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/122/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 2</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/132/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 3</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/142/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 4</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/152/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 5</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/162/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 6</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/172/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 7</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/182/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 8</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/192/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 9</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1102/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 10</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1112/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 11</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1122/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 12</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1132/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 13</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1142/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 14</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1152/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 15</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1162/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 16</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1172/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 17</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1182/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 18</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1192/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 19</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1202/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 20</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '      </ul>' +
//         '    </div>' +
//         '    <div class="hs__wrapper">' +
//         '      <div class="hs__header">' +
//         '        <h2 class="hs__headline">Headline 2' +
//         '        </h2>' +
//         '        <div class="hs__arrows"><a class="arrow disabled arrow-prev"></a><a class="arrow arrow-next"></a></div>' +
//         '      </div>' +
//         '      <ul class="hs">' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/103/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 0</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/113/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 1</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/123/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 2</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/133/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 3</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/143/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 4</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/153/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 5</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/163/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 6</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/173/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 7</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/183/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 8</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/193/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 9</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1103/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 10</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1113/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 11</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1123/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 12</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1133/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 13</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1143/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 14</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1153/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 15</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1163/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 16</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1173/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 17</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1183/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 18</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1193/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 19</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1203/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 20</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '      </ul>' +
//         '    </div>' +
//         '    <div class="hs__wrapper">' +
//         '      <div class="hs__header">' +
//         '        <h2 class="hs__headline">Headline 3' +
//         '        </h2>' +
//         '        <div class="hs__arrows"><a class="arrow disabled arrow-prev"></a><a class="arrow arrow-next"></a></div>' +
//         '      </div>' +
//         '      <ul class="hs">' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/104/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 0</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/114/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 1</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/124/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 2</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/134/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 3</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/144/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 4</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/154/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 5</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/164/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 6</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/174/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 7</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/184/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 8</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/194/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 9</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1104/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 10</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1114/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 11</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1124/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 12</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1134/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 13</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1144/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 14</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1154/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 15</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1164/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 16</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1174/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 17</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1184/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 18</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1194/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 19</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '        <li class="hs__item"> ' +
//         '          <div class="hs__item__image__wrapper">' +
//         '            <!--img.hs__item__image(src="https://source.unsplash.com/random/300×300/?album&sig"+[n]+[i], alt="")--><img class="hs__item__image" src="https://picsum.photos/id/1204/300/300" alt=""/>' +
//         '          </div>' +
//         '          <div class="hs__item__description"><span class="hs__item__title">Amazing title 20</span><span class="hs__item__subtitle">some subtitle</span></div>' +
//         '        </li>' +
//         '      </ul>' +
//         '    </div>' +
//         '  </div>' +
//         '  <div class="description">' +
//         '    <h3>Description</h3>' +
//         '    <p> <strong>Work in progress – </strong>Horizontal scroll containers are hyped right now. ' +
//         '        Whether you browse the Appstore, search for articles on Medium or set some filters in Instagram. Many apps use this kind of pattern. But most of them are very touch and mobile oriented. So I wondered how to make it nice on touch AND desktop.</p>' +
//         '    <p>Depending on your desktop layout, you probably don''t want the cards to run over the edge of the screen. ' +
//         '       Let''s take a look at the "Home" section of Spotify. On the desktop, they show 4 to 6 cards in a slider with arrows at the top. And with touch/mobile they use the horizontal overflow scrolling.</p>' +
//         '    <p>So let''s recreate exactly this behaviour for responsive web use.</p>' +
//         '    <p>Things already achieved:</p>' +
//         '    <ol>' +
//         '      <li>4 column grid on desktop. Tease the 4th on touch.</li>' +
//         '      <li>Hide arrows on touch</li>' +
//         '      <li>Disable corresponding arrow when end or start has been reached</li>' +
//         '      <li>(As suggested) - Toggle arrow state on drag and scroll as well</li>' +
//         '      <li>Always keep left and right spacings</li>' +
//         '      <li>No ugly scrollbars on any browser</li>' +
//         '      <li>Horizontal scrolling, dragging or arrow-click</li>' +
//         '      <li>Multiple instances</li>' +
//         '      <li>CSS Grid and CSS Vars are nice, but let''s make this work on IE11 as well</li>' +
//         '    </ol>' +
//         '    <p>Todo / open (feel free to left suggestions in the comments)' +
//         '      <ol> ' +
//         '        <li>If you click an arrow after box has been dragged / scrolled, it is not snapping to the grid anymore.</li>' +
//         '        <li>Get rid of jQuery</li>' +
//         '      </ol>' +
//         '    </p>' +
//         '    <p> <strong>BONUS – </strong>I made another alternative version here: <a href="https://codepen.io/kilianso/pen/WqdVLx?editors=1010" target="_blank">https://codepen.io/kilianso/pen/WqdVLx</a></p>' +
//         '  </div>' +
//         '<script>' +
////         '// work in progress - needs some refactoring and will drop JQuery i promise :)' +
//         'var instance = $(".hs__wrapper");' +
//         '$.each( instance, function(key, value) {' +
//         '    ' +
//         '  var arrows = $(instance[key]).find(".arrow"),' +
//         '      prevArrow = arrows.filter(''.arrow-prev''),' +
//         '      nextArrow = arrows.filter(''.arrow-next''),' +
//         '      box = $(instance[key]).find(".hs"), ' +
//         '      x = 0,' +
//         '      mx = 0,' +
//         '      maxScrollWidth = box[0].scrollWidth - (box[0].clientWidth / 2) - (box.width() / 2);' +
//         '' +
//         '  $(arrows).on(''click'', function() {' +
//         '      ' +
//         '    if ($(this).hasClass("arrow-next")) {' +
//         '      x = ((box.width() / 2)) + box.scrollLeft() - 10;' +
//         '      box.animate({' +
//         '        scrollLeft: x,' +
//         '      })' +
//         '    } else {' +
//         '      x = ((box.width() / 2)) - box.scrollLeft() -10;' +
//         '      box.animate({' +
//         '        scrollLeft: -x,' +
//         '      })' +
//         '    }' +
//         '      ' +
//         '  });' +
//         '    ' +
//         '  $(box).on({' +
//         '    mousemove: function(e) {' +
//         '      var mx2 = e.pageX - this.offsetLeft;' +
//         '      if(mx) this.scrollLeft = this.sx + mx - mx2;' +
//         '    },' +
//         '    mousedown: function(e) {' +
//         '      this.sx = this.scrollLeft;' +
//         '      mx = e.pageX - this.offsetLeft;' +
//         '    },' +
//         '    scroll: function() {' +
//         '      toggleArrows();' +
//         '    }' +
//         '  });' +
//         '' +
//         '  $(document).on("mouseup", function(){' +
//         '    mx = 0;' +
//         '  });' +
//         '  ' +
//         '  function toggleArrows() {' +
//         '    if(box.scrollLeft() > maxScrollWidth - 10) {' +
////         '        // disable next button when right end has reached ' +
//         '        nextArrow.addClass(''disabled'');' +
//         '      } else if(box.scrollLeft() < 10) {' +
////         '        // disable prev button when left end has reached ' +
//         '        prevArrow.addClass(''disabled'')' +
//         '      } else{' +
////         '        // both are enabled' +
//         '        nextArrow.removeClass(''disabled'');' +
//         '        prevArrow.removeClass(''disabled'');' +
//         '      }' +
//         '  }' +
//         '  ' +
//         '});' +
//         '</script>' ;



   //  dm_rc.rc_ShowMessage( htmlCarousel.HTML.Text );

     Self.Color  := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );

     iSlides     := 1;
     iSlideCount := 3;

     //hfChat.HTML.Clear;

     //dm_rc.rc_ShowSweetAlert( 'RadCORE' , 'Do More. Better and Fast!' , 'info' );

     //if mm.CONFIG_LANGUAGE = 'pt_BR' then
     //   btnLink.Hint := rc_SetHintAttr( 'https://radcore.pro.br/web/atualizacoes/' , 'link:', btnLink.Hint )
     //else
     //   btnLink.Hint := rc_SetHintAttr( 'https://radcore.pro.br/web/updates/' , 'link:', btnLink.Hint );

     // para frames, não precisa efetuar o ResizeBlocks
     rc_RenderLayout( Self, false, false );
end;

procedure TfrmDEMO_CAROUSEL_1.UniFrameReady(Sender: TObject);
begin
     // adjust edit masks
     dm_rc.rc_ApplyEditMasks( Self );

     mm.varDW_LastTick := GetTickCount;
     // ShowMessage(  'Tempo( sem RDW ): ' + FloatToStr( GetTickCount - mm.varDW_LastTick ) );
     dm_rc.rc_ResizeBlocks( Self, true, true );
     //ShowMessageN(  'Tempo( StringReplace default ): ' + FloatToStr( GetTickCount - mm.varDW_LastTick ) );
     // in development
     rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );
end;

initialization
  RegisterClass(TfrmDEMO_CAROUSEL_1);

end.
