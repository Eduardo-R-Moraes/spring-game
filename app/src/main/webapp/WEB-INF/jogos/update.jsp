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
        <h1>Editar Jogo</h1>
        <form action="/jogos/update" method="post">
            <input type="hidden" name="id" value="${jogo.id}">
            <div>
                <label>Nome</label>
                <input type="text" name="nome" value="${jogo.nome}">
            </div>
            <hr>
            <a href="/jogos/list">Voltar</a>
            <button type="submit">Salvar</button>
        </form>
    </div>
</body>
</html>