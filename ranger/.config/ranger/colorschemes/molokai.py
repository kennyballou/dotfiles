#!/usr/bin/python2

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class Molokai(ColorScheme):
    progress_bar_color = 33

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            fg = 244
            if context.selected:
                attr = reverse
            else:
                attr = normal
            if context.empty or context.error:
                fg = 162
                bg = 234
            if context.border:
                fg = 248
            if context.image:
                fg = 208
            if context.video:
                fg = 81
            if context.audio:
                fg = 135
            if context.document:
                fg = 161
            if context.container:
                attr |= bold
                fg = 135
            if context.directory:
                attr |= bold
                fg = 33
            elif (context.executable and not
                  any((context.media, context.container,
                       context.fifo, context.socket))):
                attr |= bold
                fg = 43
            if context.socket:
                fg = 155
                attr |= bold
            if context.fifo or context.device:
                fg = 160
                if context.device:
                    attr |= bold
            if context.link:
                fg = context.good and 24
            if context.bad:
                fg = 117
                bg = 199
            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (89, 161):
                    fg = 199
                else:
                    fg = 89
            if not context.selected and (context.cut or context.copied):
                fg = 199
                attr |= bold
            if context.main_column:
                if context.selected:
                    attr |= bold
                if context.marked:
                    attr |= bold
                    fg = 201
            if context.badinfo:
                if attr & reverse:
                    bg = 95
                else:
                    fg = 95

        elif context.in_titlebar:
            attr |= bold
            if context.hostname:
                fg = context.bad and 16 or 255
                if context.bad:
                    bg = 166
            elif context.directory:
                fg = 33
            elif context.tab:
                if context.good:
                    fg = 47
                    bg = 237
            elif context.link:
                fg = 116

        elif context.in_statusbar:
            fg = 244
            if context.permissions:
                if context.good:
                    fg = 93
                elif context.bad:
                    fg = 161
            if context.marked:
                attr |= bold | reverse
                fg = 237
                bg = 47
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = 174
            if context.loaded:
                bg = self.progress_bar_color
            if context.vcsinfo:
                fg = 116
                attr &= ~bold
            if context.vcscommit:
                fg = 144
                attr &= ~bold

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = 116

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color

        return fg, bg, attr
