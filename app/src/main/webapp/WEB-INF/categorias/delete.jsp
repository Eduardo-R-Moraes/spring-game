<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <title>Remover Categoria</title>
    </head>
    <body>
        <div class="container">
            <h1>Remover Categoria</h1>
            <p>Deseja mesmo remover a categoria ${categoria.getNome()}?</p>
            <form action="/categorias/delete" method="post">
                <input type="hidden" name="id" value="${categoria.getId()}">
                <a href="/categorias/list">Voltar</a>
                <button type="submit">Excluir</button>
            </form>
        </div>
    </body>
</html>

