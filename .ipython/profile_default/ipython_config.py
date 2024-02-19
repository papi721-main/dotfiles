#!/usr/bin/python3
"""My iPython config"""
# Configuration file for ipython.

c = get_config()  # noqa

# ------------------------------------------------------------------------------
# TerminalInteractiveShell(InteractiveShell) configuration
# ------------------------------------------------------------------------------
##
#  See also: InteractiveShell.ast_node_interactivity
# c.TerminalInteractiveShell.ast_node_interactivity = 'last_expr'

##
#  See also: InteractiveShell.ast_transformers
# c.TerminalInteractiveShell.ast_transformers = []

## Automatically add/delete closing bracket or quote when opening bracket or
#  quote is entered/deleted. Brackets: (), [], {} Quotes: '', ""
#  Default: False
# c.TerminalInteractiveShell.auto_match = False

##
#  See also: InteractiveShell.autoawait
# c.TerminalInteractiveShell.autoawait = True

##
#  See also: InteractiveShell.autocall
# c.TerminalInteractiveShell.autocall = 0

## Autoformatter to reformat Terminal code. Can be `'black'`, `'yapf'` or `None`
#  Default: None
# c.TerminalInteractiveShell.autoformatter = None

##
#  See also: InteractiveShell.autoindent
# c.TerminalInteractiveShell.autoindent = True

##
#  See also: InteractiveShell.automagic
# c.TerminalInteractiveShell.automagic = True

## Specifies from which source automatic suggestions are provided. Can be set to
#  ``'NavigableAutoSuggestFromHistory'`` (:kbd:`up` and :kbd:`down` swap
#  suggestions), ``'AutoSuggestFromHistory'``,  or ``None`` to disable automatic
#  suggestions. Default is `'NavigableAutoSuggestFromHistory`'.
#  Default: 'NavigableAutoSuggestFromHistory'
# c.TerminalInteractiveShell.autosuggestions_provider = 'NavigableAutoSuggestFromHistory'

## The part of the banner to be printed before the profile
#  See also: InteractiveShell.banner1
# c.TerminalInteractiveShell.banner1 = "Python 3.11.6 (main, Nov 14 2023, 09:36:21) [GCC 13.2.1 20230801]\nType 'copyright', 'credits' or 'license' for more information\nIPython 8.20.0 -- An enhanced Interactive Python. Type '?' for help.\n"

## The part of the banner to be printed after the profile
#  See also: InteractiveShell.banner2
# c.TerminalInteractiveShell.banner2 = ''

##
#  See also: InteractiveShell.cache_size
# c.TerminalInteractiveShell.cache_size = 1000

##
#  See also: InteractiveShell.color_info
c.TerminalInteractiveShell.color_info = True

## Set the color scheme (NoColor, Neutral, Linux, or LightBG).
#  See also: InteractiveShell.colors
c.TerminalInteractiveShell.colors = "Linux"

## Set to confirm when you try to exit IPython with an EOF (Control-D in Unix,
#  Control-Z/Enter in Windows). By typing 'exit' or 'quit', you can force a
#  direct exit without any confirmation.
#  Default: True
c.TerminalInteractiveShell.confirm_exit = False


## Shortcut style to use at the prompt. 'vi' or 'emacs'.
#  Default: 'emacs'
c.TerminalInteractiveShell.editing_mode = "vi"

## Set the editor used by IPython (default to $EDITOR/vi/notepad).
#  Default: 'nvim'
c.TerminalInteractiveShell.editor = "nvim"

## Add shortcuts from 'emacs' insert mode to 'vi' insert mode.
#  Default: True
c.TerminalInteractiveShell.emacs_bindings_in_vi_insert_mode = True

# [Prompt]
## Display the current vi mode (when using vi editing mode).
#  Default: True
c.TerminalInteractiveShell.prompt_includes_vi_mode = False

import os

## Class used to generate Prompt token for prompt_toolkit
#  Default: 'IPython.terminal.prompts.Prompts'
from IPython.terminal.prompts import Prompts, Token


class MyPrompt(Prompts):
    def in_prompt_tokens(self):
        return [(Token.Prompt, ">>> ")]


# c.TerminalInteractiveShell.prompts_class = 'IPython.terminal.prompts.Prompts'
c.TerminalInteractiveShell.prompts_class = MyPrompt

## Highlight matching brackets.
#  Default: True
c.TerminalInteractiveShell.highlight_matching_brackets = True

## The name or class of a Pygments style to use for syntax
#          highlighting. To see available styles, run `pygmentize -L styles`.
#  Default: traitlets.Undefined
c.TerminalInteractiveShell.highlighting_style = "one-dark"

RED = "#C70039"
WHITE = "#FFFFFF"
YELLOW = "#FFFF5C"
VIOLET = "#BD93F9"
c.TerminalInteractiveShell.highlighting_style_overrides = {
    Token.Prompt: RED,
    Token.PromptNum: RED,
    Token.OutPrompt: YELLOW,
    Token.OutPromptNum: YELLOW,
}

#  See also: InteractiveShell.separate_in
# c.TerminalInteractiveShell.separate_in = '\n'
c.TerminalInteractiveShell.separate_in = ""

#  See also: InteractiveShell.separate_out
# c.TerminalInteractiveShell.separate_out = ''

#  See also: InteractiveShell.separate_out2
# c.TerminalInteractiveShell.separate_out2 = ''
