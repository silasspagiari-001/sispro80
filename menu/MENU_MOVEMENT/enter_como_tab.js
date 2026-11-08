function afterrender(sender, eOpts) {
    var grid = sender;
    if (grid._notaEnterCleanup) grid._notaEnterCleanup();

    function onEnter(event) {
        if (grid.destroyed || event.isComposing ||
            (event.key !== 'Enter' && event.keyCode !== 13)) return;

        var plugin = grid.getPlugin('uniGridEditor') || grid.findPlugin('cellediting');
        var editor = plugin && plugin.getActiveEditor();
        var insideGrid = grid.el && grid.el.dom.contains(event.target);
        var insideEditor = editor && editor.editing && editor.el &&
            editor.el.dom.contains(event.target);
        if (!insideGrid && !insideEditor) return;

        // Impede o Enter de concluir a edicao ou navegar pelo formulario.
        event.preventDefault();
        event.stopImmediatePropagation();
        if (event.type !== 'keydown' || event.repeat) return;

        // Entrega Tab ao proprio editor: ExtJS/uniGUI valida, conclui e avanca.
        // Nao escolhe colunas nem chama completeEdit/startEdit manualmente.
        event.target.dispatchEvent(new KeyboardEvent('keydown', {
            key: 'Tab', code: 'Tab', keyCode: 9, which: 9,
            bubbles: true, cancelable: true, composed: true,
            shiftKey: event.shiftKey
        }));
    }

    var events = ['keydown', 'keypress', 'keyup'];
    events.forEach(function(name) { window.addEventListener(name, onEnter, true); });
    grid._notaEnterCleanup = function() {
        events.forEach(function(name) { window.removeEventListener(name, onEnter, true); });
    };
    grid.on('destroy', grid._notaEnterCleanup);
}
