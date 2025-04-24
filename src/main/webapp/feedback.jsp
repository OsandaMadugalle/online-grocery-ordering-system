<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!-- Feedback-specific styles -->
<style>
    body, html {
        margin: 0;
        padding: 0;
        height: 100%;
        background-color: #014d4d; /* Deep green background */
    }

    #feedback-wrapper {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding: 40px 20px;
        background-color: #013220; /* Match background */
        color: #f5f5f5;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        min-height: 100vh;
        box-sizing: border-box;
    }

    #feedback-wrapper h1 {
        font-size: 36px;
        color: #FFD700; /* Gold accent */
        margin-bottom: 30px;
        text-align: center;
    }

    #feedback-wrapper label {
        color: #FFD700;
        font-weight: 500;
        margin-bottom: 8px;
    }

    #feedback-wrapper .form-control {
        background-color: #145c5c;
        color: #fff;
        border: 1px solid #FFD700;
        border-radius: 5px;
        padding: 10px;
        font-size: 15px;
        width: 100%;
    }

    #feedback-wrapper .form-control::placeholder {
        color: #bbb;
    }

    #feedback-wrapper .form-control:focus {
        outline: none;
        box-shadow: 0 0 5px 2px #FFD70055;
        border-color: #FFD700;
    }

    #feedback-wrapper .btn-custom {
        background-color: #FFD700;
        color: #014d4d;
        font-weight: bold;
        padding: 10px 24px;
        border-radius: 5px;
        border: none;
        transition: 0.3s ease;
    }

    #feedback-wrapper .btn-custom:hover {
        background-color: #e6c200;
    }

    form {
        width: 100%;
        max-width: 600px;
    }
</style>

<br><br><br><br>

<!-- Feedback Form Section -->
<div id="feedback-wrapper">
    <h1>We Value Your Feedback</h1>
    <form method="post" action="SubmitFeedbackServlet">
        <div class="mb-3">
            <label for="name">Name</label>
            <input type="text" class="form-control" name="name" placeholder="Your Name" required>
        </div>

        <div class="mb-3">
            <label for="email">Email</label>
            <input type="email" class="form-control" name="email" placeholder="you@example.com" required>
        </div>

        <div class="mb-3">
            <label for="rating">Rating</label>
            <select class="form-control" name="rating" required>
                <option value="">-- Select Rating --</option>
                <option value="Excellent">Excellent</option>
                <option value="Good">Good</option>
                <option value="Fair">Fair</option>
                <option value="Poor">Poor</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="comments">Comments</label>
            <textarea class="form-control" name="comments" rows="4" placeholder="Tell us what you think..." required></textarea>
        </div>

        <div class="text-center mt-4">
            <button type="submit" class="btn-custom">Submit</button>
        </div>
    </form>
</div>

<%@ include file="footer.jsp" %>
