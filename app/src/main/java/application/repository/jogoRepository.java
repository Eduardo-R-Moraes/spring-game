package application.repository;

import org.springframework.data.repository.CrudRepository;

import application.models.Jogo;

public interface jogoRepository extends CrudRepository<Jogo, Long> { } 