// Filename:  polyFill.js
// Author:    Sean Skiver
// Written:   6/30/2016
/* 
Description:
  Attaches a Prototypal String.includes function. 
  This is for IE users, since String.contains doesn't 
  work in IE
*/
//-------------------------------------------------



// String includes()
if (!String.prototype.includes) {
  String.prototype.includes = function(search, start) {
    'use strict';
    if (typeof start !== 'number') {
      start = 0;
    }
    
    if (start + search.length > this.length) {
      return false;
    } else {
      return this.indexOf(search, start) !== -1;
    }
  };
}