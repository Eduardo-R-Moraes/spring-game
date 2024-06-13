package application.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import application.models.Jogo;
import application.repository.jogoRepository;

@Controller
@RequestMapping("/jogos")
public class JogoController {

    @Autowired
    jogoRepository jogoRepo;

    @RequestMapping("/list")
    String list(Model ui) {
        ui.addAttribute("jogo", jogoRepo.findAll());
        return "/jogos/list";
    }

    @RequestMapping("/insert")
    String insert() {
        return "/jogos/insert";
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    String insert(@RequestParam("nome") String nome) {
        Jogo jogo = new Jogo();
        jogo.setNome(nome);
        jogoRepo.save(jogo);
        return "redirect:/jogos/list";
    }

    @RequestMapping("/update/{id}")
    String update(@PathVariable long id, Model ui) {

        Optional<Jogo> resultado = jogoRepo.findById(id);

        if(resultado.isPresent()) {
            ui.addAttribute("jogo", resultado.get());
            return "/jogos/update";
        }

        return "redirect:/jogos/list";

    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    String update(
        @RequestParam("id") long id, 
        @RequestParam("nome") String nome
        ) {

            Optional<Jogo> resultado = jogoRepo.findById(id);

            if(resultado.isPresent()) {
                resultado.get().setNome(nome);
                jogoRepo.save(resultado.get());
            }

            return "redirect:/jogos/list";

        }

    @RequestMapping("/delete/{id}")
    String delete(Model ui, @PathVariable long id) {
        Optional<Jogo> resultado = jogoRepo.findById(id);

        if(resultado.isPresent()){
            ui.addAttribute("jogo", resultado.get());
            return "/jogos/delete";
        }

        return "redirect:/jogos/list";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    String delete(@RequestParam("id") long id) {
        jogoRepo.deleteById(id);
        return "redirect:/jogos/list";
    }
}
