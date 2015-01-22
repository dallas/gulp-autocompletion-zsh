#!/usr/bin/env zsh

#
# gulp-autocompletion-zsh
# 
# Autocompletion for your gulp.js tasks
#
# Copyright(c) 2014 André König <andre.koenig@posteo.de>
# MIT Licensed
# 

#
# André König
# Github: https://github.com/akoenig
# Twitter: https://twitter.com/caiifr
#

#
# Grabs all available tasks from any `gulpfile.js` or
# `gulpfile.coffee` in the current directory.
#
function $$gulp_completion() {
    compls=$(grep -Eo "gulp.task\(? *([\"'](([a-zA-Z0-9]|-)*)[\"'],)" gulpfile.{js,coffee} 2>/dev/null | grep -Eo "[\"'](([a-zA-Z0-9]|-)*)[\"']" | sed s/"'"//g | sort)

    completions=(${=compls})
    compadd -- $completions
}

compdef $$gulp_completion gulp
