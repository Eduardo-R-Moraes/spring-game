package application.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import application.models.Plataforma;
import application.repository.PlataformaRepository;

@Controller
@RequestMapping("/plataformas")
public class PlataformaController {
    @Autowired
    private PlataformaRepository plataformaRepo;

    @RequestMapping("/list")
    String list(Model ui) {
        ui.addAttribute("plataformas", plataformaRepo.findAll());
        return "plataformas/list";
    }

    @RequestMapping("/insert")
    String insert() {
        return "plataformas/insert";
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    String insert(@RequestParam("nome") String nome) {
        Plataforma plataforma = new Plataforma();
        plataforma.setNome(nome);
        plataformaRepo.save(plataforma);
        return "redirect:/plataformas/list";
    }

    @RequestMapping("/update/{id}")
    String update(@PathVariable long id, Model ui) {
        Optional<Plataforma> resultado = plataformaRepo.findById(id);

        if(resultado.isPresent()) {
            ui.addAttribute("plataforma", resultado.get());
            return "plataformas/update";
        }

        return "redirect:/plataformas/list";

    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    String update(
        @RequestParam("id") long id,
        @RequestParam("nome") String nome
        ) {
            Optional<Plataforma> resultado = plataformaRepo.findById(id);
            if(resultado.isPresent()) {
                resultado.get().setNome(nome);
                plataformaRepo.save(resultado.get());
            }
            return "redirect:/plataformas/list";
        }

    @RequestMapping("/delete/{id}")
    String delete(Model ui, @PathVariable long id) {
        Optional<Plataforma> resultado = plataformaRepo.findById(id);
        if(resultado.isPresent()) {
            ui.addAttribute("plataforma", resultado.get());
            return "/plataformas/delete";
        }
        return "redirect:/plataformas/list";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    String delete(@RequestParam("id") long id) {
        plataformaRepo.deleteById(id);
        return "redirect:/plataformas/list";
    }
}
