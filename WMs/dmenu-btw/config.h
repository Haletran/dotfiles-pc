/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */


static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"JetbrainsMono Nerd Font:size=10"
};
static const char *prompt      = NULL; 
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#c0c4c6", "#04131D" },
	[SchemeSel] = { "#c0c4c6", "#4A6672" },
	[SchemeOut] = { "#c0c4c6", "#A3D0DD" },
};

/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
