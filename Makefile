ana.ln: c:\Users\gurcei\AppData\Roaming\xemu-lgb\mega65\hdos\11.D81
	c1541 -attach "C:\Users\gurcei\AppData\Roaming\xemu-lgb\mega65\hdos\11.D81" -read ana.ln,s ana.ln
	c1541 -attach "C:\Users\gurcei\AppData\Roaming\xemu-lgb\mega65\hdos\11.D81" -read bas01.ln,s bas01.ln
	c1541 -attach "C:\Users\gurcei\AppData\Roaming\xemu-lgb\mega65\hdos\11.D81" -read bas02.ln,s bas02.ln
	c1541 -attach "C:\Users\gurcei\AppData\Roaming\xemu-lgb\mega65\hdos\11.D81" -read lyr01.ln,s lyr01.ln
	c1541 -attach "C:\Users\gurcei\AppData\Roaming\xemu-lgb\mega65\hdos\11.D81" -read lyr02.ln,s lyr02.ln
	c1541 -attach "C:\Users\gurcei\AppData\Roaming\xemu-lgb\mega65\hdos\11.D81" -read lyr03.ln,s lyr03.ln
	c1541 -attach "C:\Users\gurcei\AppData\Roaming\xemu-lgb\mega65\hdos\11.D81" -read enigma.p,s enigma.p
	c1541 -attach "C:\Users\gurcei\AppData\Roaming\xemu-lgb\mega65\hdos\MA203.D81" -read rotate.asm,s rotate.asm

define scr_putlogo
m65dbg -l tcp <<'EOF'
load logo.bin 40800
load logo.clr ff80000
quit
EOF
endef
export scr_putlogo

define scr_getlogo
m65dbg -l tcp <<'EOF'
save logo.bin 40800 fa0
save logo.clr ff80000 fa0
quit
EOF
endef
export scr_getlogo

getlogo:; @ eval "$$scr_getlogo"
putlogo:; @ eval "$$scr_putlogo"
