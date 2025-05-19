<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cricksal - Contact Us</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/contact.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

    <jsp:include page="header.jsp" />

   <!-- Page Banner -->
    <div class="page-banner">
        <div class="banner-content">
            <h1>Contact <span class="highlight">Cricksal</span></h1>
            <p>Where passion meets innovation in indoor cricket</p>
        </div>
    </div>

    <!-- Contact Form Section -->
    <section class="contact-section">
        <div class="container">
            <div class="section-header">
                <h2>Get in Touch</h2>
                <div class="divider"><span></span></div>
                <p class="section-subheading">Send us a message and we’ll get back to you as soon as possible</p>
            </div>

            <div class="contact-grid">
                <div class="contact-info">
                    <h3>Contact Details</h3>
                    <p><i class="fas fa-map-marker-alt"></i> 123 Cricksal Lane, Urban City, 10001</p>
                    <p><i class="fas fa-phone-alt"></i> +123 456 7890</p>
                    <p><i class="fas fa-envelope"></i> info@cricksal.com</p>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>

                <div class="contact-form">
                    <form action="contactSubmit.jsp" method="post">
                        <input type="text" name="name" placeholder="Your Name" required>
                        <input type="email" name="email" placeholder="Your Email" required>
                        <input type="text" name="subject" placeholder="Subject" required>
                        <textarea name="message" placeholder="Your Message" rows="6" required></textarea>
                        <button type="submit" class="btn-submit">Send Message</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="footer.jsp" />

</body>
</html>
