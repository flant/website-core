// Clipbord copy functionality
var action_toast_timeout;
function showActionToast(text) {
    clearTimeout(action_toast_timeout);
    var action_toast = $('.action-toast');
    action_toast.text(text).fadeIn()
    action_toast_timeout = setTimeout(function(){ action_toast.fadeOut() }, 5000);
}

$(document).ready(function(){
    new ClipboardJS('[data-snippetcut-btn-name]', {
        text: function(trigger) {
            showActionToast('Имя скопировано')
            return $(trigger).closest('[data-snippetcut]').find('[data-snippetcut-name]').text();
        }
    });
    new ClipboardJS('[data-snippetcut-btn-text]', {
        text: function(trigger) {
            showActionToast('Текст скопирован')
            return $(trigger).closest('[data-snippetcut]').find('[data-snippetcut-text]').text();
        }
    });
});

// details
$( document ).ready(function() {
    $('.open-content_button').on('click tap', function() {
        $(this).closest('.open-content_container').toggleClass('active');
    });
});