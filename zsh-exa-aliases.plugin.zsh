# -*- mode: sh; sh-indentation: 4; indent-tabs-mode: nil; sh-basic-offset: 4; -*-

# Copyright (c) 2020 Sean Brandt

# According to the Zsh Plugin Standard:
# http://zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0=${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}
0=${${(M)0:#/*}:-$PWD/$0}

# Then ${0:h} to get plugin's directory

if [[ ${zsh_loaded_plugins[-1]} != */zsh-exa-aliases && -z ${fpath[(r)${0:h}]} ]] {
    fpath+=( "${0:h}" )
}

# Standard hash for plugins, to not pollute the namespace
typeset -gA Plugins
Plugins[ZSH_EXA_ALIASES_DIR]="${0:h}"

alias ls='exa -F --group-directories-first'
alias l='exa -lbF --group-directories-first'
alias ll='exa -lbGF --git --group-directories-first'
alias llm='exa -lbGd --git --sort=modified'                            # long list, modified date sort
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias lg='exa -TF'
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list
alias lS='exa -1'                                                              # one column, just names

# Use alternate vim marks [[[ and ]]] as the original ones can
# confuse nested substitutions, e.g.: ${${${VAR}}}

# vim:ft=zsh:tw=80:sw=4:sts=4:et:foldmarker=[[[,]]]
