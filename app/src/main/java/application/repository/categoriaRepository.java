package application.repository;

import org.springframework.data.repository.CrudRepository;
import application.models.Categoria;

public interface categoriaRepository extends CrudRepository<Categoria, Long> { }