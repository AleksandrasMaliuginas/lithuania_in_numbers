"use strict";

/**
  number int (23456789)
  Returns: string (23 456 789)
*/
function splitInt(number) {
  var string = String(number),
      index = 0;
  for(var i = string.length; i >= 0; i--) {
    if(index % 3 === 0) {
      string = [string.slice(0, i), " ", string.slice(i)].join('');
    }
    index++;
  }

  return string;
}
