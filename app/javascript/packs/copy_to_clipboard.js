var copyButtons = document.getElementsByClassName("copy");
console.log(copyButtons)
for (let i = 0; i < copyButtons.length; i++ ) {
	copyButtons[i].addEventListener("click", (e) => {
		console.log(e)
		console.log(e.target)
		console.log(e.target.name)
		navigator.clipboard.writeText(e.target.name).then(function() {
		}, function() {
		  alert("failed")
		});
	})
}
