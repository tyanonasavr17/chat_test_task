document.addEventListener("turbo:load", () => {
    document.querySelectorAll("form[data-remote=true]").forEach((form) => {
        form.addEventListener("ajax:success", (event) => {
            form.reset();
        });
    });

    const chatMessages = document.getElementById("chat-messages");
    if (chatMessages) {
        chatMessages.scrollTop = chatMessages.scrollHeight;
    }
});