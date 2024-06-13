<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jogos</title>
</head>
<body>
    <div class="container">
        <h1>Jogos</h1>
        <a href="/jogos/insert">Adicionar jogo</a>
        <table class="table">
            <tr>
                <th>id</th>
                <th>nome</th>
                <th></th>
            </tr>
            <c:forEach var="j" items="${jogo}">
                <tr>
                    <td>${j.id}</td>
                    <td>${j.nome}</td>
                    <td>
                        <a href="/jogos/update/${j.id}">Editar</a> |
                        <a href="/jogos/delete/${j.id}">Excluir</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>