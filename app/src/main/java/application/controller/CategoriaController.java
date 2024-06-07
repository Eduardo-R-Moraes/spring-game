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
import application.repository.categoriaRepository;

@Controller
@RequestMapping("/categorias")
public class CategoriaController {
    @Autowired
    private categoriaRepository categoriaRepo;

    @RequestMapping("/list")
    public String list(Model ui) {
        ui.addAttribute("categorias", categoriaRepo.findAll());
        return "/categorias/list";
    }

    @RequestMapping("/insert")
    public String insert() {
        return "/categorias/insert";
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(@RequestParam("nome") String nome) {
        Categoria categoria = new Categoria();
        categoria.setNome(nome);
        categoriaRepo.save(categoria);
        return "redirect:/categorias/list";
    }

    @RequestMapping("/update/{id}")
    public String update(@PathVariable long id, Model ui) {
        Optional<Categoria> resultado = categoriaRepo.findById(id);
        
        if(resultado.isPresent()) {
            ui.addAttribute("categoria", resultado.get());
            return "/categorias/update";
        }

        return "redirect:/categorias/list";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    public String update(@RequestParam("id") long id, @RequestParam("nome") String nome) {
        Optional<Categoria> resultado = categoriaRepo.findById(id);
        
        if(resultado.isPresent()) {
            resultado.get().setNome(nome);
            categoriaRepo.save(resultado.get());
        }

        return "redirect:/categorias/list";
    }
}
