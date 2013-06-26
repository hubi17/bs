function regexbuddyhighlight(regexoffset) {
  document.getElementById("regex" + regexoffset).style.background = "#FFFF00";
  document.getElementById("tree" + regexoffset).style.background = "#FFFF00";
  document.getElementById("tree" + regexoffset).style.color = "#000000";
}
function regexbuddyclear(regexoffset) {
  document.getElementById("regex" + regexoffset).style.background = "white";
  document.getElementById("tree" + regexoffset).style.background = "white";
  document.getElementById("tree" + regexoffset).style.color = "#0000FF";
}
function regexbuddyhighlightdup(regexoffset) {
  document.getElementById("regex" + regexoffset).style.background = "#FFFF00";
  document.getElementById("tree" + regexoffset + "dup").style.background = "#FFFF00";
  document.getElementById("tree" + regexoffset + "dup").style.color = "#000000";
}
function regexbuddycleardup(regexoffset) {
  document.getElementById("regex" + regexoffset).style.background = "white";
  document.getElementById("tree" + regexoffset + "dup").style.background = "white";
  document.getElementById("tree" + regexoffset + "dup").style.color = "#0000FF";
}