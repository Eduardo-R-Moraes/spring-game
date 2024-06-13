<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Plataforma</title>
</head>
<body>
    <h1>Editar Plataforma</h1>
    <form action="/plataformas/update" method="post">
        <input type="hidden" name="id" value="${plataforma.id}">
        <div>
            <label>Nome</label>
            <input type="text" name="nome" value="${plataforma.nome}">
        </div>
        <a href="/plataformas/list">Voltar</a>
        <button type="submit">Salvar</button>
    </form>
</body>
</html>