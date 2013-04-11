(function($){
  $(function(){
    $("form#new_zecret").submit(function() {
      var plaintext = $("textarea.zecret-input").val();
      var password = $("input.password").val();
      var encrypted = CryptoJS.AES.encrypt(plaintext, password).toString();
      $("input#zecret_body").val(encrypted);
      return true;
    });

    $("button.randomize").click(function() {
      $("input.password").val(randStr());
    });

    $("button.decrypt").click(function() {
      debugger;
      var encrypted = $.trim($(".zecret-hidden").text());
      var key = $("input.password").val();

      //TODO: THIS IS BLOWING UP WHEN CALLING toString ON RESULT OF USING WRONG KEY...
      var decrypted = CryptoJS.AES.decrypt(encrypted, key).toString(CryptoJS.enc.Utf8);
      
      if (!decrypted) {
        decrypted = "Wrong password.  Try Again.";
      }

      $(".zecret-display pre").html(decrypted);
    });
  });

  function randStr() {
    var chars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var charsMaxIndex = chars.length - 1;
    var strLen = Math.round(Math.random() * 32) + 32;
    var now = Date.now();
    var result = "";

    for (var i = strLen; i > 0; --i) {
      var randMantissa = (now * Math.random()) % 1;
      var randIndex = Math.round(randMantissa * (charsMaxIndex));
      result += chars[randIndex];
    }

    return result;
  }

})(jQuery);
