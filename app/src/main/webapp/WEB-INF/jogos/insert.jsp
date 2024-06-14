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
        <form action="/jogos/insert" method="post">
            <div>
                <label>Nome</label>
                <input type="text" name="nome" value="${jogo.getNome()}">
            </div>
            <div>
                <label>Categoria</label>
                <select name="categoria">
                    <c:forEach var="c" items="${categorias}">
                        <option value="${c.id}">${c.nome}</option> 
                    </c:forEach>
                </select>
            </div>
            <div>
                <label>Plataforma(s)</label>
                <c:forEach var="p" items="${plataformas}">
                    <div>
                        <input type="checkbox" value="${p.id}" name="plataformas">
                        <label>${p.nome}</label>
                    </div>
                </c:forEach>
            </div>
            <hr>
            <a href="/jogos/list">Voltar</a>
            <button type="submit">Salvar</button>
        </form>
    </div>
</body>
</html>