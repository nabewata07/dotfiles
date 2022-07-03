let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
  if g:airline_theme == 'molokai'
    for colors in values(a:palette.inactive)
      let colors[3] = 245
    endfor
  endif
endfunction
