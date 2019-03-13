// https://github.com/jupyter/notebook/issues/278

require(["codemirror/keymap/vim", "notebook/js/cell", "base/js/namespace"],
  function(vim_keymap, cell, IPython) {
    cell.Cell.options_default.cm_config.keyMap = 'vim';
    var cells = IPython.notebook.get_cells();
    for(let c = 0 ; c < cells.length ; c++){
      cells[c].code_mirror.setOption('keyMap', 'vim');
    }
  }
);
