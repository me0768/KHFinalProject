<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <c:import url="./include/common/head.jsp" />

    <c:import url="include/common/headend.jsp" />

    <div id="page-wrapper">
        <!-- Header -->
        <div id="header">
            <!-- Inner -->
            <c:import url="include/main/maininner.jsp" />

            <!-- Nav -->
            <c:import url="include/main/nav.jsp" />
            
            <c:import url="user/login.jsp"/>
			<c:import url="user/findidpwd.jsp"/>
			<c:import url="user/register.jsp"/>
        </div>
        <!-- Banner -->
        <section id="banner">
            <header>
                <h2>동영상을 보면서 운동 기초를 다져보세요 .</h2>
            </header>
            <h3>헬스, 요가, 필라테스, 맨몸운동 - 종류별/부위별 다양한 동영상이 제공됩니다 </h3>
        </section>

        <!-- Carousel -->
        <section class="carousel">
            <div class="reel">

                <article>
                    <a href="#" class="image featured"><img src="/fitnessground/resources/images/pic01.jpg" alt="" /></a>
                    <header>
                        <h3><a href="#">Pulvinar sagittis congue</a></h3>
                    </header>
                    <p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
                </article>

                <article>
                    <a href="#" class="image featured"><img src="/fitnessground/resources/images/pic02.jpg" alt="" /></a>
                    <header>
                        <h3><a href="#">Fermentum sagittis proin</a></h3>
                    </header>
                    <p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
                </article>

                <article>
                    <a href="#" class="image featured"><img src="/fitnessground/resources/images/pic03.jpg" alt="" /></a>
                    <header>
                        <h3><a href="#">Sed quis rhoncus placerat</a></h3>
                    </header>
                    <p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
                </article>

                <article>
                    <a href="#" class="image featured"><img src="/fitnessground/resources/images/pic04.jpg" alt="" /></a>
                    <header>
                        <h3><a href="#">Ultrices urna sit lobortis</a></h3>
                    </header>
                    <p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
                </article>

                <article>
                    <a href="#" class="image featured"><img src="/fitnessground/resources/images/pic05.jpg" alt="" /></a>
                    <header>
                        <h3><a href="#">Varius magnis sollicitudin</a></h3>
                    </header>
                    <p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
                </article>

                <article>
                    <a href="#" class="image featured"><img src="/fitnessground/resources/images/pic01.jpg" alt="" /></a>
                    <header>
                        <h3><a href="#">Pulvinar sagittis congue</a></h3>
                    </header>
                    <p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
                </article>

                <article>
                    <a href="#" class="image featured"><img src="/fitnessground/resources/images/pic02.jpg" alt="" /></a>
                    <header>
                        <h3><a href="#">Fermentum sagittis proin</a></h3>
                    </header>
                    <p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
                </article>

                <article>
                    <a href="#" class="image featured"><img src="/fitnessground/resources/images/pic03.jpg" alt="" /></a>
                    <header>
                        <h3><a href="#">Sed quis rhoncus placerat</a></h3>
                    </header>
                    <p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
                </article>

                <article>
                    <a href="#" class="image featured"><img src="/fitnessground/resources/images/pic04.jpg" alt="" /></a>
                    <header>
                        <h3><a href="#">Ultrices urna sit lobortis</a></h3>
                    </header>
                    <p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
                </article>

                <article>
                    <a href="#" class="image featured"><img src="/fitnessground/resources/images/pic05.jpg" alt="" /></a>
                    <header>
                        <h3><a href="#">Varius magnis sollicitudin</a></h3>
                    </header>
                    <p>Commodo id natoque malesuada sollicitudin elit suscipit magna.</p>
                </article>

            </div>
        </section>

        <!-- Main -->
        <div class="wrapper style2">

            <article id="main" class="container special">
                <header>
                    <h3 id="gym-title">내 주변 운동시설/헬스장을 찾아보세요</h3>
                </header>
                <footer>
                	<input type="search" placeholder="지역을 입력하세요">
                    <a href="#" class="btn"><i class="fa fa-search fa-2x" aria-hidden="true"></i></a>
                </footer>
            </article>

        </div>

        <!-- Features -->
        <div class="wrapper style1">

            <section id="features" class="container special">
                <header>
                    <h2>커뮤니티</h2>
                    <p>Ipsum volutpat consectetur orci metus consequat imperdiet duis integer semper magna.</p>
                </header>
                <div class="row">
                    <article class="4u 12u(mobile) special">
                        <a href="#" class="image featured"><img src="/fitnessground/resources/images/pic07.jpg" alt="" /></a>
                        <header>
                            <h3><a href="#">Gravida aliquam penatibus</a></h3>
                        </header>
                        <p>
                            Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.
                        </p>
                    </article>
                    <article class="4u 12u(mobile) special">
                        <a href="#" class="image featured"><img src="/fitnessground/resources/images/pic08.jpg" alt="" /></a>
                        <header>
                            <h3><a href="#">Sed quis rhoncus placerat</a></h3>
                        </header>
                        <p>
                            Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.
                        </p>
                    </article>
                    <article class="4u 12u(mobile) special">
                        <a href="#" class="image featured"><img src="/fitnessground/resources/images/pic09.jpg" alt="" /></a>
                        <header>
                            <h3><a href="#">Magna laoreet et aliquam</a></h3>
                        </header>
                        <p>
                            Amet nullam fringilla nibh nulla convallis tique ante proin sociis accumsan lobortis. Auctor etiam porttitor phasellus tempus cubilia ultrices tempor sagittis. Nisl fermentum consequat integer interdum.
                        </p>
                    </article>
                </div>
            </section>

        </div>

        <!-- Footer -->
        
    </div>

    <c:import url="./include/main/footer.jsp" />

    <c:import url="./include/common/end.jsp" />