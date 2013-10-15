$(function () {
    $('#new_picture').fileupload({
      dataType: 'json',
      progressall: function (e, data) {
        var progress = parseInt(data.loaded / data.total * 100, 10);
        console.log(progress);
        $('#progress .progress-bar').css(
            'width', progress + '%'
        );
      }
    });
});