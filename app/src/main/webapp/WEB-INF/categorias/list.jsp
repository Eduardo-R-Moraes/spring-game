<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <title>Categorias</title>
    </head>
    <body>
        <div class="container">
            <h1>Categorias</h1>
            <a href="/categorias/insert">Nova Categoria</a>
            <table class="table">
                <tr>
                    <th>Id</th>
                    <th>Nome</th>
                    <th></th>
                </tr>
                <c:forEach var="c" items="${categorias}">
                    <tr>
                        <td>${c.id}</td>
                        <td>${c.nome}</td>
                        <td>
                            <a href="/categorias/update/${c.id}">Editar</a> | 
                            <a href="/categorias/delete/${c.id}">Excluir</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>

