<%@ Language="VBScript" %>
<%
message = "Welcome to your Classic ASP website!"
currentTime = Now()
%>

<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <meta charset="utf-8" />
</head>
<body>
    <h1><%= message %></h1>

    <p>This page is served using Classic ASP.</p>
    <p>Current server time: <strong><%= currentTime %></strong></p>

    <hr />

    <nav>
        <a href="index.asp">Home</a> |
        <a href="about.asp">About</a> |
        <a href="contact.asp">Contact</a>
        <a href="display.asp">Display</a>
    </nav>
</body>
</html>
