package application.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import application.models.Categoria;
import application.models.Jogo;
import application.models.Plataforma;
import application.repository.CategoriaRepository;
import application.repository.JogoRepository;
import application.repository.PlataformaRepository;

@Controller
@RequestMapping("/jogos")
public class JogoController {

    @Autowired
    private JogoRepository jogoRepo;

    @Autowired
    private CategoriaRepository categoriaRepo;

    @Autowired
    private PlataformaRepository plataformaRepo;

    @RequestMapping("/list")
    public String list(Model ui) {
        ui.addAttribute("jogo", jogoRepo.findAll());
        return "/jogos/list";
    }

    @RequestMapping("/insert")
    public String insert(Model ui) {
        ui.addAttribute("categorias", categoriaRepo.findAll());
        ui.addAttribute("plataformas", plataformaRepo.findAll());
        return "/jogos/insert";
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(
        @RequestParam("nome") String nome,
        @RequestParam("categoria") long categoria,
        @RequestParam("plataformas") long[] plataformas
        ) {

        Optional<Categoria> resultado = categoriaRepo.findById(categoria);

        if(resultado.isPresent()) {
            Jogo jogo = new Jogo();
            jogo.setNome(nome);
            jogo.setCategoria(resultado.get());

            for(long p : plataformas) {
                Optional<Plataforma> result = plataformaRepo.findById(p);
                if(result.isPresent()) {
                    jogo.getPlataformas().add(result.get());
                }
            }

            jogoRepo.save(jogo);
            
        }

        return "redirect:/jogos/list";

    }

    @RequestMapping("/update/{id}")
    public String update(@PathVariable long id, Model ui) {

        Optional<Jogo> resultado = jogoRepo.findById(id);

        if(resultado.isPresent()) {
            ui.addAttribute("jogo", resultado.get());
            ui.addAttribute("categorias", categoriaRepo.findAll());
            ui.addAttribute("plataformas", plataformaRepo.findAll());
            return "/jogos/update";
        }

        return "redirect:/jogos/list";

    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(
        @RequestParam("id") long id, 
        @RequestParam("nome") String nome,
        @RequestParam("categoria") long categoria,
        @RequestParam("plataformas") long[] plataformas
        ) {

            Optional<Jogo> resultadoJogo = jogoRepo.findById(id);

            if(resultadoJogo.isEmpty()) { return "redirect:/jogos/list"; }

            Optional<Categoria> resultadoCategoria = categoriaRepo.findById(categoria);

            if(resultadoCategoria.isEmpty()) { return "redirect:/jogos/list"; }

            resultadoJogo.get().setNome(nome);
            resultadoJogo.get().setCategoria(resultadoCategoria.get());

            for(long p : plataformas) {
                Optional<Plataforma> resultadoPlataforma = plataformaRepo.findById(p);
                if(resultadoPlataforma.isPresent()) {
                    resultadoJogo.get().getPlataformas().add(resultadoPlataforma.get());
                }
            }

            jogoRepo.save(resultadoJogo.get());
            return "redirect:/jogos/list";

        }

    @RequestMapping("/delete/{id}")
    public String delete(Model ui, @PathVariable long id) {
        Optional<Jogo> resultado = jogoRepo.findById(id);

        if(resultado.isPresent()){
            ui.addAttribute("jogo", resultado.get());
            return "/jogos/delete";
        }

        return "redirect:/jogos/list";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam("id") long id) {
        jogoRepo.deleteById(id);
        return "redirect:/jogos/list";
    }
}
