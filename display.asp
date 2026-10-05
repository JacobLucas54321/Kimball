

<%@ Language="VBScript" %>
<%
Response.CacheControl = "no-cache"
Response.AddHeader "Pragma", "no-cache"
Response.Expires = -1
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Display Catalog</title>
</head>
<body>

<%
' -----------------------------
' Load connection string from Web.config
' -----------------------------
Dim xml, connString

Set xml = Server.CreateObject("MSXML2.DOMDocument")
xml.async = False
xml.load(Server.MapPath("Web.config"))

Dim node
Set node = xml.selectSingleNode("//connectionStrings/add[@name='KimballDb']")

If Not node Is Nothing Then
    connString = node.getAttribute("connectionString")
Else
    connString = "NOT FOUND"
End If

Response.Write "<h3>Connection String:</h3>"
Response.Write "<pre>" & connString & "</pre>"


' -----------------------------
' Connect to PostgreSQL
' -----------------------------
Dim conn, rs, cmd

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open connString

' -----------------------------
' Execute your stored procedure
' Example: CALL public.SelectCatalog()
' -----------------------------
Set rs = Server.CreateObject("ADODB.Recordset")

Set cmd = Server.CreateObject("ADODB.Command")
cmd.ActiveConnection = conn
cmd.CommandText = "SELECT * FROM public.""selectcatalog""()"
cmd.CommandType = 1  ' adCmdText

Set rs = cmd.Execute()

' -----------------------------
' Display results
' -----------------------------
Response.Write "<h3>Stored Procedure Output:</h3>"

If rs.EOF Then
    Response.Write "<p>No rows returned.</p>"
Else
    Response.Write "<table border='1' cellpadding='6'>"

    ' Header row
    Response.Write "<tr>"
    For i = 0 To rs.Fields.Count - 1
        Response.Write "<th>" & rs.Fields(i).Name & "</th>"
    Next
    Response.Write "</tr>"

    ' Data rows
    Do Until rs.EOF
        Response.Write "<tr>"
        For i = 0 To rs.Fields.Count - 1
            Response.Write "<td>" & rs.Fields(i).Value & "</td>"
        Next
        Response.Write "</tr>"
        rs.MoveNext
    Loop

    Response.Write "</table>"
End If

rs.Close
conn.Close
Set rs = Nothing
Set conn = Nothing
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

