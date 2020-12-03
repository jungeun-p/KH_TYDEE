const editor = new toastui.Editor({
    el: document.querySelector('#editor'),
    height: '300px',
    initialEditType: 'markdown',
    previewStyle: 'tab',
    toolbarItems: [
        'heading',
        'bold',
        'italic',
        'strike',
        'divider',
        'hr',
        'quote',
        'ul',
        'ol',
        'divider',
        'task',
        'indent',
        'outdent'
    ]
});
editor.getMarkdown();