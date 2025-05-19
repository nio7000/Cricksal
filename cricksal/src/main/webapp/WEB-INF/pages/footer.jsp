<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />

<div id="footer">
    <footer class="site-footer">
        <div class="footer-top">
            <div class="footer-container">
                <!-- About Section -->
                <div class="footer-column about-column">
                    <div class="footer-logo">
                        <img src="${pageContext.request.contextPath}/resources/images/system/logos.png" alt="Cricksal Logo">
                    </div>
                    <p class="footer-about">
                        Cricksal brings the thrill of cricket together with the speed of futsal in a unique indoor format that's accessible to all.
                    </p>
                </div>

                <!-- Quick Links -->
                <div class="footer-column links-column">
                    <h3>Quick Links</h3>
                    <ul class="footer-links">
                        <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                        <li><a href="${pageContext.request.contextPath}/venues">Our Venues</a></li>
                        <li><a href="${pageContext.request.contextPath}/events">Events</a></li>
                        <li><a href="${pageContext.request.contextPath}/faqs">FAQs</a></li>
                    </ul>
                </div>

                <!-- Contact Info -->
                <div class="footer-column contact-column">
                    <h3>Contact Info</h3>
                    <ul class="footer-contact-info">
                        <li><i class="fas fa-map-marker-alt"></i> 123 Sports Avenue, Cricket City</li>
                        <li><i class="fas fa-phone"></i> (123) 456-7890</li>
                        <li><i class="fas fa-envelope"></i> info@cricksal.com</li>
                    </ul>
                </div>

                <!-- Newsletter -->
                <div class="footer-column newsletter-column">
                    <h3>Newsletter</h3>
                    <p>Stay updated with our latest news and offers</p>
                    <form class="newsletter-form">
                        <input type="email" placeholder="Your Email Address" required>
                        <button type="submit">Subscribe</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Bottom -->
        <div class="footer-bottom">
            <div class="footer-container">
                <p class="copyright">
                    &copy; 2025 Cricksal. All rights reserved.
                </p>
                <div class="footer-social">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-youtube"></i></a>
                </div>
            </div>
        </div>
    </footer>
</div>
