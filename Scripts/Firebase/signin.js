
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




var iti = null;

function loadCounty() {
    // alert("Clicked");
    // console.log("Cliecked called in Js File");
    var input = document.querySelector("#txtbxLoginPhone");
    iti = window.intlTelInput(input, {
        geoIpLookup: function (success, failure) {
            $.ajax({
                url: "signin.aspx/GetCountry",

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
}





$(document).ready(function () {

    //var input = document.querySelector("#txtbxLoginPhone");
    //var iti = window.intlTelInput(input, {
    //    geoIpLookup: function (success, failure) {
    //        $.ajax({
    //            url: "signin.aspx/GetCountry",

    //            method: "POST",
    //            contentType: "application/json; charset=utf-8"
    //        })
    //            .done(function (response) {

    //                response = JSON.parse(response.d);
    //                var code = response.country_code;
    //                success(code);
    //            });
    //    },
    //    initialCountry: "auto",

    //    utilsScript: "Scripts/utils.js",
    //});




    //$.ajax({
    //    type: "POST",
    //    url: "login.aspx/GetCountryList",
    //    contentType: "application/json; charset=utf-8"
    //})
    //    .done(function (response) {

    //        var dropdown = $("#filterCountry");

    //        var list = JSON.parse(response.d);

    //        if (list.countries) {

    //            $.each(list.countries, function (k, value) {

    //                dropdown.append('<option value="' + value.CountryCode + '">' + value.CountryCode + '</option>');
    //            });
    //        }
    //    });

    //$(".verify1").on("click", function (e) {
    //    e.preventDefault();

    //    var mail = $(this).attr('data-mail');
    //    var phone;

    //    if (mail) {
    //        phone = $("#user-mail").val();

    //    } else {
    //        phone = iti.getNumber();

    //        var temp = phone.replace("+", "");

    //        if (!/^\d*$/.test(temp)) {

    //            errorAlert("Invalid Phone Number ");
    //            return;
    //        }
    //    }


    //    $("#userId").val(phone);
    //    $.ajax({
    //        type: "POST",
    //        url: "login.aspx/CheckPhoneNumber",
    //        contentType: "application/json; charset=utf-8",
    //        datatype: "json",
    //        data: JSON.stringify({ phone: phone }),
    //    })
    //        .done(function (response) {
    //            response = JSON.parse(response.d);

    //            if (response.verifed) {
    //                showPassword();
    //                return;
    //            }

    //            if (response.status) {

    //                if (!mail) {

    //                    onSignInSubmit(phone);
    //                    showCodeBox();
    //                } else {
    //                    sendEmail()
    //                }

    //            } else {
    //                errorAlert("Phone or Email Number Does not Exists");
    //            }

    //        })
    //        .fail(function () {
    //            errorAlert("Something Gone Wrong");
    //        });

    //})


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



});


