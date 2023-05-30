
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

function onSignInSubmit(phoneNumber, flag) {

    // var phoneNumber = "+88" + getValue('#txtbxloginId');
    var appVerifier = window.recaptchaVerifier;
    //  console.log("Entered")
    firebase.auth().signInWithPhoneNumber(phoneNumber, appVerifier)
        .then(function (confirmationResult) {

            window.confirmationResult = confirmationResult;

            if (!flag) {

                showBox("#code-box");
            }

            setTimeout(function () {

                setCountDown();
            }, 200)
            console.log("Confirm___", confirmationResult)
        }).catch(function (error) {
            recaptchaVerifier.reset(window.recaptchaWidgetId);

            console.log("Error___", error)
        });

}


function setCountDown() {

    $("#resend").hide();
    $("#countdown").show(0);

    document.getElementById("countdown").innerHTML = "1:00";
    var timer;
    var count = 60;
    //  console.log("Hellow Counter", $("#countdown"), $("#resend"));
    //setTimeout(function() {

    //    $("#resend").show(0);


    //        $("#countdown").hide();
    //    },
    //    count * 1000);

    timer = setInterval(function () {

        if (count === 0) {
            clearInterval(timer);
            $("#resend").show(0);


            $("#countdown").hide();
        }
        count--;

        if (count >= 0) {
            document.getElementById("countdown").innerHTML = count + " seconds left to resend";
        }

        console.log("Count down")

    },
        1000);
}

function confirm(code) {

    confirmationResult.confirm(code).then(function (result) {
        // User signed in successfully.
        var user = result.user;
        console.log("Successful___", user);

        showPassbox();

        // ...
    }).catch(function (error) {
        // User couldn't sign in (bad verification code?)
        // ...

        errorAlert("Wrong Code. Try Again");
    })
}

$(document).ready(function () {

    //$("#user").inputFilter(function (value) {
    //    alert("Hellow")
    //    return /^\d*$/.test(value);

    //});


    var input = document.querySelector("#user");
    var iti = window.intlTelInput(input, {
        geoIpLookup: function (success, failure) {
            $.ajax({
                url: "login.aspx/GetCountry",

                method: "POST",
                contentType: "application/json; charset=utf-8"
            })
                .done(function (response) {

                    response = JSON.parse(response.d);
                    var code = response.country_code;
                    success(code);
                });
        },
        initialCountry: "auto",

        utilsScript: "Scripts/utils.js",
    });


    $.ajax({
        type: "POST",
        url: "login.aspx/GetCountryList",
        contentType: "application/json; charset=utf-8"
    })
        .done(function (response) {

            var dropdown = $("#filterCountry");

            var list = JSON.parse(response.d);

            if (list.countries) {

                $.each(list.countries, function (k, value) {

                    dropdown.append('<option value="' + value.CountryCode + '">' + value.CountryCode + '</option>');
                });
            }
        });

    $(".verify").on("click", function (e) {
        e.preventDefault();

        var mail = $(this).attr('data-mail');
        var phone;

        if (mail) {
            phone = $("#user-mail").val();

        } else {
            phone = iti.getNumber();
            //console.log(phone);
            var temp = phone.replace("+", "");

            if (!/^\d*$/.test(temp)) {

                errorAlert("Invalid Phone Number ");
                return;
            }
        }


        $("#userId").val(phone);
        $.ajax({
            type: "POST",
            url: "login.aspx/CheckPhoneNumber",
            contentType: "application/json; charset=utf-8",
            datatype: "json",
            data: JSON.stringify({ phone: phone }),
        })
            .done(function (response) {
                response = JSON.parse(response.d);

                if (response.verifed) {
                    showPassword();
                    return;
                }

                if (response.status) {

                    if (!mail) {

                        onSignInSubmit(phone);
                        showCodeBox();
                    } else {
                        sendEmail()
                    }

                } else {
                    errorAlert("Phone or Email Number Does not Exists");
                }

            })
            .fail(function () {
                errorAlert("Something Gone Wrong");
            });

    })


    $("#codebtn").on("click", function (e) {

        // var button = $(this);
        e.preventDefault();
        var code = $("#confirmCode").val();

        if (code === '' || !code) {
            errorAlert("Invalid Code");

        }

        confirm(code);

    })

    $("#passchange").on("click", function (e) {

        e.preventDefault();

        var newPass = $("#user-password").val();

        var confirmPass = $("#user-con-password").val();

        var phoneNumber = $("#userId").val();

        var checkPassRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$/;

        if (!checkPassRegex.test(newPass)) {
            //console.log([newPass,confirmPass])
            errorAlert("Password must be Min. 8 characters with min. 1 digit and 1 charecter. Max Password length 20");
            return;
        }

        if (newPass !== confirmPass) {
            errorAlert("Password doesnot match");
            return;
        }


        $.ajax({
            type: "POST",
            url: "login.aspx/ChangePass",
            contentType: "application/json; charset=utf-8",
            datatype: "json",
            data: JSON.stringify({ newPass: newPass, confirmPass: confirmPass, phoneNumber: phoneNumber }),

        })
            .done(function (response) {

                response = JSON.parse(response.d);

                if (response.status) {

                    showPinBox();
                    $("#passStore").val(newPass)
                    successAlert("Password changed");
                } else {
                    errorAlert("Something Gone wrong")

                }
            })
            .fail(function () {

                errorAlert("Something Gone wrong")

            });
    })


    $("#pinChange").on("click", function (e) {

        e.preventDefault();


        var newPin = $("#user-pin").val();

        var confirmPin = $("#user-con-pin").val();
        var phoneNumber = $("#userId").val();


        var pinTest = /^(?!(.)\1{3})(?!19|20)\d{4,8}$/;

        if (!pinTest.test(newPin)) {

            errorAlert("PIN length must be 4-8 and Input only Digit 0-9.");
            return;
        }

        if (newPin !== confirmPin) {
            errorAlert("PIN does not match");
            return;
        }


        $.ajax({
            type: "POST",
            url: "login.aspx/ChangePin",
            contentType: "application/json; charset=utf-8",
            datatype: "json",
            data: JSON.stringify({ newPin: newPin, confirmPin: confirmPin, phoneNumber: phoneNumber }),

        })
            .done(function (response) {

                response = JSON.parse(response.d);

                if (response.status) {
                    var phone = $("#userId").val();
                    var pass = $("#passStore").val();

                    performLogin({ loginId: phone, password: pass });
                } else {
                    errorAlert(response.message)

                }
            })
            .fail(function () {

                errorAlert("Something Gone wrong")

            });

    })

    $("#resend").on("click",
        function (e) {

            e.preventDefault();

            var phone = $("#userId").val();

            onSignInSubmit(phone, true);

        });

    $("#btnEmail").on("click",
        function (e) {


            e.preventDefault();

            var email = $("#emailEnter").val();

            console.log(email);


            $.ajax({
                type: "POST",
                url: "login.aspx/CheckEmail",
                contentType: "application/json; charset=utf-8",
                datatype: "json",
                data: JSON.stringify({ email: email }),
            })
                .done(function (response) {
                    response = JSON.parse(response.d);

                    //if (response.verifed) {
                    //    errorAlert("Account is already verified");
                    //    return;
                    //}

                    if (response.status) {

                        firebase.auth()
                            .sendSignInLinkToEmail(
                                email,
                                {
                                    url: "http://localhost:3523/login.aspx?id=123",
                                    handleCodeInApp: true
                                }
                            );
                    } else {
                        errorAlert("Email Does not Exists");
                    }

                })
                .fail(function () {
                    errorAlert("Something Gone Wrong");
                });





        });

    $("#mobileLogin").on("click",
        function (e) {

            e.preventDefault();

            var phone = $("#userId").val();
            var pass = $("#pass").val();


            performLogin({ loginId: phone, password: pass });

        });



})

function signInEmail(email) {

    var key = sessionStorage.setItem(makeid(25));

    firebase.auth().signInWithEmailAndPassword(email, key)
        .then(function (authData) {

            sendEmail();
        })
        .catch(function (error) {

            errorAlert("Something gone wrong");

        });
}

function sendEmail() {

    $.ajax({
        type: "POST",
        url: "login.aspx/GetToken",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify({ phone: $("#userId").val() })
    })
        .done(function (response) {

            response = JSON.parse(response.d);

            sessionStorage.setItem("userId", $("#userId").val());

            var url = "http://localhost:8000/login.aspx?id=" + $("#userId").val() + "&code=" + response.token;


            if (response.status) {

                firebase.auth()
                    .sendSignInLinkToEmail(
                        $("#userId").val(),
                        {
                            url: url,
                            handleCodeInApp: true
                        }
                    )
                    .then(function (authData) {
                        window.location.replace("/");

                    })
                    .catch(function (error) {
                    });

            } else {

                errorAlert("Something Gone Wrong")
            }
        });


}

function makeid(length) {
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for (var i = 0; i < length; i++)
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    return text;
}

function showBox(id) {
    $('#login_box').hide();
    $('#code-box').hide();
    $('#forgot-box').hide();
    $('#verify-box').hide();
    $('#passchange-box').hide();
    $('#pin-box').hide();
    $(id).show(600);
    $("#txtbxloginId").val("")
    $('#txtbxEmailAddToReset').val("");
}


function showPassword() {

    var tab_id = "passwordInput";
    $('ul.login-tabs').addClass('invisible');

    $('ul.pass-tab').removeClass('invisible');
    $('ul.pass-tab').addClass('visible');

    $('.form-content').removeClass('current');

    $('#passwordInput').addClass('current');
}

function showCodeBox() {

    var tab_id = "passwordInput";
    $('ul.login-tabs').addClass('invisible');

    $('ul.code-tab').removeClass('invisible');
    $('ul.code-tab').addClass('visible');

    $('.form-content').removeClass('current');

    $('#codeInput').addClass('current');
}

function showPassbox() {

    $('ul.code-tab').addClass('invisible');
    $('ul.login-tabs').addClass('invisible');

    $('ul.passChange-tab').removeClass('invisible');
    $('ul.passChange-tab').addClass('visible');

    $('.form-content').removeClass('current');

    $('#passwordChangeModal').addClass('current');
}

function showPinBox() {

    $('ul.passChange-tab').addClass('invisible');
    $('ul.login-tabs').addClass('invisible');
    $('ul.code-tab').addClass('invisible');

    $('ul.pin-tab').removeClass('invisible');
    $('ul.pin-tab').addClass('visible');

    $('.form-content').removeClass('current');

    $('#pinBox').addClass('current');
}

function performLogin(data) {


    $.ajax({
        url: "login.aspx/login",
        contentType: "application/json; charset=utf-8",
        type: "POST",
        data: JSON.stringify(data)
    })
        .done(function (response) {

            response = JSON.parse(response.d);

            if (response.status) {

                window.location.replace("/");

                //console.log(extractHostname(window.location.href))
            }
        })
        .fail();

}

function extractHostname(url) {
    var hostname;
    //find & remove protocol (http, ftp, etc.) and get hostname

    if (url.indexOf("//") > -1) {
        hostname = url.split('/')[2];
    }
    else {
        hostname = url.split('/')[0];
    }

    //find & remove port number
    // hostname = hostname.split(':')[0];
    //find & remove "?"
    hostname = hostname.split('?')[0];

    return hostname;
}


document.addEventListener('DOMContentLoaded', function () {

    var mode = getParameterByName('mode');

    var actionCode = getParameterByName('oobCode');

    var apiKey = getParameterByName('apiKey');

    var continueUrl = getParameterByName('continueUrl');

    var token = getParameterByName('code');

    var mail = getParameterByName('id'); //sessionStorage.getItem("id") 

    var lang = getParameterByName('lang') || 'en';

    // console.log(mail, token);

    if (!mail && !token) {
        return;
    }

    $.ajax({
        url: "login.aspx/CheckToken",
        contentType: "application/json; charset=utf-8",
        type: "POST",
        data: JSON.stringify({ phone: mail, token: token })
    })
        .done(function (response) {

            response = JSON.parse(response.d);

            if (response.status) {

                // console.log(response.phone);

                $("#userId").val(response.phone);

                showPassbox();
            }

        });


}, false);

function getParameterByName(key) {

    var urlParams = new URLSearchParams(window.location.search);
    var myParam = urlParams.get(key);

    return myParam;
}
function handleVerifyEmail(auth, actionCode, continueUrl, lang) {

    firebase.auth().applyActionCode(actionCode).then(function (resp) {


        successAlert("Checked");


    }).catch(function (error) {
        successAlert("Checked");

    });
}