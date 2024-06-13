<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Excluir Plataforma</title>
</head>
<body>
    <h1>Excluir Plataforma</h1>
    <p>Você tem certeza de que deseja escluir a plataforma ${plataforma.getNome()}?</p>
    <form action="/plataformas/delete" method="post">
        <input type="hidden" name="id" value="${plataforma.getId()}">
        <a href="/plataformas/list">Voltar</a>
        <button type="submit">Excluir</button>
    </form>
</body>
</html>