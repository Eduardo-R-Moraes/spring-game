<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adicionar Plataforma</title>
</head>
<body>
    <h1>Adicionar Plataforma</h1>
    <form action="/plataformas/insert" method="post">
        <div>
            <label>Nome</label>
            <input type="text", name="nome">
        </div>
        <hr>
        <a href="/plataformas/list">Voltar</a>
        <button type="submit">Salvar</button>
    </form>
</body>
</html>