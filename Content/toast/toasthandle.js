function information(message) {
    $.toast({
        heading: 'Information',
        text: message,
        icon: 'info',
        loader: true,        // Change it to false to disable loader
        position: 'top-center',
        loaderBg: '#9EC600',
        hideAfter: 7000
    })

}
function errorAlert(msg) {
    $.toast({
        heading: 'Error',
        text: msg,
        showHideTransition: 'slide',
        icon: 'error',
        position: {
            right: 50,
            top: 100
        },
        stack: 4,
        loader: true,
        loaderBg: '#f56954',
        hideAfter: 7000
    });

}

function successAlert(msg) {
    $.toast({
        heading: 'Success',
        text: msg,
        showHideTransition: 'slide',
        icon: 'success',
        position: {
            right: 50,
            top: 100
        },
        stack: 4,
        loader: true,
        loaderBg: '#00a65a',
        hideAfter: 7000
    });

}
function warningAlert(msg) {
    $.toast({
        heading: 'Warning',
        text: msg,
        showHideTransition: 'slide',
        icon: 'warning',
        position: {
            right: 50,
            top: 100
        },
        stack: 4,
        loader: true,
        loaderBg: '#f7f00d',
        bgColor: '#db8b0b',
        hideAfter: 7000
    });

}
function infoAlert(msg){
    $.toast({
        heading: 'Information',
        text: msg,
        icon: 'info',
        loader: true,        // Change it to false to disable loader
        //position: 'top-center',
        position: {
            right: 50,
            top: 100
        },
        stack: 4,
        loaderBg: '#00c0ef',

        hideAfter: 7000
    });
       
}
function infoAlertFix(msg) {
    $.toast({
        heading: 'Information',
        text: msg,
        icon: 'info',
        loader: true,        // Change it to false to disable loader
        //position: 'top-center',
        position: {
            right: 50,
            top: 100
        },
        stack: 4,
        loaderBg: '#00c0ef',

        hideAfter: false
    })



}

function urlAlert(headerText,msg,icontype) {
    $.toast({
        heading: 'headerText',
        text: msg,
        icon: 'info',
        loader: true,        
        //position: 'top-center',
        position: {
            right: 50,
            top: 100
        },
        stack: 4,
        loaderBg: '#00c0ef' , // To change the background
        hideAfter: false,
    })



}

function customAlert(msg) {
    $.toast({
        heading: 'headerText',
        text: msg,
        icon: 'success',
        loader: true,
        //position: 'top-center',
        position: {
            right: 50,
            top: 100
        },
        stack: 4,
        loaderBg: '#00c0ef', // To change the background
        bgColor: '#FF1356',
        hideAfter: 7000
    })



}