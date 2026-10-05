<%@ Language="VBScript" %>

<!DOCTYPE html>
<html>
<head>
    <title>Contact</title>
    <meta charset="utf-8" />
</head>
<body>
    <h1>Contact Us</h1>

    <p>If you would like to reach out, fill in the form below.</p>

    <form method="post" action="contact.asp">
        <label>Name:</label><br />
        <input type="text" name="name" /><br /><br />

        <label>Message:</label><br />
        <textarea name="message" rows="5" cols="40"></textarea><br /><br />

        <input type="submit" value="Send" />
    </form>

    <%
    ' Simple form handler
    If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
        Response.Write "<hr />"
        Response.Write "<h3>Thank you for your message!</h3>"
        Response.Write "<p><strong>Name:</strong> " & Server.HTMLEncode(Request.Form("name")) & "</p>"
        Response.Write "<p><strong>Message:</strong> " & Server.HTMLEncode(Request.Form("message")) & "</p>"
    End If
    %>

    <hr />

    <nav>
        <a href="index.asp">Home</a> |
        <a href="about.asp">About</a> |
        <a href="contact.asp">Contact</a>
        <a href="display.asp">Display</a>
    </nav>
</body>
</html>
