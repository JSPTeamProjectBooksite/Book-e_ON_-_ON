const hero = document.querySelector('.hero');
const slider = document.querySelector('.slider');
const slider2 = document.querySelector('.slider2');
const logo = document.querySelector('#logo');
const hamburger = document.querySelector('.hamburger');
const headline = document.querySelector('.headline');
const listPageBtn = document.querySelector('#listPageBtn');

const tl = new TimelineMax();

tl.fromTo(
    hero, //변화를 줄 id 이름
    1, //변화를 할 시간(초)
    {height: "0%"}, //처음 상태
    {height: "80%", ease: Power2.easeInOut }    //변화 후 상태
    //정리하면, 길이가 0%에서 80%까지 1초에 걸려 늘어나는 효과를 출력한다.
).fromTo(
    hero, 
    1.2, 
    {width: "100%"},
    {width: "80%", ease: Power2.easeInOut }
)
.fromTo(
    slider,
    1.2,
    {y: "-100%"},
    {y: "0%", ease: Power2.easeInOut},
    "-=1.2"
    //각 이미지 효과은 위에서 부터 1, 1.2, 1,2 초 동안 차례대로 진행되는데,
    //이 -=1.2로 슬라이더 효과의 시작시간을 줄였다.
    //이 슬라이더 효과는 2번째 효과와 동시에 일어나게된다.
)
.fromTo(
    logo,
    0.5,
    {opacity: 0, x: 30 }, //
    {opacity: 1, x: 0 },
    "-=0.5"
)
.fromTo(
    hamburger,
    0.5,
    {opacity: 0, x: 30 }, //
    {opacity: 1, x: 0 },
    "-=0.5"
)
.fromTo(
    headline,
    0.5,
    {opacity: 0, x: 30 }, //
    {opacity: 1, x: 0 },
    "-=0.5"
)
.fromTo(
    listPageBtn,
    1,
    {opacity: 0, x: -30 }, //
    {opacity: 1, x: 0 }
)

const tl2 = new TimelineMax();

function clickListPage(){

    tl2.clear()

    tl2.set(slider,{y:"0%"}).set(slider2, {y:"-100%",opacity: 0})
    
    tl2
    .fromTo(
        slider,
        1.5,
        {y: "0%"},
        {y: "100%"}
    ).fromTo(
        slider2,
        1.5,
        {y: "-100%", opacity: 1},
        {y: "0%"},
        "-=1.5"
    )
    tl2.set(slider,{y:"0%"}).set(slider2, {y:"-100%", opacity: 0, onComplete: goList})
}

function goList(){
    location.href="/main";
}

const intro = document.querySelector('.intro');
const video = intro.querySelector('video');
const text1 = document.querySelector('#text1');
const text2 = document.querySelector('#text2');
const text3 = document.querySelector('#text3');
const text4 = document.querySelector('#text4');
const text5 = document.querySelector('#text5');
const text6 = document.querySelector('#text6');
const text7 = document.querySelector('#text7');
//END SECTION
const section = document.querySelector('section');
const end = section.querySelector('h1');


//Text Animation
// const textAnim = TweenMax.fromTo(text1, 3, {opacity: 1},{opacity: 0});

//SCROLLMAGIC
const controller = new ScrollMagic.Controller();

const textAnimation = new TimelineMax()
.fromTo(text1, 2, {opacity: 1}, {opacity: 0})
.fromTo(text2, 1, {opacity: 0}, {opacity: 0.7})
.to(text2, 1, {opacity: 0}, "+=1")
.fromTo(text3, 1, {opacity: 0}, {opacity: 0.7})
.to(text3, 1, {opacity: 0}, "+=1")
.fromTo(text4, 1, {opacity: 0}, {opacity: 0.7})
.to(text4, 1, {opacity: 0}, "+=1")
.fromTo(text5, 1, {opacity: 0}, {opacity: 0.7})
.to(text5, 1, {opacity: 0}, "+=1")
.fromTo(text6, 1, {opacity: 0}, {opacity: 0.7})
.fromTo(text7, 2, {opacity: 0}, {opacity: 1}, "+=1")

//Scenes
let scene = new ScrollMagic.Scene({
    duration: 18000,
    triggerElement: intro,
    triggerHook: 0
})
.addIndicators()
.setPin(intro)
.addTo(controller);


let scene2 = new ScrollMagic.Scene({
    duration: 18000, // 시간
    triggerElement: intro,
    triggerHook: 0
})
.addIndicators()
.setTween(textAnimation)
.addTo(controller);
// .setTween(textAnim)


//Video Animation
let accelamount = 0.1;
let scrollpos = 0;
let wh = window.innerHeight;
let delay = 0;

scene.on("update", e => {
    scrollpos = (e.scrollPos - wh) / 1000;
});

setInterval(() => {
    delay += (scrollpos - delay) * accelamount/(1 + accelamount);
    // delay += (scrollpos - delay) * accelamount;
    console.log(scrollpos, delay);
    
    // video.currentTime = scrollpos;
    if (delay > 0){
        video.currentTime = delay;
    }
}, 41.6);

