<?php 
//ob_start(); // auf manchen Servern kann es erforderlich sein, diese Zeile zu entkommenieren
include("wdw_suche/search_config.php");
if (isset($_GET["q"]) && $_GET["q"] != "") {	
	$search_anzeige = stripslashes(htmlspecialchars($_GET["q"], ENT_COMPAT, "ISO-8859-1", false)); // PHP 5.4
} else {
	$search_anzeige = $value;
}


?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="de" xml:lang="de">

<head>
<!-- Codierung vom Browser erraten lassen: -->
<!-- <meta http-equiv="content-type" content="text/html; charset=ISO-8859-15" /> -->

<meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1" />
<meta name="description" content="Webdesign nach Ma&szlig; by webdesign weisshart" />
<meta name="Author" content="Dipl.Ing.(FH) F. Weisshart" />
<meta name="generator" content="notepad ;-)" />
<meta name="robots" content="all" /> 

<link rel="stylesheet" type="text/css" href="wdw_suche/wdw_suche.css" />

<script src="wdw_suche/wdw_suche.js" type="text/javascript"></script>

<title>Suchergebnisse</title>


<style>
html, body, div, p, h1, h2, h3, ul, ol, span, table, td, form, img, li, pre {
	margin:  0;
	padding: 0;
	border: 0;
	font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
}

body {
	-webkit-text-size-adjust:none;
	-webkit-hyphens:auto;-moz-hyphens:auto;-ms-hyphens:auto;hyphens:auto;
	font-size: 90.01%;
	margin: 1em;
	background: #fff;
}
h1 {
	font-size: 1.2em;
	line-height: 1.6em;
	margin: 1em 0;
	color: #111;
}

h3 {
	font-size: .9em;
	line-height: 1.6em;
	margin: 1.4em 0 0 0;
	color: #111;
}
</style>

</head>

<body>

<h1>Suchergebnisse</h1>

<div id="suchform">
	<form  id="search" method="get" action="<?php echo htmlentities($_SERVER['PHP_SELF']); ?>"   onsubmit="return showWait();">
		<p><label for="suchbegriff">Im Projekt suchen:</label><br />

<input type="text" name="q" id="suchbegriff" value="<?php echo $search_anzeige ?>" size="13" title=" Suchbegriff hier eingeben " onblur="if(this.value=='')this.value='<?php echo $search_anzeige ?>';" onfocus="if(this.value=='<?php echo $value ?>')this.value='';" />

		<input type="submit" value="Los !" />
		
            <!-- der Throbber (die Warten-Grafik) http://mentalized.net/activity-indicators/ -->
            <script type="text/javascript">
            // <![CDATA[
                  document.write ('<img id="wait" height="16" width="16" src="wdw_suche/throbber3.gif" alt="bitte warten" />');
            // ]]>
            </script>

		</p>
	</form>
</div>

<div id="output">
	<?php include("wdw_suche/search.php");?>
</div>




</body>
</html>
