package application.repository;

import org.springframework.data.repository.CrudRepository;
import application.models.Categoria;

public interface CategoriaRepository extends CrudRepository<Categoria, Long> { }