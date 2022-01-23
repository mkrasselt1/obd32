function check(form) {
    if (form.userid.value == 'admin' && form.pwd.value == 'admin') { window.open('/upload.html') }
    else { alert('Error Password or Username') }
};

function sub(obj) {
    var fileName = obj.value.split('\\\\');
    document.getElementById('file-input').innerHTML = '   ' + fileName[fileName.length - 1];
    console.log(fileName);
};
$(document).ready(function(){
    $('#upload_form').submit(function (e) {
        e.preventDefault();
        var form = $('#upload_form')[0];
        var data = new FormData(form);
        $.ajax({
            url: '/update',
            type: 'POST',
            data: data,
            contentType: false,
            processData: false,
            xhr: function () {
                var xhr = new window.XMLHttpRequest();
                xhr.upload.addEventListener('progress', function (evt) {
                    if (evt.lengthComputable) {
                        var per = evt.loaded / evt.total;
                        $('#prg').html('progress: ' + Math.round(per * 100) + '%');
                        $('#bar').css('width', Math.round(per * 100) + '%');
                    }
                }, false);
                return xhr;
            },
            success: function (d, s) {
                location.reload();
                console.log('success!')
            },
            error: function (a, b, c) {
                console.error(a, b, c);
            }
        });
    });
})

var gateway = `ws://${window.location.hostname}/ws`;
var websocket;
// window.addEventListener('load', onLoad);
function initWebSocket() {
    console.log('Trying to open a WebSocket connection...');
    websocket = new WebSocket(gateway);
    websocket.onopen = onOpen;
    websocket.onclose = onClose;
    websocket.onmessage = onMessage; // <-- add this line
}
function onOpen(event) {
    console.log('Connection opened');
}
function onClose(event) {
    console.log('Connection closed');
    setTimeout(initWebSocket, 2000);
}
function onMessage(event) {
    var state;
    if (event.data == "1") {
        state = "ON";
    }
    else {
        state = "OFF";
    }
    document.getElementById('state').innerHTML = state;
}
function onLoad(event) {
    initWebSocket();
    initButton();
}
function initButton() {
    document.getElementById('button').addEventListener('click', toggle);
}
function toggle() {
    websocket.send('toggle');
}