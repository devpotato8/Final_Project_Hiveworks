/*Documentation Init*/

/*Doc Search */
var options = {
    valueNames: ['component', 
        'category',
        { name: 'link', attr: 'href' }],
    item: `<li><a class="dropdown-item link">
                <span class="category"></span><span class="cat-sep">/</span><span class="component"></span>
        </a></li>`
};
$('.no-result').hide();
var docSearchList = new List('doc-list', options);
fetch("dist/doc-search.json")
.then(response => response.json())
.then(data => {
    docSearchList.add(data)
});
docSearchList.on('updated', function (list) {
    if (list.matchingItems.length > 0) {
        $('.no-result').hide();
    } else {
        $('.no-result').show();
    }
    var search_term = $('.doc-form-control').val();
    $('.category,.component').removeHighlight().highlight(search_term);
});

$(document).on("show.bs.dropdown","#doc-list .dropdown-toggle",function (e) {
    docSearchList.search();
}); 
$(document).on("keyup", function(e) {
    e.preventDefault();
    if (e.keyCode == 191) { 
        $('#doc-list .input-search input').trigger('focus');
        $("#doc-list .dropdown-toggle").dropdown('show');
    }               
}); 

/*Color Picker */
if( $('.color-palette-wrap').length > 0 ){
    var cCnt=0;
    const rgb2hex = (rgb) => `#${rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/).slice(1).map(n => parseInt(n, 10).toString(16).padStart(2, '0')).join('')}`
    $('.color-palette-wrap .color-wrap').each(function(){
        $(this).find('.color-code').html(rgb2hex($(this).css('background-color')));
        cCnt++;
    });
}
