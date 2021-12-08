<%@page import="java.sql.SQLException"%>
<%@page import="com.mangoMusic.soundtrack.model.SoundTrackVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mangoMusic.soundtrack.model.SoundTrackDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%

	SoundTrackDAO dao= new SoundTrackDAO();
	
	//artist page
	//1
	//2
	List<SoundTrackVO> alist=null;
	try{
		alist=dao.selectArtist();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//맞춤선곡
	List<SoundTrackVO> sel12=null;
	try{
		sel12=dao.select12();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//top20
	List<SoundTrackVO> top20=null;
	try{
		top20=dao.selectTop20();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//장르
	List<SoundTrackVO> genre=null;
	try{
		genre=dao.genre();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
%>
<link rel="stylesheet" href="../css/bootstrap.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<script type="text/javascript" src="../css/bootstrap.css"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
<style type="text/css">
h2{
  text-align:center;
  padding: 20px;
}
/* Slider */

.slick-slide {
    margin: 0px 20px;
}

.slick-slide img {
    width: 220px;
    height: 220px;
}

.slick-slider
{
    position: relative;
    display: block;
    box-sizing: border-box;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
            user-select: none;
    -webkit-touch-callout: none;
    -khtml-user-select: none;
    -ms-touch-action: pan-y;
        touch-action: pan-y;
    -webkit-tap-highlight-color: transparent;
}

.slick-list
{
    position: relative;
    display: block;
    overflow: hidden;
    margin: 0;
    padding: 0;
}
.slick-list:focus
{
    outline: none;
}
.slick-list.dragging
{
    cursor: pointer;
    cursor: hand;
}

.slick-slider .slick-track,
.slick-slider .slick-list
{
    -webkit-transform: translate3d(0, 0, 0);
       -moz-transform: translate3d(0, 0, 0);
        -ms-transform: translate3d(0, 0, 0);
         -o-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
}

.slick-track
{
    position: relative;
    top: 0;
    left: 0;
    display: block;
}
.slick-track:before,
.slick-track:after
{
    display: table;
    content: '';
}
.slick-track:after
{
    clear: both;
}
.slick-loading .slick-track
{
    visibility: hidden;
}

.slick-slide
{
    display: none;
    float: left;
    height: 100%;
    min-height: 1px;
}
[dir='rtl'] .slick-slide
{
    float: right;
}
.slick-slide img
{
    display: block;
}
.slick-slide.slick-loading img
{
    display: none;
}
.slick-slide.dragging img
{
    pointer-events: none;
}
.slick-initialized .slick-slide
{
    display: block;
}
.slick-loading .slick-slide
{
    visibility: hidden;
}
.slick-vertical .slick-slide
{
    display: block;
    height: auto;
    border: 1px solid transparent;
}
.slick-arrow.slick-hidden {
    display: none;
}

img{
	width: 230px;
	height: 230px;
	margin-left: 10px;
}

.container {
    max-width: 1540px;
}

header{
	position: relative;
	width: 100%;
	height: 60px;
	background: #ffbc50;
}
#customized{
	text-align: center;
}
#customized img{
	margin-left: 40px;
	margin-top:2px;
	width: 50px;
	height: 50px;
}
#customized div{
	height: 60px;
	text-align: left;
}
section#main {
    margin-left: 180px;
    margin-right: 180px;
}
.artist3{
	margin-top: 30px;
	position: absolute;
}
.alname{
	margin-top: 30px;
	margin-left: 150px;
	position: absolute;
	width: 180px;
}
.musicname{
	margin-top: 2px;
	position: absolute;
	font-weight: bold;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
    $('.customer-logos').slick({
        slidesToShow: 6,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 1500,
        arrows: false,
        dots: false,
        pauseOnHover: false,
        responsive: [{
            breakpoint: 768,
            settings: {
                slidesToShow: 4
            }
        }, {
            breakpoint: 520,
            settings: {
                slidesToShow: 3
            }
        }]
    });
});
</script>
</head>
<body>
<header>
	<div class="left">MUSIC</div>
</header>
<section id="main">
<div class="container">
  <h2>artist record</h2>
   <section class="customer-logos slider">
   		<% for(int i=0; i<alist.size(); i++){ 
							SoundTrackVO vo=alist.get(i);%>
							
      		<div class="slide">
      			<a href='artistPage.jsp?arno=<%=vo.getArNo() %>'>
					<img src='../images/aimages/<%=vo.getArNo() %>.jpg'>
					<span class='artist2'><%=vo.getArName() %></span>
				</a>
      		</div>
      	 <%} %>
   </section>
</div>   
<br>
<h2>맞춤 선곡</h2>
	<div class='row' id='customized' >
		<% for(int i=0; i<12; i++){ 
				SoundTrackVO vo=sel12.get(i);
		%>
		<div class="col-md-4 col-sm-6">
			<a href="playList.jsp?sno=<%=vo.getsNo() %>">
			<img src='../images/<%=vo.getAlNo() %>.jpg'>
			<span class='musicname'><%=vo.getTitle() %></span>
			<span class='artist3'><%=vo.getArName() %></span><span class='alname'><%=vo.getAlName() %></span>
			</a>
		</div>
		<%} %>
	</div>
<br>
<div class="container">
  <h2>TOP 20</h2>
   <section class="customer-logos slider">
   		<% for(int i=0; i<top20.size(); i++){ 
   				SoundTrackVO vo=top20.get(i);%>
							
      		<div class="slide">
      			<a href="playList.jsp?sno=<%=vo.getsNo() %>">
					<img src='../images/alimages/<%=vo.getAlNo() %>.jpg'>
					<span class='musicname2'><%=vo.getTitle() %></span><br>
					<span class='alname2'><%=vo.getAlName() %></span> • <span class='artist2'><%=vo.getArName() %></span>
				</a>
      		</div>
      	 <%} %>
   </section>
</div>   
<br>
<h2>장르별 선곡</h2>
	<div class='row' id='genre'>
		<% for(int i=0; i<6; i++){
			SoundTrackVO vo=genre.get(i);
			%>
			
			<div class="col-lg-2 col-sm-6" id='art1'>
				<a href='genrePage.jsp?geno=<%=vo.getGeNo() %>'>
				<img src='../images/gimages/<%=vo.getGeNo() %>.png'>
				<div>
				<span class='artist2'><%=vo.getGeName() %></span>&nbsp;&nbsp;
				</div>
				</a>
			</div>
		<%} %>
	</div>  
</section>

</body>
</html>