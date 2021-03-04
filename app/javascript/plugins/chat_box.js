function openForm() {
  document.getElementById("myForm").style.display = "block";
  document.getElementById("chatbox-button").style.display = "none";
}

function closeForm() {
  document.getElementById("myForm").style.display = "none";
  document.getElementById("chatbox-button").style.display = "block";
}

export { openForm };
export { closeForm };

