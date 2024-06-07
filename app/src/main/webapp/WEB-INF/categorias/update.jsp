<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <title>Categorias</title>
        <link href="/css/bootstrap.min.css" rel="stylesheet" />
    </head>
    <body>
        <div class="container">
            <h1>Editar Categoria</h1>
            <form action="/categorias/update" method="post">
                <input type="hidden" name="id" value="${categoria.id}">
                <div>
                    <label>Nome</label>
                    <input type="text" name="nome" value="${categoria.nome}">
                </div>
                <a href="/categorias/list">Voltar</a>
                <button type="submit">Salvar</button>
            </form>
        </div>
    </body>
</html>

