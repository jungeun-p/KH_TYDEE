function contentHidden() {
    let form = document.getElementsByTagName("form")[0];
    let input = document.createElement("input");
    input.setAttribute("type", "hidden");
    input.setAttribute("name", "item_content")
    input.setAttribute("value", editor.getMarkdown());
    document.querySelector("#editor").append(input);
}