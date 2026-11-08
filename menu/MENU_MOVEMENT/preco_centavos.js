    // Coluna PRECO identificada na ordem original do DFM, antes de reordenar.
    var priceColumn = grid.getColumnManager().getColumns()[7];
    function priceEditor(event) {
        var plugin = grid.getPlugin('uniGridEditor') || grid.findPlugin('cellediting');
        var editor = plugin && plugin.getActiveEditor();
        if (!editor || !editor.editing || !editor.context ||
            editor.context.column !== priceColumn || !editor.field.inputEl ||
            event.target !== editor.field.inputEl.dom) return null;
        return editor.field;
    }
    function writeCents(field, cents) {
        if (!Number.isSafeInteger(cents) || cents < 0) return;
        var value = cents / 100;
        field.setValue(value);
        field.setRawValue(value.toFixed(2).replace('.', field.decimalSeparator || '.'));
        var input = field.inputEl.dom;
        input.setSelectionRange(input.value.length, input.value.length);
    }
    function priceKey(event) {
        if (event.isComposing || event.ctrlKey || event.metaKey || event.altKey) return;
        var field = priceEditor(event);
        if (!field) return;
        var digit = /^[0-9]$/.test(event.key);
        if (!digit && event.key !== 'Backspace' && event.key !== 'Delete' &&
            event.key !== ',' && event.key !== '.') return;
        event.preventDefault();
        event.stopImmediatePropagation();
        if (event.key === ',' || event.key === '.') return;
        var input = field.inputEl.dom;
        var selectedAll = input.selectionStart === 0 && input.selectionEnd === input.value.length;
        var cents = selectedAll ? 0 : Math.round((Number(field.getValue()) || 0) * 100);
        if (digit) cents = cents * 10 + Number(event.key);
        else if (event.key === 'Backspace') cents = Math.floor(cents / 10);
        else cents = 0;
        writeCents(field, cents);
    }
    function pricePaste(event) {
        var field = priceEditor(event);
        if (!field) return;
        var text = event.clipboardData.getData('text').trim();
        event.preventDefault();
        event.stopImmediatePropagation();
        // Colagem sem separador: centavos. Com separador: valor decimal.
        if (/^\d+$/.test(text)) writeCents(field, Number(text));
        else if (/^\d+[.,]\d{1,2}$/.test(text))
            writeCents(field, Math.round(Number(text.replace(',', '.')) * 100));
    }
    window.addEventListener('keydown', priceKey, true);
    window.addEventListener('paste', pricePaste, true);
    grid.on('destroy', function() {
        window.removeEventListener('keydown', priceKey, true);
        window.removeEventListener('paste', pricePaste, true);
    });
