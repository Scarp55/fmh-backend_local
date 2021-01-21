package ru.iteco.fmh.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import ru.iteco.fmh.dto.NoteDto;
import ru.iteco.fmh.dto.NoteShortInfoDto;
import ru.iteco.fmh.service.INoteService;

import java.util.List;

@Api(description = "Работа с записками")
@RestController
@RequestMapping("/note")
public class NoteController {

    @Autowired
    INoteService noteService;

    @ApiOperation(value = "реестр всех записок с учетом пагинации")
    @GetMapping
    public List<NoteShortInfoDto> getAllNotes(
            @ApiParam(value = "начальная позиция пагинации", required = true) @RequestParam("offset") Integer offset,
            @ApiParam(value = "конечная позиция пагинации", required = true) @RequestParam("limit") Integer limit,
            @ApiParam(value = "показывать только активные записки") @RequestParam("show_active") Boolean showActive
    ) {
        return noteService.getAllNotes();
    }

    @ApiOperation(value = "возвращает полную информацию по записке")
    @GetMapping("/{id}")
    public NoteDto getNote(
            @ApiParam(value = "идентификатор записки", required = true)@PathVariable("id") Integer id
    ){
        return noteService.getNote(id);
    }

    @ApiOperation(value = "создает новую записку, возвращает ид новой записки")
    @PostMapping
    public NoteDto createNote(
            @RequestBody NoteDto noteDto
    ) {
        return noteService.createNote(noteDto);
    }

    @ApiOperation(value = "обновляет информацию по записке")
    @PatchMapping
    public NoteDto updateNote(
            @RequestBody NoteDto noteDto
    ) {
        return noteService.createNote(noteDto);
    }
}
