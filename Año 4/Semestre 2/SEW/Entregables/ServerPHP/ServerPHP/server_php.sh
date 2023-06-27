#!/usr/bin/env php
<?php
echo "HTTP/1.1 200 OK\r\nAccess-Control-Allow-Origin: *\r\n\r\n";
// Array with names
$a[] = "Anna";
$a[] = "Anita";
$a[] = "Brittany";
$a[] = "Cinderella";
$a[] = "Wenche";
$a[] = "Vicky";

$url  = trim(fgets(STDIN));

$componentes = parse_url($url);
parse_str($componentes['query'], $parameters);
$q = explode(" ", $parameters['q'])[0];
$hint = "";

// lookup all hints from array if $q is different from ""
if ($q !== "") {
	$q = strtolower($q);
	$len = strlen($q);
	foreach($a as $name) {

		if (stristr($q, substr($name, 0, $len))) {
			if ($hint === "") {
				$hint = $name;
			} else {
				$hint .= ", $name";
			}
		}
	}
}
// Output "no suggestion" if no hint was found or output correct values
echo $hint === "" ? "no suggestion" : $hint;
?>

