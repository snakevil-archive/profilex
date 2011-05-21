# Makefile
#
# AUTHOR     Snakevil Zen <zsnakevil@gmail.com>
# COPYRIGHT  © 2011 Snakevil.in.

PREFIX = $(HOME)
PROFILEX = $(PREFIX)/.local/ProfileX
PROFILEXRC = $(PREFIX)/.profilexrc

BackupFiles = $(notdir $(wildcard src/hook.d/*))

ProfileX:

install: ProfileX
	test -d $(dir $(PROFILEX)) || mkdir -p $(dir $(PROFILEX))
	rm -f $(PROFILEX)
	ln -s $(abspath src) $(PROFILEX)
	$(if $(wildcard $(addprefix $(PREFIX)/., $(BackupFiles))), \
		test -d $(PROFILEXRC)/backup || mkdir -p $(PROFILEXRC)/backup; \
		mv -t $(PROFILEXRC)/backup $(wildcard $(addprefix $(PREFIX)/., $(BackupFiles))) \
	)
	$(foreach file, $(notdir $(wildcard src/hook.d/*)), \
		ln -s .local/$(notdir $(PROFILEX))/hook.d/$(file) $(PREFIX)/.$(file); \
	)

uninstall: ProfileX
	$(if $(wildcard $(addprefix $(PREFIX)/., $(BackupFiles))), \
		rm -f $(wildcard $(addprefix $(PREFIX)/., $(BackupFiles))) \
	)
	rm -f $(PROFILEX)
	$(if $(wildcard $(addprefix $(PROFILEXRC)/backup/., $(BackupFiles))), \
		mv -t $(PREFIX) $(wildcard $(addprefix $(PROFILEXRC)/backup/., $(BackupFiles))) \
	)
	rm -fr $(PROFILEXRC)/backup

# vim:ft=make:fenc=utf-8:ff=unix:tw=120:ts=4:sts=4:noet:ai:si
# vim:nowrap:sw=4:nu:nuw=4:so=5:fen:fdm=indent
