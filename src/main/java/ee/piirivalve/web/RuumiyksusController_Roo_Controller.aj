// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.piirivalve.web;

import ee.piirivalve.entities.Riigi_admin_yksus;
import ee.piirivalve.entities.Ruumiyksus;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect RuumiyksusController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String RuumiyksusController.create(@Valid Ruumiyksus ruumiyksus, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("ruumiyksus", ruumiyksus);
            addDateTimeFormatPatterns(uiModel);
            return "ruumiyksuses/create";
        }
        uiModel.asMap().clear();
        ruumiyksus.persist();
        return "redirect:/ruumiyksuses/" + encodeUrlPathSegment(ruumiyksus.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String RuumiyksusController.createForm(Model uiModel) {
        uiModel.addAttribute("ruumiyksus", new Ruumiyksus());
        addDateTimeFormatPatterns(uiModel);
        return "ruumiyksuses/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String RuumiyksusController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("ruumiyksus", Ruumiyksus.findRuumiyksus(id));
        uiModel.addAttribute("itemId", id);
        return "ruumiyksuses/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String RuumiyksusController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("ruumiyksuses", Ruumiyksus.findRuumiyksusEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Ruumiyksus.countRuumiyksuses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("ruumiyksuses", Ruumiyksus.findAllRuumiyksuses());
        }
        addDateTimeFormatPatterns(uiModel);
        return "ruumiyksuses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String RuumiyksusController.update(@Valid Ruumiyksus ruumiyksus, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("ruumiyksus", ruumiyksus);
            addDateTimeFormatPatterns(uiModel);
            return "ruumiyksuses/update";
        }
        uiModel.asMap().clear();
        ruumiyksus.merge();
        return "redirect:/ruumiyksuses/" + encodeUrlPathSegment(ruumiyksus.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String RuumiyksusController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("ruumiyksus", Ruumiyksus.findRuumiyksus(id));
        addDateTimeFormatPatterns(uiModel);
        return "ruumiyksuses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String RuumiyksusController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Ruumiyksus.findRuumiyksus(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/ruumiyksuses";
    }
    
    @ModelAttribute("riigi_admin_yksuses")
    public Collection<Riigi_admin_yksus> RuumiyksusController.populateRiigi_admin_yksuses() {
        return Riigi_admin_yksus.findAllRiigi_admin_yksuses();
    }
    
    @ModelAttribute("ruumiyksuses")
    public Collection<Ruumiyksus> RuumiyksusController.populateRuumiyksuses() {
        return Ruumiyksus.findAllRuumiyksuses();
    }
    
    void RuumiyksusController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("ruumiyksus_muudetud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("ruumiyksus_avatud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("ruumiyksus_suletud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("ruumiyksus_alates_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("ruumiyksus_kuni_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String RuumiyksusController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
