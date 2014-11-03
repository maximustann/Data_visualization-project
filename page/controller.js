function controller()
{
this.setup = function()
{
$("#myHome").addClass("active");
$("#content").load("home.html");
}
this.home = function()
{
$("#home").addClass("active");
$("#team").removeClass("active");
$("#content").load("home.html");
}

this.team = function()
{
$("#team").addClass("active");
$("#home").removeClass("active");
$("#content").load("team.html");
}

} 
