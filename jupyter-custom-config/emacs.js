// https://github.com/jupyter/notebook/issues/278

require(["codemirror/keymap/emacs", "notebook/js/cell", "base/js/namespace"],
    function(emacs_keymap, cell, IPython) {
        // setTimeout(function(){ // uncomment line to fake race-condition
        cell.Cell.options_default.cm_config.keyMap = 'emacs';
        var cells = IPython.notebook.get_cells();
        for(var c=0; c< cells.length ; c++){
            cells[c].code_mirror.setOption('keyMap', 'emacs');
        }

        // }, 1000)// uncomment  line to fake race condition
    }
);
