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
        <a href="/jogos/insert">Adicionar jogo</a>
        <table class="table">
            <tr>
                <th>id</th>
                <th>nome</th>
                <th>categoria</th>
                <th>plataformas</th>
                <th></th>
            </tr>
            <c:forEach var="j" items="${jogo}">
                <tr>
                    <td>${j.getId()}</td>
                    <td>${j.getNome()}</td>
                    <td>${j.getCategoria().nome}</td>
                    <td>
                        <c:forEach varStatus="s" var="p" items="${j.plataformas}">
                            ${s.getCount() > 1 ? " / " : ""}
                            ${p.nome}
                        </c:forEach> 
                    </td>
                    <td>
                        <a href="/jogos/update/${j.id}">Editar</a> |
                        <a href="/jogos/delete/${j.id}">Excluir</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>