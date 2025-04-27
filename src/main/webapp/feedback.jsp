<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback</title>
    
    <style>
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            
        }

        header {
            margin: 0;
            padding: 0;
        }

        main {
            margin-top: 0;
            padding-top: 0;
        }

        * {
            box-sizing: border-box;
        }

        body {
            background-color: white;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        #feedback-wrapper {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: flex-start;
            padding: 40px 20px;
            background-color: #013220;
            color: #f5f5f5;
            min-height: 100vh;
            gap: 40px;
            box-sizing: border-box;
            margin-top: 100px;
        }

        .left-column, .right-column {
            flex: 1 1 400px;
            max-width: 600px;
        }

        h1, h2 {
            color: #FFD700;
            text-align: center;
        }

        h1 {
            font-size: 32px;
            margin-bottom: 20px;
        }

        h2 {
            font-size: 26px;
            margin-bottom: 20px;
        }

        .testimonial {
            background-color: #145c5c;
            border-left: 4px solid #FFD700;
            padding: 16px;
            margin-top: 10px;
            border-radius: 5px;
        }

        .testimonial small {
            color: #ccc;
        }

        label {
            color: #FFD700;
            font-weight: 500;
            margin-bottom: 8px;
            display: block;
            margin-top: 5px;
        }

        .form-control {
            background-color: #145c5c;
            color: #fff;
            border: 1px solid #FFD700;
            border-radius: 5px;
            padding: 10px;
            font-size: 15px;
            width: 100%;
            margin-top: 5px;
            box-sizing: border-box;
        }

        .form-control::placeholder {
            color: #bbb;
        }

        .form-control:focus {
            outline: none;
            box-shadow: 0 0 5px 2px #FFD70055;
            border-color: #FFD700;
        }

        .btn-custom {
            background-color: #FFD700;
            color: #014d4d;
            font-weight: bold;
            padding: 10px 24px;
            border-radius: 5px;
            border: none;
            transition: 0.3s ease;
            cursor: pointer;
            margin-top: 5px;
        }

        .btn-custom:hover {
            background-color: #e6c200;
        }

        @media (max-width: 768px) {
            #feedback-wrapper {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>

<body>

<%@ include file="header.jsp" %>

<!-- Content of the page -->
<div id="feedback-wrapper">
    <!-- Left Column: Testimonials -->
    <div class="left-column">
        <br>
        <h2>What Our Customers Are Saying</h2>
        <div class="testimonial"><p>"My order arrived right on time and everything was super fresh! So convenient!"</p><small>– Riya S.</small></div>
        <div class="testimonial"><p>"I love how easy it is to find everything I need. A true lifesaver during busy weeks."</p><small>– Arjun P.</small></div>
        <div class="testimonial"><p>"Their customer support is amazing! I had a missing item and it was resolved instantly."</p><small>– Maya D.</small></div>
        <div class="testimonial"><p>"I’ve been ordering groceries online for a while, and this is by far the best service."</p><small>– Zaid K.</small></div>
        <div class="testimonial"><p>"Very impressed with the quality of fruits and vegetables. Everything was top-notch."</p><small>– Neha M.</small></div>
        <div class="testimonial"><p>"Their same-day delivery has been a game-changer. No more last-minute grocery runs."</p><small>– Tanmay V.</small></div>
        <div class="testimonial"><p>"I’ve never had such a smooth online ordering experience. Highly recommended!"</p><small>– Sneha R.</small></div>
        <div class="testimonial"><p>"Everything is well organized and delivery is always on time. Love it!"</p><small>– Karan J.</small></div>
        <div class="testimonial"><p>"Great prices and amazing offers. I end up saving so much every month."</p><small>– Ayesha B.</small></div>
        <div class="testimonial"><p>"Even during peak hours, they deliver exactly what I ordered. Super reliable!"</p><small>– Rahul T.</small></div>
    </div>

    <!-- Right Column: Feedback Form -->
    <div class="right-column">
        <br>
        <h1>We Value Your Feedback</h1>
        <form method="post" action="SubmitFeedbackServlet">
            <label for="name">Name</label>
            <input type="text" class="form-control" name="name" placeholder="Your Name" required>

            <label for="email">Email</label>
            <input type="email" class="form-control" name="email" placeholder="you@example.com" required>

            <label for="rating">Rating</label>
            <select class="form-control" name="rating" required>
                <option value="">-- Select Rating --</option>
                <option value="Excellent">Excellent</option>
                <option value="Good">Good</option>
                <option value="Fair">Fair</option>
                <option value="Poor">Poor</option>
            </select>

            <label for="comments">Comments</label>
            <textarea class="form-control" name="comments" rows="4" placeholder="Tell us what you think..." required></textarea>

            <div class="text-center">
                <button type="submit" class="btn-custom">Submit</button>
            </div>
        </form>
    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
