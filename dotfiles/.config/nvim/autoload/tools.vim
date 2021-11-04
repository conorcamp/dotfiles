" helper for resizing splits
function! tools#resizeSplit(dir)
  let this = winnr()
  if '+' == a:dir || '-' == a:dir
    execute "normal \<c-w>k"
    let up = winnr()
    if up != this
      execute "normal \<c-w>j"
      let x = 'bottom'
    else
      let x = 'top'
    endif
  elseif '>' == a:dir || '<' == a:dir
    execute "normal \<c-w>h"
    let left = winnr()
    if left != this
      execute "normal \<c-w>l"
      let x = 'right'
    else
      let x = 'left'
    endif
  endif
  if ('+' == a:dir && 'bottom' == x) || ('-' == a:dir && 'top' == x)
    execute "normal 5\<C-W>+"
  elseif ('-' == a:dir && 'bottom' == x) || ('+' == a:dir && 'top' == x)
    execute "normal 5\<C-W>-"
  elseif ('<' == a:dir && 'left' == x) || ('>' == a:dir && 'right' == x)
    execute  "normal 5\<C-W><"
  elseif ('>' == a:dir && 'left' == x) || ('<' == a:dir && 'right' == x)
    execute "normal 5\<C-W>>"
  else
    echo "oops. check your ~/.vimrc"
    return ""
  endif
endfunction
