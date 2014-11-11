<%@ page contentType="text/html; charset=utf-8"%>

	<div class="header">
		<div class="wrap">
			<div class="logo">
				<a href="main?cmd=INDEX"><img src="images/logo.png" title="pinbal" /></a>
			</div>
			<div class="top-searchbar">
				<form>
					<input type="text" /><input type="submit" value="" />
				</form>
			</div>
			<div class="nav-icon">
				<a href="#" class="right_bt" id="activator"><span> </span> </a>
			</div>
			<div class="box" id="box">
				<div class="box_content">
					<div class="box_content_center">
						<div class="form_content">
							<div class="menu_box_list">
								<ul>
									<li><a href="main?cmd=INDEX"><span>home</span></a></li>
									<li><a href="#"><span>Friends</span></a></li>
									<li><a href="#"><span>MyFeed</span></a></li>
								</ul>
									<div class="clear"></div>
							</div>
							<a class="boxclose" id="boxclose"> <span> </span></a>
						</div>
					</div>
				</div>
			</div>
			<div class="userinfo">
				<div class="user">
					<ul>
						<li><a href="javascript:fnLogin()"><img src="images/user-pic.png"
								title="user-name" /><span>Login</span></a></li>
						<li><span>&nbsp;|</span></li>
						<li><a href="main?cmd=JOIN"><span>JoinUs</span></a></li>
					</ul>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!----start-dropdown--->
<script type="text/javascript">
			var $ = jQuery.noConflict();
				$(function() {
					$('#activator').click(function(){
						$('#box').animate({'top':'0px'},500);
					});
					$('#boxclose').click(function(){
					$('#box').animate({'top':'-700px'},500);
					});
				});
				$(document).ready(function(){
				//Hide (Collapse) the toggle containers on load
				$(".toggle_container").hide(); 
				//Switch the "Open" and "Close" state per click then slide up/down (depending on open/close state)
				$(".trigger").click(function(){
					$(this).toggleClass("active").next().slideToggle("slow");
						return false; //Prevent the browser jump to the link anchor
				});
			});
<!----//End-dropdown--->
<!-- //Start-login page -->
	function fnLogin(){
		window.open("main?cmd=LOGIN", "",	"width=520, height=320");
	}
<!-- //End-login page -->
	</script>
