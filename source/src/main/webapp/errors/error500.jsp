<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.1.min.js'/>"></script>
<title>Insert title here</title>

<style type="text/css">
body {
  background-color: #4E73DF;
  width: 100vw;
  height: 100vh;
  color: white;
  font-family: 'Arial Black';
  text-align: center;
  display: flex;
  justify-content: center;
  align-items: center; }

.error-num {
  font-size: 8em; }

.eye {
  background: #fff;
  border-radius: 50%;
  display: inline-block;
  height: 100px;
  position: relative;
  width: 100px; }
  .eye::after {
    background: #000;
    border-radius: 50%;
    bottom: 56.1px;
    content: '';
    height: 33px;
    position: absolute;
    right: 33px;
    width: 33px; }

p {
  margin-bottom: 4em; }

a {
  color: white;
  text-decoration: none;
  text-transform: uppercase; }
  a:hover {
    color: lightgray; }
</style>
</head>
<body>

	<div>
	  <span class='error-num'>5</span>
	  <div class='eye'></div>
	  <div class='eye'></div>
	  <pre>
			<%
				ErrorData ed = pageContext.getErrorData();
				out.println(ed.getStatusCode());
				out.println(ed.getRequestURI());
				out.println(ed.getThrowable());
			%>
		</pre>
	</div>
</body>

<script type="text/javascript">
$('body').mousemove(function(event) {
	  var e = $('.eye');
	  var x = (e.offset().left) + (e.width() / 2);
	  var y = (e.offset().top) + (e.height() / 2);
	  var rad = Math.atan2(event.pageX - x, event.pageY - y);
	  var rot = (rad * (180 / Math.PI) * -1) + 180;
	  e.css({
	    '-webkit-transform': 'rotate(' + rot + 'deg)',
	    'transform': 'rotate(' + rot + 'deg)'
	 });
});
</script>





</html>