# Copyright (c) 2018 ActiveState Software Inc.
# Released under the BSD-3 license. See LICENSE file for details.
#
# -*- tcl -*-
#
# xlvar - mklist /snit::widgetadaptor
#          Preconfigured 'variable' list.

package require mklist
package require snit

snit::widgetadaptor ::xlvar {

    delegate method * to hull
    delegate option * to hull

    variable view

    constructor {view_ args} {
	# We take ownership of this view.
	if {$view_ == {}} {
	    set view $view_
	} else {
	    $view_ as view
	}

	installhull [mklist $win $view \
		{scope name defn usen} \
		{Scope Name #Definitions #Uses}]

	$win configurelist $args
	$hull adjust 0 left
	$hull adjust 1 left
	return
    }
}

package provide xlvar 0.1
