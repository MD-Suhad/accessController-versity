// Initialize Firebase

// Restricts input for each element in the set of matched elements to the given inputFilter.
(function ($) {
    $.fn.inputFilter = function (inputFilter) {
        return this.on("input keydown keyup mousedown mouseup select contextmenu drop", function () {
            if (inputFilter(this.value)) {
                this.oldValue = this.value;
                this.oldSelectionStart = this.selectionStart;
                this.oldSelectionEnd = this.selectionEnd;
            } else if (this.hasOwnProperty("oldValue")) {
                this.value = this.oldValue;
                this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
            }
        });
    };
}(jQuery));

setTimeout(function() {


    var apiKey = $("#apikey").val();

    var config = {
        apiKey: apiKey,
        authDomain: $("#authDomain").val(),
        databaseURL: $("#databaseURL").val(),
        projectId: $("#projectId").val(),
        storageBucket: $("#storageBucket").val(),
        messagingSenderId: $("#messagingSenderId").val(),
    };

    firebase.initializeApp(config);







    window.recaptchaVerifier = new firebase.auth.RecaptchaVerifier('phoneEnter', {
        'size': 'invisible',
        'callback': function (response) {
            // reCAPTCHA solved, allow signInWithPhoneNumber.
            console.log("Captcha callback")
            onSignInSubmit();
        }
    });

    recaptchaVerifier.render().then(function (widgetId) {
        window.recaptchaWidgetId = widgetId;
    });

    var actionCodeSettings = {
        // URL you want to redirect back to. The domain (www.example.com) for this
        // URL must be whitelisted in the Firebase Console.
        url: 'localhost:3523',
        // This must be true.
        handleCodeInApp: true
    };

}, 500);



