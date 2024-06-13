<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Plataformas</title>
</head>
<body>
    <h1>Plataformas</h1>
    <a href="/plataformas/insert">Adicionar plataforma</a>
    <table>
        <tr>
            <th>Id</th>
            <th>Nome</th>
            <th></th>
        </tr>
        <c:forEach var="p" items="${plataformas}">
            <tr>
                <td>${p.id}</td>
                <td>${p.nome}</td>
                <td>
                    <a href="/plataformas/update/${p.id}">Editar</a> | 
                    <a href="/plataformas/delete/${p.id}">Excluir</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>