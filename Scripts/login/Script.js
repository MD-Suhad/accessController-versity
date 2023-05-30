$(document).ready(function () {
    $('ul.tabs li').click(function() {
        var tab_id = $(this).attr('data-tab');
        $('ul.tabs li').removeClass('current');
        $('.form-content').removeClass('current');
        $(this).addClass('current');
        $("#" + tab_id).addClass('current');
    });


    $('div.userbox a').click(function () {

     //   $(this).preventDefault();
        var tab_id = $(this).attr('data-tab');
        $('ul.login-tabs').addClass('invisible');
        $('ul.forgot-pass-tab').removeClass('invisible');
        $('ul.forgot-pass-tab').addClass('visible');
        $('.form-content').removeClass('current');
        $('ul.forgot-pass-tab li').addClass('current');
        $(this).addClass('current');
        $("#" + tab_id).addClass('current');
    });

    //verySection

    $('div.verySection a').click(function () {

        //   $(this).preventDefault();
        var tab_id = $(this).attr('data-tab');
        $('ul.login-tabs').addClass('invisible');

        $('ul.verify-tab').removeClass('invisible');
        $('ul.verify-tab').addClass('visible');

        $('.form-content').removeClass('current');

        $('ul.verify-tab li').addClass('current');
        $(this).addClass('current');
        $("#" + tab_id).addClass('current');
    });

});