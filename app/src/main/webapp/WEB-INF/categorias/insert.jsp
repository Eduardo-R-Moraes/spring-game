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
            <h1>Categorias</h1>
            <form action="/categorias/insert" method="post">
                <div>
                    <label>Nome</label>
                    <input type="text" name="nome" />
                </div>
                <hr>
                <a href="/categorias/list">Voltar</a>
                <button type="submit">Salvar</button>
            </form>
        </div>
    </body>
</html>

