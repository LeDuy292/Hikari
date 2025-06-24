<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="chatbox" style="display: none;">
    <div class="chatbox-container">
        <div class="chatbox-header">
            <div class="chatbox-title">
                <i class="fas fa-robot"></i>
                <span>AI HIKARI</span>
                <span class="status-indicator" id="status-indicator">
                    <i class="fas fa-circle" style="color: #10b981; font-size: 8px;"></i>
                    <span style="font-size: 10px; margin-left: 4px;">Online</span>
                </span>
            </div>
            <button onclick="toggleChatbox()" class="chatbox-close">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <div class="chatbox-history" id="chatbox-history">
            <%
                List<String[]> chatboxHistory = (List<String[]>) session.getAttribute("chatHistory");
                if (chatboxHistory != null) {
                    for (String[] chat : chatboxHistory) {
            %>
            <div class="chat-message user-message">
                <div class="message-avatar">
                    <i class="fas fa-user"></i>
                </div>
                <div class="message-content">
                    <div class="message-text"><%= chat[0]%></div>
                </div>
            </div>
            <div class="chat-message ai-message">
                <div class="message-avatar">
                    <i class="fas fa-robot"></i>
                </div>
                <div class="message-content">
                    <div class="message-text"><%= chat[1]%></div>
                </div>
            </div>
            <%
                }
            } else {
            %>
            <div class="welcome-message">
                <div class="welcome-icon">
                    <i class="fas fa-robot"></i>
                </div>
                <h3>Xin chào! 👋</h3>
                <p>Tôi là AI HIKARI, trợ lý thông minh của hệ thống học tiếng Nhật HIKARI.</p>
                <p>Tôi có thể giúp bạn:</p>
                <ul class="feature-list">
                    <li>📚 Tư vấn khóa học phù hợp</li>
                    <li>📝 Giải đáp về JLPT</li>
                    <li>🗾 Chia sẻ văn hóa Nhật Bản</li>
                    <li>💡 Hướng dẫn sử dụng hệ thống</li>
                </ul>
                <p><strong>Hãy thử một trong những câu hỏi dưới đây:</strong></p>
                <ul class="suggested-questions" id="suggested-questions">
                    <!-- Suggested questions will be populated by JavaScript -->
                </ul>
                <div class="database-info">
                    <i class="fas fa-database"></i>
                    <span>Cơ sở dữ liệu: <span id="qa-count">Đang tải...</span> câu hỏi</span>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <div class="chatbox-input">
            <div class="input-wrapper">
                <textarea 
                    id="userInput" 
                    rows="1" 
                    placeholder="Nhập câu hỏi của bạn..." 
                    onkeypress="submitOnEnter(event)"
                    ></textarea>
                <button onclick="sendMessage()" class="send-btn" id="send-btn">
                    <i class="fas fa-paper-plane"></i>
                </button>
            </div>
            <div class="quick-actions">
                <button onclick="loadSuggestions()" class="quick-btn">
                    <i class="fas fa-lightbulb"></i> Gợi ý
                </button>
                <button onclick="clearChat()" class="quick-btn">
                    <i class="fas fa-trash"></i> Xóa chat
                </button>
            </div>
        </div>
    </div>
</div>

<button id="chatbox-toggle" onclick="toggleChatbox()">
    <i class="fas fa-comments"></i>
    <span class="toggle-text">AI Chat</span>
    <span class="notification-badge" id="notification-badge" style="display: none;">1</span>
</button>

<style>
    /* Enhanced styles for the improved chatbox */
    .status-indicator {
        display: flex;
        align-items: center;
        margin-left: 10px;
    }
    
    .feature-list {
        list-style: none;
        padding: 0;
        margin: 10px 0;
    }
    
    .feature-list li {
        padding: 5px 0;
        font-size: 0.875rem;
        color: #64748b;
    }
    
    .database-info {
        margin-top: 15px;
        padding: 8px 12px;
        background: #f1f5f9;
        border-radius: 8px;
        font-size: 0.75rem;
        color: #64748b;
        display: flex;
        align-items: center;
        gap: 6px;
    }
    
    .quick-actions {
        display: flex;
        gap: 8px;
        margin-top: 8px;
    }
    
    .quick-btn {
        flex: 1;
        padding: 6px 12px;
        background: #f8fafc;
        border: 1px solid #e2e8f0;
        border-radius: 6px;
        font-size: 0.75rem;
        cursor: pointer;
        transition: all 0.2s;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 4px;
    }
    
    .quick-btn:hover {
        background: #f1f5f9;
        border-color: #cbd5e1;
    }
    
    .notification-badge {
        position: absolute;
        top: -5px;
        right: -5px;
        background: #ef4444;
        color: white;
        border-radius: 50%;
        width: 18px;
        height: 18px;
        font-size: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
    }
    
    .message-source {
        font-size: 0.7rem;
        color: #94a3b8;
        margin-top: 4px;
        font-style: italic;
    }
    
    .typing-indicator-enhanced {
        display: flex;
        align-items: center;
        gap: 8px;
        padding: 12px 16px;
        background: #f8fafc;
        border-radius: 12px;
        margin: 8px 0;
    }
    
    .typing-text {
        font-size: 0.875rem;
        color: #64748b;
    }
    
    /* Existing styles remain the same */
    #chatbox-toggle {
        position: fixed;
        bottom: 2rem;
        right: 2rem;
        background: linear-gradient(135deg, #3b82f6, #2563eb);
        color: white;
        border: none;
        border-radius: 50px;
        padding: 1rem 1.5rem;
        font-size: 0.875rem;
        font-weight: 600;
        cursor: pointer;
        box-shadow: 0 10px 25px rgba(59, 130, 246, 0.3);
        z-index: 1001;
        transition: all 0.3s ease;
        display: flex;
        align-items: center;
        gap: 0.5rem;
        min-width: 60px;
        justify-content: center;
        position: relative;
    }

    #chatbox-toggle:hover {
        transform: translateY(-2px);
        box-shadow: 0 15px 35px rgba(59, 130, 246, 0.4);
        background: linear-gradient(135deg, #2563eb, #1d4ed8);
    }

    #chatbox-toggle .toggle-text {
        display: none;
    }

    #chatbox-toggle:hover .toggle-text {
        display: inline;
        animation: fadeIn 0.3s ease;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateX(10px);
        }
        to {
            opacity: 1;
            transform: translateX(0);
        }
    }

    .chatbox-container {
        position: fixed;
        bottom: 6rem;
        right: 2rem;
        width: 400px;
        max-height: 650px;
        background: white;
        border-radius: 1rem;
        box-shadow: 0 20px 50px rgba(0, 0, 0, 0.15);
        display: flex;
        flex-direction: column;
        z-index: 1000;
        animation: slideUp 0.3s ease-out;
        border: 1px solid #e2e8f0;
        overflow: hidden;
    }

    @keyframes slideUp {
        from {
            transform: translateY(100px) scale(0.9);
            opacity: 0;
        }
        to {
            transform: translateY(0) scale(1);
            opacity: 1;
        }
    }

    .chatbox-header {
        background: linear-gradient(135deg, #3b82f6, #2563eb);
        color: white;
        padding: 1rem 1.5rem;
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-radius: 1rem 1rem 0 0;
    }

    .chatbox-title {
        display: flex;
        align-items: center;
        gap: 0.75rem;
        font-weight: 600;
        font-size: 1rem;
    }

    .chatbox-close {
        background: none;
        border: none;
        color: white;
        font-size: 1.125rem;
        cursor: pointer;
        padding: 0.5rem;
        border-radius: 0.5rem;
        transition: all 0.2s;
        display: flex;
        align-items: center;
        justify-content: center;
        width: 32px;
        height: 32px;
    }

    .chatbox-close:hover {
        background: rgba(255, 255, 255, 0.2);
        transform: scale(1.1);
    }

    .chatbox-history {
        flex: 1;
        max-height: 450px;
        overflow-y: auto;
        padding: 1.5rem;
        background: #f8fafc;
        display: flex;
        flex-direction: column;
        gap: 1rem;
    }

    .chatbox-history::-webkit-scrollbar {
        width: 6px;
    }

    .chatbox-history::-webkit-scrollbar-track {
        background: #f1f5f9;
    }

    .chatbox-history::-webkit-scrollbar-thumb {
        background: #cbd5e1;
        border-radius: 3px;
    }

    .chatbox-history::-webkit-scrollbar-thumb:hover {
        background: #94a3b8;
    }

    .welcome-message {
        text-align: center;
        padding: 1rem;
        color: #64748b;
    }

    .welcome-icon {
        font-size: 3rem;
        color: #3b82f6;
        margin-bottom: 1rem;
    }

    .welcome-message h3 {
        color: #1e293b;
        margin-bottom: 0.5rem;
        font-size: 1.125rem;
    }

    .welcome-message p {
        line-height: 1.6;
        font-size: 0.875rem;
        margin-bottom: 0.5rem;
    }

    .suggested-questions {
        list-style: none;
        padding: 0;
        margin: 1rem 0 0;
        display: flex;
        flex-direction: column;
        gap: 0.5rem;
    }

    .suggested-questions li {
        background: #ffffff;
        padding: 0.75rem;
        border-radius: 0.5rem;
        cursor: pointer;
        transition: all 0.2s;
        border: 1px solid #e2e8f0;
        font-size: 0.875rem;
        text-align: left;
    }

    .suggested-questions li:hover {
        background: #f1f5f9;
        transform: translateY(-2px);
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    .chat-message {
        display: flex;
        gap: 0.75rem;
        align-items: flex-start;
        animation: messageSlide 0.3s ease-out;
    }

    @keyframes messageSlide {
        from {
            transform: translateY(20px);
            opacity: 0;
        }
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }

    .message-avatar {
        width: 32px;
        height: 32px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 0.875rem;
        flex-shrink: 0;
        margin-top: 0.25rem;
    }

    .user-message .message-avatar {
        background: linear-gradient(135deg, #3b82f6, #2563eb);
        color: white;
        order: 2;
    }

    .ai-message .message-avatar {
        background: linear-gradient(135deg, #10b981, #059669);
        color: white;
    }

    .message-content {
        flex: 1;
        max-width: calc(100% - 48px);
    }

    .user-message .message-content {
        order: 1;
    }

    .message-text {
        background: white;
        padding: 0.75rem 1rem;
        border-radius: 1rem;
        font-size: 0.875rem;
        line-height: 1.5;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        border: 1px solid #e2e8f0;
        word-wrap: break-word;
        white-space: pre-wrap;
    }

    .user-message .message-text {
        background: linear-gradient(135deg, #3b82f6, #2563eb);
        color: white;
        border: none;
        margin-left: auto;
        border-radius: 1rem 1rem 0.25rem 1rem;
    }

    .ai-message .message-text {
        border-radius: 1rem 1rem 1rem 0.25rem;
    }

    .chatbox-input {
        padding: 1rem 1.5rem;
        background: white;
        border-top: 1px solid #e2e8f0;
    }

    .input-wrapper {
        display: flex;
        gap: 0.75rem;
        align-items: flex-end;
    }

    .input-wrapper textarea {
        flex: 1;
        padding: 0.75rem 1rem;
        border: 1px solid #e2e8f0;
        border-radius: 1rem;
        resize: none;
        font-size: 0.875rem;
        font-family: inherit;
        outline: none;
        transition: all 0.2s;
        max-height: 100px;
        min-height: 40px;
        line-height: 1.5;
    }

    .input-wrapper textarea:focus {
        border-color: #3b82f6;
        box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
    }

    .send-btn {
        width: 40px;
        height: 40px;
        background: linear-gradient(135deg, #3b82f6, #2563eb);
        color: white;
        border: none;
        border-radius: 50%;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: all 0.2s;
        flex-shrink: 0;
    }

    .send-btn:hover {
        transform: scale(1.1);
        box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
    }

    .send-btn:disabled {
        opacity: 0.6;
        cursor: not-allowed;
        transform: none;
    }

    /* Loading animation */
    .typing-indicator {
        display: flex;
        gap: 0.25rem;
        padding: 1rem;
        align-items: center;
    }

    .typing-dot {
        width: 8px;
        height: 8px;
        background: #94a3b8;
        border-radius: 50%;
        animation: typing 1.4s infinite ease-in-out;
    }

    .typing-dot:nth-child(2) {
        animation-delay: 0.2s;
    }

    .typing-dot:nth-child(3) {
        animation-delay: 0.4s;
    }

    @keyframes typing {
        0%, 60%, 100% {
            transform: translateY(0);
            opacity: 0.4;
        }
        30% {
            transform: translateY(-10px);
            opacity: 1;
        }
    }

    /* Responsive */
    @media (max-width: 768px) {
        .chatbox-container {
            width: calc(100vw - 2rem);
            right: 1rem;
            bottom: 5rem;
            max-height: 70vh;
        }

        #chatbox-toggle {
            right: 1rem;
            bottom: 1rem;
        }

        .chatbox-history {
            padding: 1rem;
        }

        .chatbox-input {
            padding: 1rem;
        }
    }
</style>

<script>
    let isTyping = false;
    let qaCount = 0;

    // Load database statistics on page load
    function loadDatabaseStats() {
        fetch('chat?action=stats')
            .then(response => response.json())
            .then(data => {
                qaCount = data.totalQA || 0;
                document.getElementById('qa-count').textContent = qaCount.toLocaleString();
            })
            .catch(error => {
                console.error('Error loading database stats:', error);
                document.getElementById('qa-count').textContent = 'N/A';
            });
    }

    // Load suggested questions from database
    function loadSuggestions() {
        fetch('chat?action=suggestions')
            .then(response => response.json())
            .then(data => {
                const suggestedList = document.getElementById("suggested-questions");
                suggestedList.innerHTML = "";
                
                if (data.suggestions && data.suggestions.length > 0) {
                    data.suggestions.forEach(question => {
                        const li = document.createElement("li");
                        li.textContent = question;
                        li.onclick = () => sendSuggestedMessage(question);
                        suggestedList.appendChild(li);
                    });
                } else {
                    // Fallback to hardcoded suggestions
                    populateDefaultSuggestions();
                }
            })
            .catch(error => {
                console.error('Error loading suggestions:', error);
                populateDefaultSuggestions();
            });
    }

    function populateDefaultSuggestions() {
        const defaultSuggestions = [
            "Hikari có những khóa học nào?",
            "Cách đăng ký khóa học trên Hikari?",
            "JLPT N5 cần học những gì?",
            "Học phí các khóa học như thế nào?",
            "Có mã giảm giá không?"
        ];
        
        const suggestedList = document.getElementById("suggested-questions");
        suggestedList.innerHTML = "";
        
        defaultSuggestions.forEach(question => {
            const li = document.createElement("li");
            li.textContent = question;
            li.onclick = () => sendSuggestedMessage(question);
            suggestedList.appendChild(li);
        });
    }

    function toggleChatbox() {
        var chatbox = document.getElementById("chatbox");
        var toggle = document.getElementById("chatbox-toggle");
        var badge = document.getElementById("notification-badge");

        if (chatbox.style.display === "none") {
            chatbox.style.display = "block";
            toggle.innerHTML = '<i class="fas fa-times"></i>';
            badge.style.display = "none";
            scrollToBottom();
            autoResizeTextarea();
            
            if (document.querySelector('.welcome-message')) {
                loadSuggestions();
                loadDatabaseStats();
            }
        } else {
            chatbox.style.display = "none";
            toggle.innerHTML = '<i class="fas fa-comments"></i><span class="toggle-text">AI Chat</span>';
        }
    }

    function submitOnEnter(event) {
        if (event.key === "Enter" && !event.shiftKey) {
            event.preventDefault();
            sendMessage();
        } else if (event.key === "Enter" && event.shiftKey) {
            return true;
        }
    }

    function sendMessage() {
        var userInput = document.getElementById("userInput").value.trim();
        if (!userInput || isTyping) return;

        // Add user message
        addMessage(userInput, 'user');

        // Clear input
        document.getElementById("userInput").value = "";
        autoResizeTextarea();

        // Show enhanced typing indicator
        showTypingIndicator();

        // Send AJAX request to enhanced servlet
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "chat", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                hideTypingIndicator();

                if (xhr.status === 200) {
                    try {
                        var response = JSON.parse(xhr.responseText);
                        addMessage(response.text, 'ai', response.source);
                    } catch (e) {
                        addMessage("Xin lỗi, có lỗi xảy ra khi xử lý phản hồi.", 'ai');
                    }
                } else {
                    addMessage("Xin lỗi, không thể kết nối đến server. Vui lòng thử lại sau.", 'ai');
                }
            }
        };
        xhr.send("userInput=" + encodeURIComponent(userInput));
    }

    function sendSuggestedMessage(question) {
        document.getElementById("userInput").value = question;
        sendMessage();
    }

    function addMessage(text, type, source) {
        var history = document.getElementById("chatbox-history");

        // Remove welcome message if exists
        var welcomeMsg = history.querySelector('.welcome-message');
        if (welcomeMsg) {
            welcomeMsg.remove();
        }

        var messageDiv = document.createElement("div");
        messageDiv.className = "chat-message " + type + "-message";

        var avatarDiv = document.createElement("div");
        avatarDiv.className = "message-avatar";
        avatarDiv.innerHTML = type === 'user' ? '<i class="fas fa-user"></i>' : '<i class="fas fa-robot"></i>';

        var contentDiv = document.createElement("div");
        contentDiv.className = "message-content";

        var textDiv = document.createElement("div");
        textDiv.className = "message-text";
        textDiv.innerHTML = text.replace(/\n/g, '<br>');

        contentDiv.appendChild(textDiv);
        messageDiv.appendChild(avatarDiv);
        messageDiv.appendChild(contentDiv);

        history.appendChild(messageDiv);
        scrollToBottom();
    }

    function showTypingIndicator() {
        if (isTyping) return;
        isTyping = true;

        var history = document.getElementById("chatbox-history");
        var typingDiv = document.createElement("div");
        typingDiv.className = "chat-message ai-message";
        typingDiv.id = "typing-indicator";

        typingDiv.innerHTML = `
            <div class="message-avatar">
                <i class="fas fa-robot"></i>
            </div>
            <div class="message-content">
                <div class="typing-indicator-enhanced">
                    <div class="typing-indicator">
                        <div class="typing-dot"></div>
                        <div class="typing-dot"></div>
                        <div class="typing-dot"></div>
                    </div>
                    <span class="typing-text">AI đang suy nghĩ...</span>
                </div>
            </div>
        `;

        history.appendChild(typingDiv);
        scrollToBottom();
    }

    function hideTypingIndicator() {
        isTyping = false;
        var typingIndicator = document.getElementById("typing-indicator");
        if (typingIndicator) {
            typingIndicator.remove();
        }
    }

    function clearChat() {
        if (confirm("Bạn có chắc muốn xóa toàn bộ lịch sử chat?")) {
            var history = document.getElementById("chatbox-history");
            history.innerHTML = `
                <div class="welcome-message">
                    <div class="welcome-icon">
                        <i class="fas fa-robot"></i>
                    </div>
                    <h3>Xin chào! 👋</h3>
                    <p>Tôi là AI HIKARI, trợ lý thông minh của hệ thống học tiếng Nhật HIKARI.</p>
                    <p>Tôi có thể giúp bạn:</p>
                    <ul class="feature-list">
                        <li>📚 Tư vấn khóa học phù hợp</li>
                        <li>📝 Giải đáp về JLPT</li>
                        <li>🗾 Chia sẻ văn hóa Nhật Bản</li>
                        <li>💡 Hướng dẫn sử dụng hệ thống</li>
                    </ul>
                    <p><strong>Hãy thử một trong những câu hỏi dưới đây:</strong></p>
                    <ul class="suggested-questions" id="suggested-questions">
                    </ul>
                    <div class="database-info">
                        <i class="fas fa-database"></i>
                        <span>Cơ sở dữ liệu: <span id="qa-count">${qaCount.toLocaleString()}</span> câu hỏi</span>
                    </div>
                </div>
            `;
            loadSuggestions();
            
            // Clear server session
            fetch('chat', {
                method: 'POST',
                headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                body: 'action=clear'
            });
        }
    }

    function scrollToBottom() {
        var history = document.getElementById("chatbox-history");
        setTimeout(() => {
            history.scrollTop = history.scrollHeight;
        }, 100);
    }

    function autoResizeTextarea() {
        var textarea = document.getElementById("userInput");
        textarea.style.height = 'auto';
        textarea.style.height = Math.min(textarea.scrollHeight, 100) + 'px';
    }

    // Auto-resize textarea on input
    document.getElementById("userInput").addEventListener('input', autoResizeTextarea);

    // Initialize
    window.onload = function () {
        loadDatabaseStats();
        if (document.getElementById("chatbox").style.display === "block") {
            scrollToBottom();
        }
        if (document.querySelector('.welcome-message')) {
            loadSuggestions();
        }
    };

    // Show notification badge when chatbox is closed and new message arrives
    function showNotification() {
        if (document.getElementById("chatbox").style.display === "none") {
            document.getElementById("notification-badge").style.display = "flex";
        }
    }
</script>
