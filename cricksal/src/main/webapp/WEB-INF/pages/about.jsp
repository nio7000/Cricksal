<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cricksal - About Us</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/about.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

    <jsp:include page="header.jsp" />

    <!-- Page Banner -->
    <div class="page-banner">
        <div class="banner-content">
            <h1>About <span class="highlight">Cricksal</span></h1>
            <p>Where passion meets innovation in indoor cricket</p>
        </div>
    </div>

    <!-- Our Story Section -->
    <section class="story-section">
        <div class="container">
            <div class="section-header">
                <h2>Our Story</h2>
                <div class="divider"><span></span></div>
            </div>
            <div class="story-content">
                <div class="story-image">
                    <img src="${pageContext.request.contextPath}/resources/images/system/history_img.jpg" alt="Cricksal Origin Story">
                </div>
                <div class="story-text">
                    <h3>How It All Began</h3>
                    <p>Cricksal was born from a simple idea: bringing the excitement of cricket to urban spaces. Founded in 2019 by a group of cricket enthusiasts with a passion for innovation, we set out to create a fast-paced indoor cricket experience that blends the strategic elements of cricket with the speed and accessibility of futsal.</p>
                    <p>What started as weekend games among friends in a rented warehouse has grown into a vibrant community of players across multiple venues. Our founders, all former club cricketers, recognized that traditional cricket was becoming less accessible in urban areas due to time constraints and limited space.</p>
                    <p>Today, Cricksal operates in multiple locations, bringing together cricket enthusiasts of all skill levels in an inclusive, high-energy environment.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- What We Offer Section -->
    <section class="offers-section">
        <div class="container">
            <div class="section-header">
                <h2>What Makes Us Unique</h2>
                <div class="divider"><span></span></div>
            </div>
            <div class="offers-grid">
                <div class="offer-item">
                    <div class="offer-icon">
                        <i class="fas fa-bolt"></i>
                    </div>
                    <h3>Fast-Paced Format</h3>
                    <p>Our unique ruleset delivers high-scoring matches completed in under an hour, perfect for busy lifestyles.</p>
                </div>
                <div class="offer-item">
                    <div class="offer-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <h3>All Skill Levels</h3>
                    <p>From beginners to experienced players, our format creates an even playing field that's fun for everyone.</p>
                </div>
                <div class="offer-item">
                    <div class="offer-icon">
                        <i class="fas fa-medal"></i>
                    </div>
                    <h3>Weekly Competitions</h3>
                    <p>Regular tournaments and leagues keep the competition fresh and exciting all year round.</p>
                </div>
                <div class="offer-item">
                    <div class="offer-icon">
                        <i class="fas fa-cloud-sun"></i>
                    </div>
                    <h3>All-Weather Play</h3>
                    <p>Rain or shine, our indoor facilities ensure you can play cricket any day of the year.</p>
                </div>
                <div class="offer-item">
                    <div class="offer-icon">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <h3>Safe Environment</h3>
                    <p>Padded walls, specialized equipment, and strict safety protocols keep the game exciting yet safe.</p>
                </div>
                <div class="offer-item">
                    <div class="offer-icon">
                        <i class="fas fa-glass-cheers"></i>
                    </div>
                    <h3>Social Experience</h3>
                    <p>Post-match social areas where players can relax, analyze their games, and build friendships.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Our Team Section -->
    <section class="team-section">
        <div class="container">
            <div class="section-header">
                <h2>Meet Our Team</h2>
                <div class="divider"><span></span></div>
                <p class="section-subheading">The passionate people behind Cricksal</p>
            </div>
            <div class="team-grid">
                <div class="team-member">
                    <div class="member-photo">
                        <img src="${pageContext.request.contextPath}/resources/images/system/team4.png" alt="Team Member">
                    </div>
                    <h3>Nikesh Oli</h3>
                    <p class="member-position">Founder & CEO</p>
                    <p class="member-bio">Former regional cricket captain with a passion for making cricket accessible to everyone.</p>
                    <div class="member-social">
                        <a href="#"><i class="fab fa-linkedin"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
                <div class="team-member">
                    <div class="member-photo">
                        <img src="${pageContext.request.contextPath}/resources/images/system/team2.png" alt="Team Member">
                    </div>
                    <h3>Samikshya Sitoula</h3>
                    <p class="member-position">Operations Director</p>
                    <p class="member-bio">Sports management expert who ensures our venues run smoothly and efficiently.</p>
                    <div class="member-social">
                        <a href="#"><i class="fab fa-linkedin"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
                <div class="team-member">
                    <div class="member-photo">
                        <img src="${pageContext.request.contextPath}/resources/images/system/team1.png" alt="Team Member">
                    </div>
                    <h3>Smriti Oli</h3>
                    <p class="member-position">Head Coach</p>
                    <p class="member-bio">Professional cricket coach who develops our training programs and youth initiatives.</p>
                    <div class="member-social">
                        <a href="#"><i class="fab fa-linkedin"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
                <div class="team-member">
                    <div class="member-photo">
                        <img src="${pageContext.request.contextPath}/resources/images/system/team3.png" alt="Team Member">
                    </div>
                    <h3>Bishesh Bengani</h3>
                    <p class="member-position">Community Manager</p>
                    <p class="member-bio">Builds and nurtures our player community through events and social initiatives.</p>
                    <div class="member-social">
                        <a href="#"><i class="fab fa-linkedin"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section class="testimonials-section">
        <div class="container">
            <div class="section-header">
                <h2>What Our Players Say</h2>
                <div class="divider"><span></span></div>
            </div>
            <div class="testimonials-slider">
                <div class="testimonial">
                    <div class="testimonial-content">
                        <div class="quote-icon">
                            <i class="fas fa-quote-left"></i>
                        </div>
                        <p>"Cricksal has completely changed how I enjoy cricket. As a busy professional, I never thought I'd be able to play regularly again. Now I play twice a week and have made amazing friends!"</p>
                        <div class="testimonial-author">
                            <div class="author-image">
                                <img src="${pageContext.request.contextPath}/resources/images/system/review2.png" alt="Testimonial Author">
                            </div>
                            <div class="author-info">
                                <h4>Saugat Ojha</h4>
                                <p>Regular Player, 2 years</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="testimonial">
                    <div class="testimonial-content">
                        <div class="quote-icon">
                            <i class="fas fa-quote-left"></i>
                        </div>
                        <p>"I was intimidated to try cricket again after not playing since school, but Cricksal's format made it easy to get back into it. The community is so welcoming, and I've improved so much!"</p>
                        <div class="testimonial-author">
                            <div class="author-image">
                                <img src="${pageContext.request.contextPath}/resources/images/system/review1.png" alt="Testimonial Author">
                            </div>
                            <div class="author-info">
                                <h4>Suravi KC</h4>
                                <p>League Player, 1 year</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- Footer -->
    <jsp:include page="footer.jsp" />

    <!-- Simple slider functionality -->
    <script>
        // This would be replaced with a proper slider library in production
        const testimonials = document.querySelectorAll('.testimonial');
        let currentTestimonial = 0;
        
        function showTestimonial(index) {
            testimonials.forEach((testimonial, i) => {
                testimonial.style.display = i === index ? 'block' : 'none';
            });
        }
        
        // Logout function
        function logout() {
            if (confirm('Are you sure you want to logout?')) {
                window.location.href = '${pageContext.request.contextPath}/login';
            }
        }
        
        // Initialize
        showTestimonial(currentTestimonial);
        
        // Auto rotate every 5 seconds
        setInterval(() => {
            currentTestimonial = (currentTestimonial + 1) % testimonials.length;
            showTestimonial(currentTestimonial);
        }, 5000);
    </script>
</body>
</html>
