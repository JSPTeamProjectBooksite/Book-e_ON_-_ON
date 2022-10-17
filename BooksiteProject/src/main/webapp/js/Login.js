function validateForm(form) {
	if (!form.email.value) {
		alert("이메일을 입력하세요.");
		return false;
	}
	if (!form.password.value) {
		alert("비밀번호을 입력하세요.");
		return false;
	}
}

const inputs = document.querySelectorAll(".input");

function addcl() {
	let parent = this.parentNode.parentNode;
	parent.classList.add("focus");
}

function remcl() {
	let parent = this.parentNode.parentNode;
	if (this.value == "") {
		parent.classList.remove("focus");
	}
}

inputs.forEach(input => {
	input.addEventListener("focus", addcl);
	input.addEventListener("blur", remcl);
});