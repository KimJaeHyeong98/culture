<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>회원가입</title>
    <style>
      .error {
        color: red;
        font-size: 0.9em;
      }
    </style>
  </head>
  <body>
    <h1>회원가입</h1>

    <form:form modelAttribute="userVO" action="join-sy" method="post">
      <label
        >아이디<br />
        <form:input path="id" />
        <form:errors path="id" cssClass="error" /> </label
      ><br />

      <label
        >비밀번호<br />
        <form:input path="password" />
        <form:errors path="password" cssClass="error" /> </label
      ><br />

      <label
        >사용자 이름<br />
        <form:input path="name" />
        <form:errors path="name" cssClass="error" /> </label
      ><br />

      <label
        >휴대전화 번호<br />
        <form:input path="phone" />
        <form:errors path="phone" cssClass="error" /> </label
      ><br />

      <label
        >이메일 주소<br />
        <form:input path="email" />
        <form:errors path="email" cssClass="error" /> </label
      ><br /><br />

      <button type="submit">회원가입</button>
    </form:form>
  </body>
</html>
