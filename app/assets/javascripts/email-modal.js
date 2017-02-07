$( document ).ready(function() {
  function userIsLoggedIn() {
    return document.location.href.indexOf('confirm-email') > -1;
  }

  function hasntConfirmedEmail() {
    return document.cookie.indexOf('concert_app_email') == -1;
  }

  function showEmailModal() {
    $('#js--email-modal').modal();
  }

	if (userIsLoggedIn() && hasntConfirmedEmail()) {
    showEmailModal();
	}
});