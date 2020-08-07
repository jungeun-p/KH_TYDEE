<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!--google font-->
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="tydee__secondhandlist.css" />
</head>
<body>
<%@ include file="./include/main_header.jsp"%>
	 <div class="tydee__secondhand">
      <div class="tydee__secondhand__title">
        <h1>TYDEE SECOND HAND</h1>
        <div class="tydee__hashtag">
          <span>#tydee</span>
          <span>#tydee</span>
          <span>#tydee</span>
          <span>#tydee</span>
        </div>
        <a href="#"><p class="wrtie__secondhand">+</p></a>
      </div>
      <section class="modals">
        <a href="#">
          <div class="modal">
            <div class="modal__wrap">
              <img src="img/1.jpg" alt="" />
              <div class="modal__description">
                <p class="modal__name">
                  TYDEE BOX
                </p>
                <p class="modal__explain">
                  Contrary to popular belief, Lorem Ipsum is not simply random
                  text.
                </p>
              </div>
            </div>
          </div>
        </a>
        <a href="#">
          <div class="modal">
            <div class="modal__wrap">
              <img src="img/2.jpg" alt="" />
              <div class="modal__description">
                <p class="modal__name">
                  TYDEE BOX
                </p>
                <p class="modal__explain">
                  50,000 won
                </p>
              </div>
            </div>
          </div>
        </a>
        <a href="#">
          <div class="modal">
            <div class="modal__wrap">
              <img src="img/3.jpg" alt="" />
              <div class="modal__description">
                <p class="modal__name">
                  TYDEE BOX
                </p>
                <p class="modal__explain">
                  50,000 won
                </p>
              </div>
            </div>
          </div>
        </a>
        <a href="#">
          <div class="modal">
            <div class="modal__wrap">
              <img src="img/4.jpg" alt="" />
              <div class="modal__description">
                <p class="modal__name">
                  TYDEE BOX
                </p>
                <p class="modal__explain">
                  50,000 won
                </p>
              </div>
            </div>
          </div>
        </a>
        <a href="#">
          <div class="modal">
            <div class="modal__wrap">
              <img src="img/5.jpg" alt="" />
              <div class="modal__description">
                <p class="modal__name">
                  TYDEE BOX
                </p>
                <p class="modal__explain">
                  50,000 won
                </p>
              </div>
            </div>
          </div>
        </a>
        <a href="#">
          <div class="modal">
            <div class="modal__wrap">
              <img src="img/6.jpg" alt="" />
              <div class="modal__description">
                <p class="modal__name">
                  TYDEE BOX
                </p>
                <p class="modal__explain">
                  50,000 won
                </p>
              </div>
            </div>
          </div>
        </a>
        <a href="#">
          <div class="modal">
            <div class="modal__wrap">
              <img src="img/7.jpg" alt="" />
              <div class="modal__description">
                <p class="modal__name">
                  TYDEE BOX
                </p>
                <p class="modal__explain">
                  50,000 won
                </p>
              </div>
            </div>
          </div>
        </a>
        <a href="#">
          <div class="modal">
            <div class="modal__wrap">
              <img src="img/8.jpg" alt="" />
              <div class="modal__description">
                <p class="modal__name">
                  TYDEE BOX
                </p>
                <p class="modal__explain">
                  50,000 won
                </p>
              </div>
            </div>
          </div>
        </a>
      </section>
    </div>
	<%@ include file="./include/footer.jsp"%>
</body>
</html>