ana.ln: c:\Users\gurcei\AppData\Roaming\xemu-lgb\mega65\hdos\11.D81
	c1541 -attach "C:\Users\gurcei\AppData\Roaming\xemu-lgb\mega65\hdos\11.D81" -read ana.ln,s ana.ln
	c1541 -attach "C:\Users\gurcei\AppData\Roaming\xemu-lgb\mega65\hdos\11.D81" -read bas01.ln,s bas01.ln
	c1541 -attach "C:\Users\gurcei\AppData\Roaming\xemu-lgb\mega65\hdos\11.D81" -read bas02.ln,s bas02.ln
	c1541 -attach "C:\Users\gurcei\AppData\Roaming\xemu-lgb\mega65\hdos\11.D81" -read lyr01.ln,s lyr01.ln
	c1541 -attach "C:\Users\gurcei\AppData\Roaming\xemu-lgb\mega65\hdos\11.D81" -read lyr02.ln,s lyr02.ln
	c1541 -attach "C:\Users\gurcei\AppData\Roaming\xemu-lgb\mega65\hdos\11.D81" -read lyr03.ln,s lyr03.ln
	c1541 -attach "C:\Users\gurcei\AppData\Roaming\xemu-lgb\mega65\hdos\11.D81" -read enigma.p,s enigma.p
	c1541 -attach "silent.d81" -read rotate.asm,s rotate.asm
	c1541 -attach "silent.d81" -read bas.bin bas.bin
	c1541 -attach "silent.d81" -read bas.dat bas.dat

xemu:
	/c/Jenkins/Projects/xemu/build/bin/xmega65.native -rom /c/Users/gurcei/Downloads/920385.bin -hdosvirt -uartmon :4510 -8 silent.d81 &

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

define scr_putlogo_bg
m65dbg -l tcp <<'EOF'
load logo_bg.bin 40800
load logo_bg.clr ff80000
quit
EOF
endef
export scr_putlogo_bg

define scr_putlogo_b
m65dbg -l tcp <<'EOF'
load logo_b.bin 40800
load logo_b.clr ff80000
quit
EOF
endef
export scr_putlogo_b

define scr_putlogo_a
m65dbg -l tcp <<'EOF'
load logo_a.bin 40800
load logo_a.clr ff80000
quit
EOF
endef
export scr_putlogo_a

define scr_putlogo_s
m65dbg -l tcp <<'EOF'
load logo_s.bin 40800
load logo_s.clr ff80000
quit
EOF
endef
export scr_putlogo_s

getlogo:; @ eval "$$scr_getlogo"
putlogo:; @ eval "$$scr_putlogo"

putlogo_bg:; @ eval "$$scr_putlogo_bg"
putlogo_b:; @ eval "$$scr_putlogo_b"
putlogo_a:; @ eval "$$scr_putlogo_a"
putlogo_s:; @ eval "$$scr_putlogo_s"
