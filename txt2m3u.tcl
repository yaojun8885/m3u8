#!/usr/bin/tclsh

set F [open [lindex $argv 0] "r"]
set lines [read $F]
set lines [split $lines \n]
close $F

set group "default"

puts "#EXTM3U"
foreach line $lines {
	set line [string trim $line]
	if {"" eq $line } {continue}
	set tmp [split $line ,]
	if {[llength $tmp] == 1 } {
		set group [lindex $tmp 0]
	} else {
		puts "#EXTINF:-1 group-title=\"$group\",[lindex $tmp 0]"
		puts "[lindex $tmp 1]1.m3u8"
	}
}
