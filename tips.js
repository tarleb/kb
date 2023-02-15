// List of tags selected by the user.
var selectedTags = new Set();

function filterByTag(tagname) {
    console.log([...selectedTags]);
    if (selectedTags.has(tagname)) {
        selectedTags.delete(tagname);
    } else {
        selectedTags.add(tagname);
    }
    console.log([...selectedTags]);
    document.querySelectorAll('.tip').forEach(tip => {
        const tags = (tip.dataset.tags || '').split(',');
        tip.hidden = [...selectedTags].some(st =>
            tags.indexOf(st) === -1
        );
    });
    document.querySelectorAll('.tag').forEach(tag => {
        if (selectedTags.has(tag.innerText)) {
            tag.classList.add('selected');
        } else {
            tag.classList.remove('selected');
        }
    });
}

function addTagListeners() {
    document.querySelectorAll('span.tag').forEach(el => {
        el.addEventListener('click', (event) => {
            filterByTag(el.innerText);
        });
    });
};

function initTagFilter() {
    addTagListeners();
}

if (document.readyState === 'loading') {  // Loading hasn't finished yet
    document.addEventListener('DOMContentLoaded', initTagFilter);
} else {  // `DOMContentLoaded` has already fired
    initTagFilter();
}
