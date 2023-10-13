// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import { Turbo } from "@hotwired/turbo-rails"


document.addEventListener("DOMContentLoaded", function () {
    const createChatButton = document.getElementById("create-chat-button");
    const createChatForm = document.getElementById("create-chat-form");
    const closeChatForm = document.getElementById("close-chat-form");

    createChatButton.addEventListener("click", () => {
        createChatForm.style.display = "block";
    });

    closeChatForm.addEventListener("click", () => {
        createChatForm.style.display = "none";
    });
});



document.addEventListener("turbo:load", (event) => {
    if (event.detail.targetFrame.dataset.turboFrame === "chat_messages") {
        const message = event.target.querySelector("#message_content").value;

        const messageElement = document.createElement("div");
        messageElement.className = "message";
        messageElement.textContent = message;

        const turboStream = Turbo.stream.append("chat_messages", {
            template: messageElement.outerHTML
        });

        Turbo.renderStreamMessage(turboStream);
    }
});

document.addEventListener("turbo:submit-end", (event) => {
    const chatOverlay = document.getElementById("chat-overlay");
    const closeButton = document.getElementById("close-button");

    closeButton.addEventListener("click", function () {
        chatOverlay.style.display = "none";
    });
});

function playNotificationSound() {
    const audio = new Audio('./app/assets/sounds/notification.mp3');
    audio.play();
}

document.addEventListener("turbo:load", function () {
    function handleNewMessage(chatId) {
        const indicator = document.querySelector(`#chat-list li[data-chat-id="${chatId}"] .new-messages-indicator`);
        indicator.style.display = "block";

        playNotificationSound();
    }

    handleNewMessage(chatId);
});