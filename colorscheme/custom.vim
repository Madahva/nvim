highlight clear

if exists('syntax_on')
    syntax reset
endif

let g:colors_name = "custom"
set background=dark
set t_Co=256


let s:pink_100     = '#F3D0FF'
let s:pink_200     = '#B3B3FF'
let s:pink_300     = '#E698FF'
let s:pink_400     = '#E185FF'
let s:pink_500     = '#D966FF'
let s:pink_600     = '#C55DE8'
let s:pink_700     = '#9A48B5'
let s:pink_800     = '#77388C'
let s:pink_900     = '#5B2B6B'

let s:blue_100     = '#BDECF5'
let s:blue_200     = '#9DE3F0'
let s:blue_300     = '#70D7E9'
let s:blue_400     = '#55CFE5'
let s:blue_500     = '#00bfff'
let s:blue_600     = '#26B1CA'
let s:blue_700     = '#1E8A9E'
let s:blue_800     = '#176B7A'
let s:blue_900     = '#12525D'
let s:blue_1000    = '#08262B'

let s:cyan_100     = '#B0FFFF'
let s:cyan_200     = '#8AFFFF'
let s:cyan_300     = '#54FFFF'
let s:cyan_400     = '#33FFFF'
let s:cyan_500     = '#00FFFF'
let s:cyan_600     = '#00E8E8'
let s:cyan_700     = '#00B5B5'
let s:cyan_800     = '#008C8C'
let s:cyan_900     = '#006B6B'

let s:white        = '#ccf2ff'
let s:black        = '#1A1B26'
let s:grey         = '#24283b'


function! s:HL(group, fg, bg, attr)
    if !empty(a:fg)
        exec 'hi! ' . a:group . ' guifg=' . a:fg
    endif
    if !empty(a:bg)
        exec 'hi! ' . a:group . ' guibg=' . a:bg
    endif
    if !empty(a:attr)
        exec 'hi! ' . a:group . ' gui=' . a:attr . ' cterm=' . a:attr
    endif
endfunction


call s:HL('Normal',              s:cyan_500,    s:black,       'none')
call s:HL('EndOfBuffer',         s:black,       'NONE',        'none')
call s:HL('CursorLine',          '',            s:grey,        'bold')
call s:HL('SignColumn',          s:cyan_500,    'NONE',        '')
call s:HL('LineNr',              s:cyan_900,    'NONE',        '')
call s:HL('CursorLineNr',        s:white,       '',            '')
call s:HL('StatusLine',          s:cyan_500,    'NONE',        'italic')
call s:HL('StatusLineNC',        s:cyan_900,    s:black,       'bold')
call s:HL('Search',              s:black,       s:blue_100,    'bold')
call s:HL('Visual',              s:pink_500,    s:grey,        'italic')

call s:HL('Comment',             s:blue_500,    '',            'italic')
call s:HL('SpecialComment',      s:blue_500,    '',            'italic')
call s:HL('Todo',                s:pink_500,    '',            'bold')
call s:HL('Special',             s:cyan_500,    '',            'bold')
call s:HL('Constant',            s:blue_500,    '',            'bold')
call s:HL('String',              s:cyan_100,    '',            '')
call s:HL('Identifier',          s:cyan_500,    '',            '')
call s:HL('Function',            s:cyan_100,    '',            'bold')
call s:HL('Keyword',             s:blue_500,    '',            '')
call s:HL('Type',                s:pink_200,    '',            '')
call s:HL('Delimiter',           s:pink_500,    '',            '')
call s:HL('Underlined',          s:cyan_500,    '',            'italic')
call s:HL('Tag',                 s:blue_500,    '',            'none')
call s:HL('Operator',            s:pink_500,    '',            'none')
call s:HL('Debug',               s:pink_500,    '',            'none')
call s:HL('Error',               s:pink_500,    '',            'none')

call s:HL('DiffAdd',             s:blue_500,    '',            '')
call s:HL('DiffDelete',          s:cyan_500,    '',            '')
call s:HL('DiffChange',          s:white,       '',            '')
call s:HL('GitGutterAdd',        s:blue_500,    '',            '')
call s:HL('GitGutterDelete',     s:cyan_500,    '',            '')
call s:HL('GitGutterChange',     s:white,       '',            '')

call s:HL('cssIdentifier',       s:cyan_500,    '',            '')
call s:HL('cssImportant',        s:cyan_500,    '',            '')
call s:HL('cssAttr',             s:blue_700,    '',            '')
call s:HL('cssClassName',        s:blue_500,    '',            '')
call s:HL('cssClassNameDot',     s:blue_500,    '',            '')

call s:HL('javaScriptBoolean',   s:blue_500,    '',            '')

call s:HL('CmdLine',             s:pink_500,    s:black,       'none')  
call s:HL('Pmenu',               s:pink_100,    s:blue_1000,   'none')
call s:HL('PmenuSel',            s:cyan_500,    s:black,       'bold')   
call s:HL('WildMenu',            s:cyan_500,    s:black,       'bold')    

call s:HL('@variable',           s:pink_200,    '',            '')
call s:HL('@function',           s:blue_500,    '',            '')
call s:HL('@tag.delimiter.tsx',  s:cyan_500,    s:black,       'bold')    
call s:HL('@tag.attribute.tsx',  s:cyan_500,    s:black,       '')    
call s:HL('@lsp.type.type.typescriptreact',     s:cyan_500,    s:black,       'bold')

call s:HL('NotifyERRORBorder',   s:pink_500,    '',            '')
call s:HL('NotifyWARNBorder',    s:pink_200,    '',            '')
call s:HL('NotifyINFOBorder',    s:pink_200,    '',            '')
call s:HL('NotifyDEBUGBorder',   s:pink_500,    '',            '')
call s:HL('NotifyTRACEBorder',   s:pink_500,    '',            '')
call s:HL('NotifySUCCESSBorder', s:blue_500,    '',            '')

call s:HL('NotifyERRORIcon',     s:pink_500,    '',            '')
call s:HL('NotifyWARNIcon',      s:blue_200,    '',            '')
call s:HL('NotifyINFOIcon',      s:blue_200,    '',            '')
call s:HL('NotifyDEBUGIcon',     s:pink_500,    '',            '')
call s:HL('NotifyTRACEIcon',     s:pink_500,    '',            '')
call s:HL('NotifySUCCESSIcon',   s:cyan_500,    '',            '')

call s:HL('NotifyERRORTitle',    s:pink_500,    '',            '')
call s:HL('NotifyWARNTitle',     s:blue_200,    '',            '')
call s:HL('NotifyINFOTitle',     s:blue_200,    '',            '')
call s:HL('NotifyDEBUGTitle',    s:pink_500,    '',            '')
call s:HL('NotifyTRACETitle',    s:pink_500,    '',            '')
call s:HL('NotifySUCCESSTitle',  s:cyan_500,    '',            '')

call s:HL('NotifyERRORBody',     s:pink_500,    '',            '')
call s:HL('NotifyWARNBody',      s:blue_200,    '',            '')
call s:HL('NotifyINFOBody',      s:blue_200,    '',            '')
call s:HL('NotifyDEBUGBody',     s:pink_500,    '',            '')
call s:HL('NotifyTRACEBody',     s:pink_500,    '',            '')
call s:HL('NotifySUCCESSBody',   s:cyan_500,    '',            '')
