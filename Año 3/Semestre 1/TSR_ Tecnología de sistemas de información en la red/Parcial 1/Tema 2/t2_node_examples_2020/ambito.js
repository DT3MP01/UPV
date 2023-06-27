/***************************************************
// ambito.js
// 2.4.2 JS. Ámbito variables
// transparencia 14 del tema 2. 
***************************************************/

function alert(x) { console.log(x) }
var global = 'This is global'

function scopeFunction() {
   alsoGlobal = 'This is also global!'
   var notGlobal = 'This is private to scopeFunction!'

   function subFunction() {
      alert(notGlobal) 	// We can still access notGlobal in this child function.
      stillGlobal = 'No let keyword so this is global!'
      var isPrivate = 'This is private to subFunction!'
   }

   // alert(stillGlobal)	// This is an error since we haven't executed subfunction
   subFunction()	   	// Execute subfunction 
   alert(stillGlobal) 	// This will output 'No let keyword so this is global!’
   // alert(isPrivate) 	// It generates an error since isPrivate is private to subfunction()
   alert(global)	    // It outputs: 'this is global’
}

alert(global)       // It outputs: 'This is global‘
// alert(alsoGlobal) 	// It generates an error since we haven't run scopeFunction yet.
scopeFunction()
alert(alsoGlobal) 	// It outputs: 'This is also global!';
// alert(notGlobal) 	// This generates an error.
// subFunction()       // This also generates an error.