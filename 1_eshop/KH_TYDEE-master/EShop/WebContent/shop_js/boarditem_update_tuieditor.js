const editor = new toastui.Editor({
    el: document.querySelector('#editor'),
    height: '500px',
    initialEditType: 'markdown',
    initialValue: `${item.item_content}`,
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