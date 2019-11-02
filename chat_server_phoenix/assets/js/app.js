// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"
console.log("gesdd")       // name of message sender
let btn = document.getElementById('loginBtn');


btn.addEventListener('click', function () {
  
  let pass = document.getElementById('pass');        // list of messages.
  let email = document.getElementById('email');   
  if (pass.value.length > 0 && email.value.length > 0) { // don't sent empty msg.
    const url = "http://localhost:4000/login";
    fetch(url, {
        method : "POST",
        body : JSON.stringify({
            email : email.value,
            pass : pass.value
         })
    }).then(function(html) {
      // Initialize the DOM parser
      var parser = new DOMParser();

      // Parse the text
      var doc = parser.parseFromString(html, "text/html");

      // You can now even select part of that html as you would in the regular DOM 
      // Example:
      // var docArticle = doc.querySelector('article').innerHTML;

      console.log(doc);
    });
}});  
