/*****Ready function start*****/
$(function() {
    /*Clipboard Init*/
    var clipboard = new ClipboardJS('.copy-to-clipboard');

    clipboard.on('success', function(a) {
        var b = bootstrap.Tooltip.getInstance(a.trigger);
        b.setContent({ '.tooltip-inner': 'Copied!' }), a.trigger.addEventListener("hidden.bs.tooltip",()=>{b.setContent({".tooltip-inner":'Copy to clipboard'})}), a.clearSelection()
    });

    clipboard.on('error', function(a) {
        var b = /mac/i.test(navigator.userAgent) ? '\u2318' : 'Ctrl-',
        c = 'Press ' + b + 'C to copy',
        d = bootstrap.Tooltip.getInstance(a.trigger);
        d.setContent({ '.tooltip-inner': c }), a.trigger.addEventListener("hidden.bs.tooltip",()=>{d.setContent({".tooltip-inner":'Copy to clipboard'})}), a.clearSelection()
    });
    
	/*Clipboard for Codeblock Init*/
	var clipboardSnippets = new ClipboardJS('[data-clipboard-snippet]', {
		target: function(trigger) {
			return trigger.nextElementSibling;
		}
	});
	document.querySelectorAll('.copy-to-clipboard,[data-clipboard-snippet]').forEach(function(a) {
        var b = new bootstrap.Tooltip(a,{
			title: 'Copy to clipboard',
			placement: 'top'
		});
        a.addEventListener('mouseleave', function() {
            b.hide();
        })
    });
	clipboardSnippets.on('success', function(a) {
        var b = bootstrap.Tooltip.getInstance(a.trigger);
        b.setContent({ '.tooltip-inner': 'Copied!' }), a.trigger.addEventListener("hidden.bs.tooltip",()=>{b.setContent({".tooltip-inner":'Copy to clipboard'})}), a.clearSelection()
    });
	clipboardSnippets.on('error', function(a) {
        var b = /mac/i.test(navigator.userAgent) ? '\u2318' : 'Ctrl-',
            c = 'Press ' + b + 'C to copy',
            d = bootstrap.Tooltip.getInstance(a.trigger);
        d.setContent({ '.tooltip-inner': c }), a.trigger.addEventListener("hidden.bs.tooltip",()=>{d.setContent({".tooltip-inner":'Copy to clipboard'})}), a.clearSelection()
    });

});