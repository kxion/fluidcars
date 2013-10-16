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
      // add: function (e, data) {
      //     if (e.isDefaultPrevented()) {
      //         return false;
      //     }
      //     var $this = $(this),
      //         that = $this.data('blueimp-fileupload') ||
      //             $this.data('fileupload'),
      //         options = that.options,
      //         files = data.files;
      //     data.process(function () {
      //         return $this.fileupload('process', data);
      //     }).always(function () {
      //         data.context = that._renderUpload(files).data('data', data);
      //         that._renderPreviews(data);
      //         options.filesContainer[
      //             options.prependFiles ? 'prepend' : 'append'
      //         ](data.context);
      //         that._forceReflow(data.context);
      //         that._transition(data.context).done(
      //             function () {
      //                 if ((that._trigger('added', e, data) !== false) &&
      //                         (options.autoUpload || data.autoUpload) &&
      //                         data.autoUpload !== false && !data.files.error) {
      //                     data.submit();
      //                 }
      //             }
      //         );
      //     });
      // }
      // done: function (e, data) {
      //   $.each(data.result, function (index, file) {
      //       $('<p/>').text(file.name + ' uploaded').appendTo($("body"));
      //   });
      // }
    });
});