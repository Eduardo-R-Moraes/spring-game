<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jogo</title>
</head>
<body>
    <div class="container">
        <h1>Remover Jogo</h1>
        <p>Tem certeza de que deseja excluir o jogo ${jogo.getNome()}?</p>
        <form action="/jogos/delete" method="post">
            <input type="hidden" name="id" value="${jogo.getId()}">
            <a href="/jogos/list">voltar</a>
            <button type="submit">Excluir</button>
        </form>
    </div>
</body>
</html>