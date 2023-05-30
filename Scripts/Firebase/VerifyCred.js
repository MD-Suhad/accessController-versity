window.recaptchaVerifier = new firebase.auth.RecaptchaVerifier('sign-in-button', {
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

function onSignInSubmit() {

    var phoneNumber = "+88"+getValue('#txtbxloginId');
    var appVerifier = window.recaptchaVerifier;
    console.log("Entered")
    firebase.auth().signInWithPhoneNumber(phoneNumber, appVerifier)
        .then(function (confirmationResult) {

            window.confirmationResult = confirmationResult;


            showBox("#forgot-box");
            console.log("Confirm___",confirmationResult)
        }).catch(function (error) {
            recaptchaVerifier.reset(window.recaptchaWidgetId);

            console.log("Error___",error)
        });

}

$("#lnkbtnFromRequest").on("click", function () {

    signIn();

})


function signIn() {

    var code = getValue("#txtbxEmailAddToReset");
    confirmationResult.confirm(code).then(function (result) {
        // User signed in successfully.
        var user = result.user;

        console.log("Successful___", user);
        // ...
    }).catch(function (error) {
        // User couldn't sign in (bad verification code?)
        // ...
    })
}

function getValue(id) {

    return $(id).val();
}


function showBox(id) {
    $('#login_box').hide();
    $('#forgot-box').hide();
    $(id).show(600);
    $("#txtbxloginId").val("")
    $('#txtbxEmailAddToReset').val("");

}