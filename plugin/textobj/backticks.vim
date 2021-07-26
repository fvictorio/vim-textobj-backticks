" ============================================================================
" File: backticks.vim
" Description: Text objects for ranges between backticks
" Version: 0.1.0
" Author: Franco Victorio (github.com/fvictorio)
" License: MIT
" ============================================================================

" Avoid loading the plugin twise and allow the user to disable it
if exists('g:loaded_textobj_backticks')
  finish
endif
let g:loaded_textobj_backticks = 1

" :help use-cpo-save
let s:save_cpo = &cpoptions
set cpoptions&vim

call textobj#user#plugin('backticks', {
  \   'backticks-a': {
  \     'pattern': '`\_.\{-}`',
  \     'select': 'a`',
  \   },
  \   'backticks-i': {
  \     'pattern': '`\zs\_.\{-}\ze`',
  \     'select': 'i`',
  \   },
  \   'backticks-ii': {
  \     'sfile': expand('<sfile>'),
  \     'select-function': 's:BackticksInsideInside',
  \     'select': 'ii`',
  \   },
  \ })

function! s:BackticksInsideInside()
  " If the char under the cursor is a backtick,
  " stay there. Otherwise go back looking for a
  " backtick
  let l:char_under_cursor = matchstr(getline('.'), '\%'.col('.').'c.')
  if l:char_under_cursor !=# '`'
    execute "normal! ?\\v`\<cr>"
  endif
  " Then go to the first non-space char
  execute "normal! /\\v\\S\<cr>"
  " And save that position
  let l:head_pos = getpos('.')

  " Go to the next backtick, and then search
  " backwards for a non-space char
  execute "normal! /\\v`\<cr>"
  execute "normal! ?\\v\\S\<cr>"
  " And save that position too
  let l:tail_pos = getpos('.')

  return ['v', l:head_pos, l:tail_pos]
endfunction

let &cpoptions = s:save_cpo
unlet s:save_cpo
