var copyButtons = document.getElementsByClassName("copy");

document.addEventListener('turbolinks:load', (event) => {
	for (let i = 0; i < copyButtons.length; i++ ) {
		copyButtons[i].addEventListener("click", (e) => {
			navigator.clipboard.writeText(window.location.host + e.target.name).then(function() {
			}, function() {
			  alert("failed")
			});
		})
	}
});
