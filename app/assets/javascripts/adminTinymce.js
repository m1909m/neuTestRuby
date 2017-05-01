//<![CDATA[
(function() {
    function initTinyMCE() {
        if (typeof tinyMCE != 'undefined') {
            tinymce.remove();
            tinymce.init({
                language: "de",
                selector: ".tinymce",
                height: 500,
                plugins: [
                    "advlist autolink autosave link image imagetools lists charmap print preview hr anchor pagebreak spellchecker",
                    "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
                    "table contextmenu directionality template textcolor paste textcolor colorpicker textpattern"
                ],
                file_browser_callback: function(field_name, url, type, win) {
                    if(type=='image') $('#my_form input').click();
                },

                toolbar1: "fontselect | fontsizeselect | bold italic underline strikethrough | forecolor backcolor | alignleft aligncenter alignright alignjustify | bullist numlist | table spellchecker | outdent indent | link unlink | image | rotateleft rotateright | flipv fliph | blockquote code | preview",

                menubar: 'file edit insert view format',
                toolbar_items_size: 'normal',

                content_css: [
                    '//https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'
                ]
            });

        } else {
            setTimeout(initTinyMCE, 50);
        }
    }

    initTinyMCE();
})();

//]]>
