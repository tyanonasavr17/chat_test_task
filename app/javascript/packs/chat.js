document.addEventListener("turbo:load", () => {
    // Обработка отправки сообщения
    document.querySelectorAll("form[data-remote=true]").forEach((form) => {
        form.addEventListener("ajax:success", (event) => {
            form.reset(); // Очистка формы после отправки
        });
    });

    // Обновление сообщений в чате
    const chatMessages = document.getElementById("chat-messages");
    if (chatMessages) {
        chatMessages.scrollTop = chatMessages.scrollHeight; // Прокрутка вниз для новых сообщений
    }
});