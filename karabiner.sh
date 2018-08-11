#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set private.ctrl_escape 1
/bin/echo -n .
$cli set general.treat_unifying_as_pointing_device 1
/bin/echo -n .
$cli set private.delete_backslash 1
/bin/echo -n .
$cli set general.disable_internal_keyboard_if_external_keyboard_exsits 1
/bin/echo -n .
$cli set option.vimode_hjkl 1
/bin/echo -n .
$cli set private.backslash_delete 1
/bin/echo -n .
/bin/echo
