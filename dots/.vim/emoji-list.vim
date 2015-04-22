for e in emoji#list()
  call append(line('$'), printf('" %s (%s)', emoji#for(e), e))
endfor
